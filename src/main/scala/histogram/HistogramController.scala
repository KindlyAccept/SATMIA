package spatial_templates.histogram

import chisel3._
import chisel3.util._
import spatial_templates.mi._


class HistogramPEControlIO extends Bundle {
  val start = Input(Bool())
  val reset = Input(Bool())
  val idle = Output(Bool())
}

class HistogramController(addr_width: Int, data_width: Int, n_pe: Int, n_banks: Int, qSize: Int) extends Module {
  val io = IO(new Bundle {
    val mem_io = new NtoMMemInterfaceIO(data_width, addr_width, n_banks, n_pe)
    val pe_ctrl = Vec(n_pe, new HistogramPEControlIO())
    val final_histogram = Output(Vec(256, UInt(32.W))) // 最终的直方图
  })

  // 地址生成
  val addrGen = RegInit(0.U(addr_width.W))
  val peIndex = RegInit(0.U(log2Ceil(n_pe).W))

  // 各 PE 的直方图结果
  val peHistograms = Reg(Vec(n_pe, Vec(256, UInt(32.W))))

  // 连接 PE 控制接口
  for (i <- 0 until n_pe) {
    io.pe_ctrl(i).start := false.B
    io.pe_ctrl(i).reset := false.B
  }

  // 状态定义
  val sIdle :: sRead :: sProcess :: sAccumulate :: Nil = Enum(4)
  val state = RegInit(sIdle)

  // 内存请求队列
  val requestQueue = Module(new Queue(new MemRequestIO(data_width, addr_width), qSize))
  val responseQueue = Module(new Queue(UInt(data_width.W), qSize))

  // 控制状态机
  switch(state) {
    is(sIdle) {
      when(io.mem_io.inReq(peIndex).ready && !requestQueue.io.deq.valid) {
        state := sRead
      }
    }
    is(sRead) {
      when(io.mem_io.outData(peIndex).valid) {
        state := sProcess
      }
    }
    is(sProcess) {
      when(responseQueue.io.deq.valid) {
        io.pe_ctrl(peIndex).start := true.B
        io.pe_ctrl(peIndex).reset := false.B
        peIndex := peIndex + 1.U
        when(peIndex === (n_pe - 1).U) {
          state := sAccumulate
        } .otherwise {
          state := sIdle
        }
      }
    }
    is(sAccumulate) {
      // 计算最终的直方图
      for (i <- 0 until 256) {
        io.final_histogram(i) := peHistograms.map(_(i)).reduce(_ + _)
      }
      state := sIdle
    }
  }

  // 内存请求
  requestQueue.io.enq.valid := (state === sRead)
  requestQueue.io.enq.bits.addr := addrGen
  requestQueue.io.enq.bits.write := false.B
  requestQueue.io.enq.bits.dataIn := 0.U // 读取操作不需要输入数据

  // 地址递增
  when(requestQueue.io.enq.fire()) {
    addrGen := addrGen + 1.U
  }

  // 内存响应
  responseQueue.io.enq.valid := io.mem_io.outData(peIndex).valid
  responseQueue.io.enq.bits := io.mem_io.outData(peIndex).bits

  // PE 寄存器接口
  for (i <- 0 until n_pe) {
    io.pe_ctrl(i).start := (state === sProcess) && (peIndex === i.U)
  }

  // 连接内存接口
  for (i <- 0 until n_pe) {
    io.mem_io.inReq(i).valid := requestQueue.io.deq.valid
    io.mem_io.inReq(i).bits := requestQueue.io.deq.bits
    requestQueue.io.deq.ready := io.mem_io.inReq(i).ready

    io.mem_io.outData(i).ready := responseQueue.io.deq.valid
    responseQueue.io.deq.ready := io.mem_io.outData(i).valid
  }

  // 空闲信号
  io.pe_ctrl.foreach(_.idle := (state === sIdle && !responseQueue.io.deq.valid))
}
