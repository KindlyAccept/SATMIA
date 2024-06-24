package spatial_templates.histogram

import chisel3._
import chisel3.util._
import spatial_templates.addrgen._
import spatial_templates.pe._
import spatial_templates.me._
import spatial_templates.mi._
import spatial_templates.dfe._

// 定义 Histogram 的数据通路 ：
// TODO：这应该是与Histogram内存之间的通信，可能后续不需要多bank
class HistogramAddrGenPassthroughIO(addr_width: Int = 32, data_width: Int, n_banks: Int) extends AddressGeneratorPassthroughIO {
    def get_bank_bits(n_banks: Int): Int = {
        if (n_banks > 1)
            return log2Ceil(n_banks)
        else
            return 0
    }
	// 数据流接口
	// get_bank_bits(n_banks) 主要用于增加地址位数，以便于在多银行系统中正确地寻址，而与传输的数据位数无关。
    val in_data = Input(UInt((addr_width + get_bank_bits(n_banks)).W))	         
    val in_hist_addr = Input(UInt((addr_width + get_bank_bits(n_banks)).W))
    val in_bins = Input(UInt((addr_width + get_bank_bits(n_banks)).W))
	
    val reset_setup = Input(Bool())
}

// 定义 Histogram PE 与其控制器之间的通信接口
// TODO：这应该是将数据给到DFE：当前数据、当前直方图灰度、当前灰度计数
class HistogramAddrGenCtrl(addr_width: Int, data_width: Int, n_banks: Int) extends Bundle {
    def get_bank_bits(n_banks: Int): Int = {
        if (n_banks > 1)
            return log2Ceil(n_banks)
        else
            return 0
    }
    // 数据流接口
    val data_vals = Decoupled(UInt(data_width.W))  // 输入数据
    val hist_vals = Flipped(Decoupled(UInt(data_width.W)))  // 直方图数据
    // 控制信号
    val bin_counts = Decoupled(UInt(data_width.W))  // 每个 bin 的计数
}

class HistogramAddressGenerator(addr_width: Int, data_width: Int, n_banks: Int, bank: Int)
    extends QueueAddressGenerator(4, 1, addr_width, data_width, n_banks, bank)
    with AddrGenWithPassthrough
    with AddrGenWithDFE
    with AddrGenWithME {

    val ctrl_io = IO(new HistogramAddrGenCtrl(addr_width, data_width, n_banks))
    val pe_ctrl_io = IO(new HistogramAddrGenPassthroughIO(addr_width, data_width, n_banks))

    // 初始化 ctrl_io 和 mem_io 中的所有信号为 DontCare
    ctrl_io.hist_vals.ready := DontCare
    ctrl_io.data_vals.valid := DontCare
    ctrl_io.data_vals.bits := DontCare
    ctrl_io.hist_vals.bits := DontCare
    ctrl_io.bin_counts.valid := DontCare
    ctrl_io.bin_counts.bits := DontCare

    for (i <- 0 until mem_io.addressRequests.size) {
        mem_io.addressRequests(i).valid := DontCare
        mem_io.addressRequests(i).bits := DontCare
    }

    for (i <- 0 until mem_io.dataResponses.size) {
        mem_io.dataResponses(i).ready := DontCare
    }

    for (i <- 0 until mem_io.writeRequests.size) {
        mem_io.writeRequests(i).valid := DontCare
        mem_io.writeRequests(i).bits.address := DontCare
        mem_io.writeRequests(i).bits.data := DontCare
    }

    mem_io.generatingRequests := DontCare // 确保 mem_io.generatingRequests 被初始化

    // 状态寄存器编码当前问题维度
    val base_data = Reg(UInt((addr_width).W))
    val base_hist = Reg(UInt((addr_width).W))
    val num_bins = Reg(UInt((addr_width).W))

    // 当前正在处理的数据和 bin 计数
    val curr_data = Reg(UInt((addr_width).W))
    val curr_bin = Reg(UInt((addr_width).W))
    val bin_counts = Reg(UInt((addr_width).W))

    // 初始化寄存器
    when(pe_ctrl_io.reset_setup) {
        base_data := pe_ctrl_io.in_data
        base_hist := pe_ctrl_io.in_hist_addr
        num_bins := pe_ctrl_io.in_bins
        curr_data := 0.U
        curr_bin := 0.U
        bin_counts := 0.U
    }

    // 请求和响应逻辑：它支持流水线操作，因为地址的计算和请求发起可以与数据的实际读取和处理并行进行。
    // 1. 向内存发送数据读取 Request
    when(mem_io.addressRequests(0).ready) {
        mem_io.addressRequests(0).bits := base_data + curr_data
        mem_io.addressRequests(0).valid := true.B
        curr_data := curr_data + 1.U
    } .otherwise {
        mem_io.addressRequests(0).bits := DontCare
        mem_io.addressRequests(0).valid := false.B
    }

    // 2. 从内存接受数据 Response
    when(mem_io.dataResponses(0).valid) {
        ctrl_io.data_vals.bits := mem_io.dataResponses(0).bits
        ctrl_io.data_vals.valid := true.B
        mem_io.dataResponses(0).ready := ctrl_io.data_vals.ready
    } .otherwise {
        ctrl_io.data_vals.bits := DontCare
        ctrl_io.data_vals.valid := false.B
        mem_io.dataResponses(0).ready := false.B
    }

    // 3. 处理直方图 bin 的写请求
    //  直方图处理完成后再统一写入，遍历所有bin
    when(mem_io.writeRequests(0).ready && ctrl_io.hist_vals.valid) {
        mem_io.writeRequests(0).bits.address := base_hist + curr_bin
        mem_io.writeRequests(0).bits.data := ctrl_io.hist_vals.bits
        mem_io.writeRequests(0).valid := true.B
        curr_bin := curr_bin + 1.U
    } .otherwise {
        mem_io.writeRequests(0).bits.address := DontCare
        mem_io.writeRequests(0).bits.data := DontCare
        mem_io.writeRequests(0).valid := false.B
    }

    // 4. 更新 bin 计数
    when(ctrl_io.bin_counts.ready) {
        bin_counts := ctrl_io.bin_counts.bits
        ctrl_io.bin_counts.valid := true.B
    } .otherwise {
        ctrl_io.bin_counts.valid := false.B
    }
}

trait WithHistogramAddrGen extends DataflowPE 
    with WithAddrGenToMem
    with WithPassthroughAddrGen
    with WithAddrGenToDFE {
    val pe_addr_gen: HistogramAddressGenerator
    val pe_dfe: HistogramEngine

    /**
      * Handles interconnecting this component to the DataflowPE outer interface.
      * In this generator, we assume 4 read-write queues, mapped to 
      * addressRequests[0-3], and 1 write only queue mapped to writeRequests(0)
      */
    override def connectToMEInterface() {
        // Connect the output queue as a write-only queue
        connectToOutgoingRequest(0, 
            true.B, 
            pe_addr_gen.mem_io.writeRequests(0).bits.address,
            pe_addr_gen.mem_io.writeRequests(0).bits.data, 
            pe_addr_gen.mem_io.writeRequests(0).ready, 
            pe_addr_gen.mem_io.writeRequests(0).valid
        )
        
        // Connect read requests and responses
        for (i <- 1 until 5) {
            connectToOutgoingRequest(i, // queue index
                false.B, // write=false (this interface is reading)
                pe_addr_gen.mem_io.addressRequests(i-1).bits, // address to read
                0.U, // dataIn is set to 0 since we are reading
                pe_addr_gen.mem_io.addressRequests(i-1).ready, 
                pe_addr_gen.mem_io.addressRequests(i-1).valid
            )
            // Connect data read queues to data responses interfaces in this generator
            connectToReadQueue(i-1, pe_addr_gen.mem_io.dataResponses(i-1).bits, pe_addr_gen.mem_io.dataResponses(i-1).valid, pe_addr_gen.mem_io.dataResponses(i-1).ready)
        }
    }

    override def connectAddrGenToDFE() {

        val inQueue_0 = Module(new Queue(chiselTypeOf(pe_addr_gen.ctrl_io.data_vals.bits), 2))
        val outQueue = Module(new Queue(chiselTypeOf(pe_addr_gen.ctrl_io.hist_vals.bits), 2))

        // Connect data values to the first input
        pe_dfe.io.inData.bits := inQueue_0.io.deq.bits
        pe_dfe.io.inData.valid := inQueue_0.io.deq.valid
        inQueue_0.io.deq.ready := pe_dfe.io.inData.ready

        inQueue_0.io.enq.bits := pe_addr_gen.ctrl_io.data_vals.bits
        inQueue_0.io.enq.valid := pe_addr_gen.ctrl_io.data_vals.valid
        pe_addr_gen.ctrl_io.data_vals.ready := inQueue_0.io.enq.ready

        // Connect histogram values to the output
        outQueue.io.enq.bits := pe_dfe.io.outData.bits
        outQueue.io.enq.valid := pe_dfe.io.outData.valid
        pe_dfe.io.outData.ready := outQueue.io.enq.ready

        pe_addr_gen.ctrl_io.hist_vals.bits := outQueue.io.deq.bits
        pe_addr_gen.ctrl_io.hist_vals.valid := outQueue.io.deq.valid
        outQueue.io.deq.ready := pe_addr_gen.ctrl_io.hist_vals.ready

        // Connect control signals
        pe_dfe.io.ctrl_io.resetCounter.bits := pe_addr_gen.ctrl_io.bin_counts.bits
        pe_dfe.io.ctrl_io.resetCounter.valid := pe_addr_gen.ctrl_io.bin_counts.valid
        pe_addr_gen.ctrl_io.bin_counts.ready := pe_dfe.io.ctrl_io.resetCounter.ready
    }
}
