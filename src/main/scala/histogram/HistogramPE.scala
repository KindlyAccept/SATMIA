package spatial_templates.histogram

import chisel3._
import chisel3.util._
import spatial_templates.pe._
import spatial_templates.dfe._

class HistogramPE(
    id: ElemId,
    io_bundle: CtrlInterfaceIO,
    p_width: Int,
    addr_width: Int,
    data_width: Int,
    rQueueDepth: Int,
    n_banks: Int,
    bank_id: Int,
    dfe_queue_size: Int
) extends DataflowPE (
    id, io_bundle, p_width, addr_width + log2Up(n_banks), 5, 4, rQueueDepth
) with WithHistogramAddrGen {

    val pe_addr_gen = Module(new HistogramAddressGenerator(addr_width, data_width, n_banks, bank_id))
    val addr_gen_ctrl_io = IO(new HistogramAddrGenPassthroughIO(addr_width, data_width, n_banks))
    val pe_dfe = Module(new HistogramEngine(dfe_queue_size, data_width))

    connectAddrGenToDFE()
    connectToMEInterface()
    connectAddrGenPassthrough()

    // PE general control signals to the outside world
    io.ctrl_cmd.ready := true.B 
    io.idle := !pe_addr_gen.mem_io.generatingRequests && pe_dfe.io.ctrl_io.idle

    // // 连接内存接口
    // pe_dfe.io.inData <> pe_addr_gen.mem_io.dataResponses(0)
}
