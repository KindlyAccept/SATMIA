package spatial_templates.histogram

import chisel3._
import chisel3.util._

class HistogramEngine(queue_size: Int, data_width: Int = 8) extends Module {        // 这里可以给queue_size/data_width初值，来使得位数Fixed
    val io = IO(new Bundle {
        val inData = Flipped(Decoupled(UInt(data_width.W)))             // 输入数据接口，支持有效信号和准备信号
        val outData = Decoupled(Vec(queue_size, UInt(data_width.W)))    // 输出接口，输出直方图数据，应为256个元素的向量
        val ctrl_io = new Bundle {                                      // 控制接口，其状态：包含重置计数器和空闲信号（利用寄存器进行存储标注）
            val resetCounter = Flipped(Decoupled(UInt(data_width.W)))
            val idle = Output(Bool())
        }
    })

    // 队列用于实现流水线（一系列的寄存器）
    val inQueue = Module(new Queue(UInt(data_width.W), queue_size))     // 存储输入数据，queue_size 代表灰度的
    val histQueue = Module(new Queue(UInt(data_width.W), queue_size))   // 存储直方图更新结果
    
    // 直方图寄存器：计数器，每个灰度值一个寄存器
    val histogram = RegInit(VecInit(Seq.fill(256)(0.U(data_width.W))))   // 一个向量寄存器，初始化为全零，存储直方图的每个 bin 的计数

    // 重置计数器
    when(io.ctrl_io.resetCounter.valid) {
        for (i <- 0 until 256) {
            histogram(i) := 0.U
        }
    }

    // 处理输入数据
    inQueue.io.enq <> io.inData                                         // 将输入数据 io.inData 连接到 inQueue 的输入
    histQueue.io.enq.bits := histogram(inQueue.io.deq.bits)             // 将 inQueue 的输出作为索引，从 histogram 中读取对应的计数，传递给 histQueue 的输入
    histQueue.io.enq.valid := inQueue.io.deq.valid                      // 将 inQueue 的 Valid 信号传递给 histQueue
    inQueue.io.deq.ready := histQueue.io.enq.ready                      // 将 histQueue 的 Ready 信号传递给 inQueue

    when(histQueue.io.deq.valid) {                          // 当 histQueue 的输出有效时，更新直方图寄存器
        histogram(histQueue.io.deq.bits) := histogram(histQueue.io.deq.bits) + 1.U    // 增加对应 bin 的计数
        histQueue.io.deq.ready := true.B                    // 设置 histQueue 的准备信号为真
    } .otherwise {
        histQueue.io.deq.ready := false.B
    }

    io.outData.bits := histogram.reduce(_ + _)              // 将直方图寄存器中所有 bin 的计数相加，作为 Output 输出数据。
    io.outData.valid := true.B                              // 设置输出数据的有效信号为真，表示总是有有效输出。
    io.ctrl_io.idle := !io.inData.valid                     // 当没有输入数据时，设置 idle 空闲信号为真。
}
