// package spatial_templates.entropy

// import chisel3._
// import chisel3.util._
// import chisel3.experimental.FixedPoint
// import scala.io.Source
// import spatial_templates.dfe._

// class EntropyEngine(queue_size: Int = 16, data_width: Int = 60, frac_width: Int = 50, histogram_size: Int = 256, lutSize: Int = 1024) extends Module {
//     val io = IO(new Bundle {
//         val inHistogram = Flipped(Decoupled(Vec(histogram_size, UInt(32.W)))) // 输入直方图接口
//         val outEntropy = Decoupled(FixedPoint(data_width.W, frac_width.BP))   // 输出熵接口，使用定点数
//         val ctrl_io = new MultAccEngineCtrlIO()                               // 控制接口，包含重置计数器和空闲信号
//     })

//     // 加载查找表数据
//     val log2LUTData = Source.fromFile("log2_lut.txt").getLines().map(_.toInt).toArray

//     // 定义查找表 (LUT)
//     val log2LUT = VecInit(log2LUTData.map(_.F(data_width.W, frac_width.BP)))

//     // 用于计算熵的寄存器
//     val entropy = RegInit(0.F(data_width.W, frac_width.BP))
//     val totalCount = RegInit(0.U(32.W))

//     // 队列用于输入直方图的流水线
//     val inQueue = Module(new Queue(Vec(histogram_size, UInt(32.W)), queue_size))
//     inQueue.io.enq <> io.inHistogram

//     // 默认初始化
//     io.outEntropy.bits := entropy
//     io.outEntropy.valid := false.B
//     io.ctrl_io.idle := false.B
//     io.ctrl_io.resetCounter.ready := false.B
//     inQueue.io.deq.ready := false.B

//     // 重置计数器/寄存器
//     when(io.ctrl_io.resetCounter.valid) {
//         entropy := 0.F(data_width.W, frac_width.BP)
//         totalCount := 0.U
//         io.ctrl_io.idle := true.B
//         io.ctrl_io.resetCounter.ready := true.B
//     } .otherwise {
//         // 处理输入直方图数据
//         when(inQueue.io.deq.valid) {
//         val histogram = inQueue.io.deq.bits
//         totalCount := histogram.reduce(_ +& _) // 计算直方图中所有计数的总和

//         // 计算每个灰度值的概率并计算熵
//         val entropyAcc = histogram.foldLeft(0.F(data_width.W, frac_width.BP)) { (acc, binCount) =>
//             when(binCount > 0.U) {
//             val p = (binCount.asFixedPoint(frac_width.BP)) / (totalCount.asFixedPoint(frac_width.BP))
//             // 使用查找表获取 -p * log2(p) 的值
//             val lutIdx = (p * (lutSize - 1).F(data_width.W, frac_width.BP)).asUInt // 将 p 映射到查找表索引
//             val log2Val = log2LUT(lutIdx)
//             acc + log2Val
//             } .otherwise {
//             acc
//             }
//         }
        
//         entropy := entropyAcc
//         inQueue.io.deq.ready := true.B
//         } .otherwise {
//         inQueue.io.deq.ready := false.B
//         }

//         // 输出熵
//         io.outEntropy.bits := entropy
//         io.outEntropy.valid := !inQueue.io.deq.valid
//         io.ctrl_io.idle := !inQueue.io.enq.valid
//     }
// }

// // object EntropyEngine {
// //   def apply(queue_size: Int = 16, data_width: Int = 60, frac_width: Int = 50, histogram_size: Int = 256, lutSize: Int = 1024): EntropyEngine = {
// //     Module(new EntropyEngine(queue_size, data_width, frac_width, histogram_size, lutSize))
// //   }
// // }
