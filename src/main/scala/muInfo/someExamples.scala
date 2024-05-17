// package spatial_templates.muInfo

// // Example: 数据选择器
// class ByteSelector extends Module {
//   val io = IO(new Bundle {
//     val in     = Input(UInt(32.W))
//     val offset = Input(UInt(2.W))
//     val out    = Output(UInt(8.W))
//   })
//   io.out := 0.U(8.W)
//   when (io.offset === 0.U(2.W)) {
//     io.out := io.in(7,0)
//   } .elsewhen (io.offset === 1.U) {
//     io.out := io.in(15,8)
//   } .elsewhen (io.offset === 2.U) {
//     io.out := io.in(23,16)
//   } .otherwise {
//     io.out := io.in(31,24)
//   }
// }

// // Problem:
// //
// // Implement a dual port memory of 256 8-bit words.
// // When 'wen' is asserted, write 'wrData' to memory at 'wrAddr'
// // When 'ren' is asserted, 'rdData' holds the output
// // of reading the memory at 'rdAddr'
// //
// class Memo extends Module {
//   val io = IO(new Bundle {
//     val wen     = Input(Bool())
//     val wrAddr  = Input(UInt(8.W))
//     val wrData  = Input(UInt(8.W))
//     val ren     = Input(Bool())
//     val rdAddr  = Input(UInt(8.W))
//     val rdData  = Output(UInt(8.W))
//   })

//   val mem = Mem(256, UInt(8.W))

//   // write
//   when (io.wen) { mem(io.wrAddr) := io.wrData }
  
//   // read
//   io.rdData := 0.U
//   when (io.ren) { io.rdData := mem(io.rdAddr) }

// }

// // 联合分布直方图
// class JointHistogram extends Module {
//     val io = IO(new Bundle {
//         val imageDataA = Input(Vec(512 * 512, UInt(8.W)))  // 图像A的数据
//         val imageDataB = Input(Vec(512 * 512, UInt(8.W)))  // 图像B的数据
//         val jointHistogram = Output(Vec(256, Vec(256, UInt(32.W))))  // 输出的联合分布直方图
//     })

//     // 初始化256x256的直方图数组，每个累加器位宽为32位
//     val histogram = RegInit(VecInit(Seq.fill(256, 256)(0.U(32.W))))
    
//     // // 创建256x256的累加器矩阵，每个累加器初始化为0
//     // val accumulators = Seq.fill(256, 256)(Module(new GenericAccumulator(UInt(32.W))))
//     // // 初始化输出
//     // for (i <- 0 until 256; j <- 0 until 256) {
//     //     io.jointHistogram(i)(j) := accumulators(i)(j).io.output
//     // }

//     // 遍历每个像素，更新直方图
//     for (i <- 0 until 512 * 512) {
//         val indexA = io.imageDataA(i)  // 图像A的灰度值
//         val indexB = io.imageDataB(i)  // 图像B的灰度值
//         histogram(indexA)(indexB) := histogram(indexA)(indexB) + 1.U  // 更新对应的累加器
//         // // 激活对应的累加器
//         // accumulators(indexA)(indexB).io.input := 1.U
//         // accumulators(indexA)(indexB).io.enable := true.B
//     }

//     // 将计算好的直方图输出
//     io.jointHistogram := histogram
// }

// // 定义泛型累加器类
// class GenericAccumulator[T <: Data](gen: T) extends Module {
//     val io = IO(new Bundle {
//         val input = Input(gen.cloneType)
//         val enable = Input(Bool())
//         val output = Output(gen.cloneType)
//     }) 

//     val sum = RegInit(0.U.asTypeOf(gen.cloneType)) // 初始化和类型匹配的累加器

//     when(io.enable) {
//         sum := sum + io.input // 进行累加操作
//     }

//     io.output := sum
// }

