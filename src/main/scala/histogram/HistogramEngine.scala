package spatial_templates.histogram

import chisel3._
import chisel3.util._
import spatial_templates.dfe._
import chisel3.experimental.FixedPoint

// TODO: change HistogramEngine from INT to FIXEDPOINT
//   read the img of FIXEDPOINT, put them into some bins
//   某种直方图均衡方法：先使用均分的方法

class HistogramEngine(queue_size: Int = 16, data_width: Int = 8) extends Module {        // 这里可以给queue_size/data_width初值，来使得位数Fixed
    val io = IO(new Bundle {
        val inData = Flipped(Decoupled(UInt(data_width.W)))             // 输入数据接口，支持有效信号和准备信号
        val outData = Decoupled(Vec(256, UInt(data_width.W)))           // 输出接口，输出直方图数据，应为256个元素的向量
        val ctrl_io = new MultAccEngineCtrlIO()                         // 控制接口，其状态：包含重置计数器和空闲信号（利用寄存器进行存储标注）
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

    // 默认初始化
    io.outData.bits := histogram
    io.outData.valid := false.B
    io.ctrl_io.idle := false.B
    io.ctrl_io.resetCounter.ready := false.B
    inQueue.io.deq.ready := false.B

    // 重置计数器/寄存器
    when(io.ctrl_io.resetCounter.valid) {
        for (i <- 0 until 256) {
            histogram(i) := 0.U
        }
        currentGrayValue := 0.U
        currentCount := 0.U
        firstValue := true.B
        io.ctrl_io.idle := true.B
        io.ctrl_io.resetCounter.ready := true.B
    } .otherwise {
        // 处理输入数据
        when(inQueue.io.deq.valid) {                    // 添加io.outData.ready确保消费者准备好接收数据
            val newGrayValue = inQueue.io.deq.bits

            when(firstValue || (newGrayValue === currentGrayValue)) {         // 当为第一个灰度值或者旧的灰度值时
            // 灰度值相同（或者是第一个），仅累加计数
                currentCount := currentCount + 1.U                          // 增加 Histogram 中对应灰度值 bin 的计数
                firstValue := false.B
                when(firstValue) {
                    currentGrayValue := newGrayValue
                }
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
        io.outData.valid := !inQueue.io.deq.valid && firstValue         // 表示当 firstValue 为 false 时，输出数据有效。
        io.ctrl_io.idle := !inQueue.io.enq.valid && firstValue          // 当没有输入数据时，设置 idle 空闲信号为真。
    }    
}


class JointHistogramEngine(queue_size: Int = 16, data_width: Int = 8) extends Module {
    val io = IO(new Bundle {
        val inDataX = Flipped(Decoupled(UInt(data_width.W)))             // 输入数据 X 接口
        val inDataY = Flipped(Decoupled(UInt(data_width.W)))             // 输入数据 Y 接口
        val outData = Decoupled(Vec(16, Vec(16, UInt(data_width.W))))  // 输出接口，输出联合直方图数据，应为 256x256 的二维向量        
        val ctrl_io = new MultAccEngineCtrlIO()                          // 控制接口，其状态：包含重置计数器和空闲信号（利用寄存器进行存储标注）
    })

    // 联合直方图寄存器：计数器，每个 (X, Y) 对应一个寄存器
    val histogram = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U(data_width.W))))))  // 二维向量寄存器，初始化为全零，存储直方图的每个 bin 的计数

    // 当前处理的 X 值和 Y 值及其计数
    val currentXValue = RegInit(0.U(data_width.W))
    val currentYValue = RegInit(0.U(data_width.W))
    val currentCount = RegInit(0.U(data_width.W))
    val firstValue = RegInit(true.B)

    // 队列用于实现流水线
    val inQueueX = Module(new Queue(UInt(data_width.W), queue_size))     // 存储输入数据 X，queue_size 代表队列大小
    val inQueueY = Module(new Queue(UInt(data_width.W), queue_size))     // 存储输入数据 Y，queue_size 代表队列大小

    inQueueX.io.enq <> io.inDataX                                        // 将输入数据 io.inDataX 连接到 inQueueX 的输入
    inQueueY.io.enq <> io.inDataY                                        // 将输入数据 io.inDataY 连接到 inQueueY 的输入

    // 默认初始化
    io.outData.bits := histogram
    io.outData.valid := false.B
    io.ctrl_io.idle := false.B
    io.ctrl_io.resetCounter.ready := false.B
    inQueueX.io.deq.ready := false.B
    inQueueY.io.deq.ready := false.B

    // 重置计数器/寄存器
    when(io.ctrl_io.resetCounter.valid) {
        for (i <- 0 until 16) {
            for (j <- 0 until 16) {
                histogram(i)(j) := 0.U
            }
        }
        currentXValue := 0.U
        currentYValue := 0.U
        currentCount := 0.U
        firstValue := true.B
        io.ctrl_io.idle := true.B
        io.ctrl_io.resetCounter.ready := true.B
    } .otherwise {
        // 处理输入数据
        when(inQueueX.io.deq.valid && inQueueY.io.deq.valid) {            // 添加 io.outData.ready 确保消费者准备好接收数据
            val newXValue = inQueueX.io.deq.bits
            val newYValue = inQueueY.io.deq.bits

            when(firstValue || (newXValue === currentXValue && newYValue === currentYValue)) {
                // (X, Y) 值相同（或者是第一个），仅累加计数
                currentCount := currentCount + 1.U
                firstValue := false.B
                when(firstValue) {
                    currentXValue := newXValue
                    currentYValue := newYValue
                }
            } .otherwise {
                // (X, Y) 值不同，更新 histogram 寄存器并重置当前值和计数
                histogram(currentXValue)(currentYValue) := histogram(currentXValue)(currentYValue) + currentCount
                currentXValue := newXValue
                currentYValue := newYValue
                currentCount := 1.U
            }
            inQueueX.io.deq.ready := true.B
            inQueueY.io.deq.ready := true.B
        } .otherwise {
            inQueueX.io.deq.ready := false.B
            inQueueY.io.deq.ready := false.B
        }

        // 最后更新，确保所有数据都写入 histogram
        when(!inQueueX.io.deq.valid && !inQueueY.io.deq.valid && !firstValue) {
            histogram(currentXValue)(currentYValue) := histogram(currentXValue)(currentYValue) + currentCount
            firstValue := true.B
        }

        // 输出直方图
        io.outData.bits := histogram                                    // 将直方图寄存器中所有 bin 的计数相加，作为 Output 输出数据
        io.outData.valid := !inQueueX.io.deq.valid && !inQueueY.io.deq.valid && firstValue // 表示当 firstValue 为 false 时，输出数据有效
        io.ctrl_io.idle := !inQueueX.io.enq.valid && !inQueueY.io.enq.valid && firstValue  // 当没有输入数据时，设置 idle 空闲信号为真
    }    
}


// data_width = 8, binary_point = 8, 因此8位全为小数部分，整数部分始终为0。
class FixedPointHistogramEngine(queue_size: Int = 16, data_width: Int = 8, binary_point: Int = 8) extends Module {
    val io = IO(new Bundle {
        val inData = Flipped(Decoupled(FixedPoint(data_width.W, binary_point.BP))) // 输入数据接口，支持有效信号和准备信号
        val outData = Decoupled(Vec(256, UInt(data_width.W)))       // 输出接口，输出直方图数据，应为(2^8)256个元素的 UInt 向量
        val ctrl_io = new MultAccEngineCtrlIO()                     // 控制接口，其状态：包含重置计数器和空闲信号（利用寄存器进行存储标注）
    })

    // 默认初始化所有信号，避免未初始化问题
    io.inData.ready := false.B
    io.outData.bits := VecInit(Seq.fill(256)(0.U))
    io.outData.valid := false.B
    io.ctrl_io.resetCounter.ready := false.B
    io.ctrl_io.idle := false.B
    
    // 直方图寄存器：计数器，每个灰度值一个寄存器
    val histogram = RegInit(VecInit(Seq.fill(256)(0.U(data_width.W))))   // 一个向量寄存器，初始化为全零，存储直方图的每个 bin 的计数

    // 当前处理的灰度值和计数
    val currentGrayValue = RegInit(0.F(data_width.W, binary_point.BP))
    val currentCount = RegInit(0.U(data_width.W))
    val firstValue = RegInit(true.B)

    // 队列用于实现流水线（一系列的寄存器）
    val inQueue = Module(new Queue(FixedPoint(data_width.W, binary_point.BP), queue_size)) // 存储输入数据，queue_size 代表灰度的
    inQueue.io.enq <> io.inData // 将输入数据 io.inData 连接到 inQueue 的输入

    // 默认初始化
    io.outData.bits := histogram
    io.outData.valid := false.B
    io.ctrl_io.idle := false.B
    io.ctrl_io.resetCounter.ready := false.B
    inQueue.io.deq.ready := false.B

    // 重置计数器/寄存器
    when(io.ctrl_io.resetCounter.valid) {
        for (i <- 0 until 256) {
            histogram(i) := 0.U
        }
        currentGrayValue := 0.F(data_width.W, binary_point.BP)
        currentCount := 0.U
        firstValue := true.B
        io.ctrl_io.idle := true.B
        io.ctrl_io.resetCounter.ready := true.B
    } .otherwise {
        // 默认情况下 resetCounter.ready 置为 false
        io.ctrl_io.resetCounter.ready := false.B

        // 处理输入数据
        when(inQueue.io.deq.valid) { // 添加io.outData.ready确保消费者准备好接收数据
            val newGrayValue = inQueue.io.deq.bits

            when(firstValue || newGrayValue === currentGrayValue) {
            // 灰度值相同（或者是第一个），仅累加计数
                currentCount := currentCount + 1.U 
                firstValue := false.B
                when(firstValue) {
                    currentGrayValue := newGrayValue
                }
            } .otherwise {
            // 灰度值不同，更新Histogram寄存器并重置当前值和计数
                val index = currentGrayValue.asUInt - 1.U // 将当前灰度值缩放到 0-255 范围内的整数
                    // val shiftedValue = currentGrayValue << 8 // 将当前灰度值缩放到 0-255 范围内的整数
                    // val index = Wire(UInt(8.W))
                    // index := (shiftedValue >> 8).asUInt()
                histogram(index) := histogram(index) + currentCount // 将当前计数值写入对应的灰度值 bin
                currentGrayValue := newGrayValue
                currentCount := 1.U
            }
            inQueue.io.deq.ready := true.B
        } .otherwise {
            inQueue.io.deq.ready := false.B
        }

        // 最后更新，确保所有数据都写入Histogram
        when(!inQueue.io.deq.valid && !firstValue) {
            val index = currentGrayValue.asUInt - 1.U // 将当前灰度值缩放到 0-255 范围内的整数
                // val shiftedValue = currentGrayValue << 8 // 将当前灰度值缩放到 0-255 范围内的整数
                // val index = Wire(UInt(8.W))
                // index := (shiftedValue >> 8).asUInt()
            histogram(index) := histogram(index) + currentCount
            firstValue := true.B
        }

        // 输出直方图
        io.outData.bits := histogram // 将直方图寄存器中所有 bin 的计数相加，作为 Output 输出数据。
        io.outData.valid := !inQueue.io.deq.valid && firstValue // 表示当 firstValue 为 false 时，输出数据有效。
        io.ctrl_io.idle := !inQueue.io.enq.valid && firstValue // 当没有输入数据时，设置 idle 空闲信号为真。
    }
}


class FixedPointJointHistogramEngine(queue_size: Int = 16, data_width: Int = 8, binary_point: Int = 8) extends Module {
    val io = IO(new Bundle {
        val inDataX = Flipped(Decoupled(FixedPoint(data_width.W, binary_point.BP)))            // 输入数据 X 接口
        val inDataY = Flipped(Decoupled(FixedPoint(data_width.W, binary_point.BP)))            // 输入数据 Y 接口
        val outData = Decoupled(Vec(16, Vec(16, UInt(data_width.W))))       // 输出接口，输出联合直方图数据，应为 256x256 的二维向量        
        val ctrl_io = new MultAccEngineCtrlIO()                             // 控制接口，其状态：包含重置计数器和空闲信号（利用寄存器进行存储标注）
    })

    // 默认初始化所有信号，避免未初始化问题
    io.inDataX.ready := false.B
    io.inDataY.ready := false.B
    io.outData.bits := VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U))))
    io.outData.valid := false.B
    io.ctrl_io.resetCounter.ready := false.B
    io.ctrl_io.idle := false.B

    // 联合直方图寄存器：计数器，每个 (X, Y) 对应一个寄存器
    val histogram = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U(data_width.W))))))  // 二维向量寄存器，初始化为全零，存储直方图的每个 bin 的计数

    // 当前处理的 X 值和 Y 值及其计数
    val currentXValue = RegInit(0.F(data_width.W, binary_point.BP))
    val currentYValue = RegInit(0.F(data_width.W, binary_point.BP))
    val currentCount = RegInit(0.U(data_width.W))
    val firstValue = RegInit(true.B)

    // 队列用于实现流水线
    val inQueueX = Module(new Queue(FixedPoint(data_width.W, binary_point.BP), queue_size))     // 存储输入数据 X，queue_size 代表队列大小
    val inQueueY = Module(new Queue(FixedPoint(data_width.W, binary_point.BP), queue_size))     // 存储输入数据 Y，queue_size 代表队列大小

    inQueueX.io.enq <> io.inDataX                                        // 将输入数据 io.inDataX 连接到 inQueueX 的输入
    inQueueY.io.enq <> io.inDataY                                        // 将输入数据 io.inDataY 连接到 inQueueY 的输入

    // 默认初始化
    io.outData.bits := histogram
    io.outData.valid := false.B
    io.ctrl_io.idle := false.B
    io.ctrl_io.resetCounter.ready := false.B
    inQueueX.io.deq.ready := false.B
    inQueueY.io.deq.ready := false.B

    // 重置计数器/寄存器
    when(io.ctrl_io.resetCounter.valid) {
        for (i <- 0 until 16) {
            for (j <- 0 until 16) {
                histogram(i)(j) := 0.U
            }
        }
        currentXValue := 0.F(data_width.W, binary_point.BP)
        currentYValue := 0.F(data_width.W, binary_point.BP)
        currentCount := 0.U
        firstValue := true.B
        io.ctrl_io.idle := true.B
        io.ctrl_io.resetCounter.ready := true.B
    } .otherwise {
        // 默认情况下 resetCounter.ready 置为 false
        io.ctrl_io.resetCounter.ready := false.B

        // 处理输入数据
        when(inQueueX.io.deq.valid && inQueueY.io.deq.valid) {            // 添加 io.outData.ready 确保消费者准备好接收数据
            val newXValue = inQueueX.io.deq.bits
            val newYValue = inQueueY.io.deq.bits

            when(firstValue || (newXValue === currentXValue && newYValue === currentYValue)) {
                // (X, Y) 值相同（或者是第一个），仅累加计数
                currentCount := currentCount + 1.U
                firstValue := false.B
                when(firstValue) {
                    currentXValue := newXValue
                    currentYValue := newYValue
                }
            } .otherwise {
                // (X, Y) 值不同，更新 histogram 寄存器并重置当前值和计数
                val indexX = currentXValue.asUInt - 1.U
                val indexY = currentYValue.asUInt - 1.U
                histogram(indexX)(indexY) := histogram(indexX)(indexY) + currentCount
                currentXValue := newXValue
                currentYValue := newYValue
                currentCount := 1.U
            }
            inQueueX.io.deq.ready := true.B
            inQueueY.io.deq.ready := true.B
        } .otherwise {
            inQueueX.io.deq.ready := false.B
            inQueueY.io.deq.ready := false.B
        }

        // 最后更新，确保所有数据都写入 histogram
        when(!inQueueX.io.deq.valid && !inQueueY.io.deq.valid && !firstValue) {
            val indexX = currentXValue.asUInt - 1.U
            val indexY = currentYValue.asUInt - 1.U
            histogram(indexX)(indexY) := histogram(indexX)(indexY) + currentCount
            firstValue := true.B
        }

        // 输出直方图
        io.outData.bits := histogram                                    // 将直方图寄存器中所有 bin 的计数相加，作为 Output 输出数据
        io.outData.valid := !inQueueX.io.deq.valid && !inQueueY.io.deq.valid && firstValue // 表示当 firstValue 为 false 时，输出数据有效
        io.ctrl_io.idle := !inQueueX.io.enq.valid && !inQueueY.io.enq.valid && firstValue  // 当没有输入数据时，设置 idle 空闲信号为真
    }    
}