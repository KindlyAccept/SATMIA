// package spatial_templates.MutualInformation

// import chisel3._
// import chisel3.util._
// import spatial_templates.histogram._


// // class MI_Interface extends Bundle {
// //   val IMAGE_SIZE = 512
// //   val image1 = Input(Vec(IMAGE_SIZE, UInt(8.W)))
// //   val image2 = Input(Vec(IMAGE_SIZE, UInt(8.W)))
// // }

// // class PE_JointHistogram extends Module {
// //   val io = IO(new Bundle {
// //     val pixel1 = Input(UInt(8.W))
// //     val pixel2 = Input(UInt(8.W))
// //     val jointHistogram = Output(Vec(HISTOGRAM_SIZE, UInt(32.W)))
// //   })

//   // Implementation of joint histogram calculation
// // }

// // class PE_EntropyCalculation extends Module {
// //   val io = IO(new Bundle {
// //     val histogram = Input(Vec(HISTOGRAM_SIZE, UInt(32.W)))
// //     val entropy = Output(UInt(32.W))
// //   })

//   // Implementation of entropy calculation
// // }

// class MutualInformationController(numPEs: Int) extends Module {
//   val io = IO(new Bundle {
//     val mi_interface = new MI_Interface
//     val mutualInformation = Output(UInt(32.W))
//   })

//   // Step 1: Distribute image data to PEs
//   val pe_jointHistograms = Seq.fill(numPEs)(Module(new PE_JointHistogram))
//   val pixelPairs = io.mi_interface.image1.zip(io.mi_interface.image2)
//   for (i <- pixelPairs.indices) {
//     val peIndex = i % numPEs
//     pe_jointHistograms(peIndex).io.pixel1 := pixelPairs(i)._1
//     pe_jointHistograms(peIndex).io.pixel2 := pixelPairs(i)._2
//   }

//   // Step 2: Collect joint histograms from PEs and sum them
//   val jointHistogram = RegInit(VecInit(Seq.fill(HISTOGRAM_SIZE)(0.U(32.W))))
//   for (pe <- pe_jointHistograms) {
//     for (i <- 0 until HISTOGRAM_SIZE) {
//       jointHistogram(i) := jointHistogram(i) + pe.io.jointHistogram(i)
//     }
//   }

//   // Step 3: Copy joint histogram into three copies
//   val jointHistogramCopy1 = Wire(Vec(HISTOGRAM_SIZE, UInt(32.W)))
//   val jointHistogramCopy2 = Wire(Vec(HISTOGRAM_SIZE, UInt(32.W)))
//   val jointHistogramCopy3 = Wire(Vec(HISTOGRAM_SIZE, UInt(32.W)))

//   jointHistogramCopy1 := jointHistogram
//   jointHistogramCopy2 := jointHistogram
//   jointHistogramCopy3 := jointHistogram

//   // Step 4: Compute individual histograms for reference and current images
//   // This step would involve mapping the joint histogram into individual histograms

//   // Step 5: Distribute histograms to entropy calculation PEs
//   val pe_entropies = Seq.fill(numPEs)(Module(new PE_EntropyCalculation))
//   for (i <- 0 until HISTOGRAM_SIZE by numPEs) {
//     for (j <- 0 until numPEs) {
//       if (i + j < HISTOGRAM_SIZE) {
//         pe_entropies(j).io.histogram := jointHistogramCopy1.slice(i, i + numPEs)
//       }
//     }
//   }

//   // Step 6: Collect entropy results from PEs and sum them
//   val entropyResults = Wire(Vec(numPEs, UInt(32.W)))
//   for (i <- 0 until numPEs) {
//     entropyResults(i) := pe_entropies(i).io.entropy
//   }

//   val entropySum = entropyResults.reduce(_ + _)

//   // Step 7: Compute mutual information
//   io.mutualInformation := entropySum // Placeholder, actual mutual information computation goes here
// }

// // object MutualInformation extends App {
// //   chisel3.Driver.execute(args, () => new MutualInformationController(numPEs = 4))
// // }
