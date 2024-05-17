package spatial_templates.histogram


import chisel3._
import chisel3.util._
import spatial_templates.dfe._

class HistogramEngine(queue_size: Int = 16, data_width: Int = 8) extends Module {        // 这里可以给queue_size/data_width初值，来使得位数Fixed
    val io = IO(new Bundle {
        val inData = Flipped(Decoupled(UInt(data_width.W)))             // 输入数据接口，支持有效信号和准备信号
        val outData = Decoupled(Vec(256, UInt(data_width.W)))           // 输出接口，输出直方图数据，应为256个元素的向量
        val ctrl_io = IO(new MultAccEngineCtrlIO())                     // 控制接口，其状态：包含重置计数器和空闲信号（利用寄存器进行存储标注）
    })
    
    // 直方图寄存器：计数器，每个灰度值一个寄存器
    val histogram = RegInit(VecInit(Seq.fill(256)(0.U(data_width.W))))   // 一个向量寄存器，初始化为全零，存储直方图的每个 bin 的计数

    // 当前处理的灰度值和计数
    val currentGrayValue = RegInit(0.U(data_width.W))
    val currentCount = RegInit(0.U(data_width.W))
    val firstValue = RegInit(true.B)

    // 队列用于实现流水线（一系列的寄存器）
    val inQueue = Module(new Queue(UInt(data_width.W), queue_size))     // 存储输入数据，queue_size 代表灰度的
    inQueue.io.enq <> io.inData                                         // 将输入数据 io.inData 连接到 inQueue 的输入

    // 重置计数器/寄存器
    when(io.ctrl_io.resetCounter.valid) {
        for (i <- 0 until 256) {
            histogram(i) := 0.U
        }
        currentGrayValue := 0.U
        currentCount := 0.U
        firstValue := true.B
    } .otherwise {

        // 处理输入数据
        when(inQueue.io.deq.valid && io.outData.ready) {                    // 添加io.outData.ready确保消费者准备好接收数据
            val newGrayValue = inQueue.io.deq.bits

            when(firstValue || newGrayValue === currentGrayValue) {         // 当为第一个灰度值或者旧的灰度值时
            // 灰度值相同（或者是第一个），仅累加计数
                currentCount := currentCount + 1.U                          // 增加 Histogram 中对应灰度值 bin 的计数
                firstValue := false.B
            } .otherwise {
            // 灰度值不同，更新Histogram寄存器并重置当前值和计数
                histogram(currentGrayValue) := histogram(currentGrayValue) + currentCount   // 将 inQueue 的输出作为索引，从 histogram 中读取对应的计数，传递给 histQueue 的输入
                currentGrayValue := newGrayValue
                currentCount := 1.U
            }
            inQueue.io.deq.ready := true.B
        } .otherwise {
            inQueue.io.deq.ready := false.B
        }

        // 最后更新，确保所有数据都写入Histogram
        when(!inQueue.io.deq.valid && !firstValue) {
            histogram(currentGrayValue) := histogram(currentGrayValue) + currentCount
            firstValue := true.B
        }

        // 输出直方图
        io.outData.bits := histogram                                    // 将直方图寄存器中所有 bin 的计数相加，作为 Output 输出数据。
        io.outData.valid := !firstValue                                 // 表示当 firstValue 为 false 时，输出数据有效。
        io.ctrl_io.idle := !inQueue.io.enq.valid && firstValue          // 当没有输入数据时，设置 idle 空闲信号为真。
    }    
}
