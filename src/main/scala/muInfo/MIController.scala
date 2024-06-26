package spatial_templates.muInfo

import chisel3._
import chisel3.util._
import spatial_templates.histogram._
import chisel3.experimental.FixedPoint
import spatial_templates.muInfo._


class MI_Interface extends Bundle {
	val IMAGE_SIZE = 16      // 图像边长 
	val image1 = Input(Vec(IMAGE_SIZE, FixedPoint(8.W, 8.BP)))
	val image2 = Input(Vec(IMAGE_SIZE, FixedPoint(8.W, 8.BP)))
}

class MutualInformationController(data_width: Int = 60, binary_point: Int = 50, numPEs: Int = 4, histogram_size: Int = 16) extends Module {
    val io = IO(new Bundle {
        val mi_interface = new MI_Interface
        val mutualInformation = Decoupled(FixedPoint(data_width.W, binary_point.BP)) 
    })

    // Step 1: Distribute image data to PEs
    val pe_jointHistograms = Seq.fill(numPEs)(Module(new FixedPointJointHistogramEngine))
    val pixelPairs = io.mi_interface.image1.zip(io.mi_interface.image2)
    for (i <- pixelPairs.indices) {
        val peIndex = i % numPEs
        pe_jointHistograms(peIndex).io.inDataX := pixelPairs(i)._1
        pe_jointHistograms(peIndex).io.inDataY := pixelPairs(i)._2
    }

    // Step 2: Collect joint histograms from PEs and sum them
    val jointHistogram = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U(8.W))))))  // 二维向量寄存器，初始化为全零，存储直方图的每个 bin 的计数
    for (pe <- pe_jointHistograms) {
        for (i <- 0 until histogram_size) {
            for (j <- 0 until histogram_size) {
                jointHistogram(i)(j) := jointHistogram(i)(j) + pe.io.outData.bits(i)(j)
            }
        }
    }

	// Step 3: Copy joint histogram into three copies
	val jointHistogramCopy1 = Wire(VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U(8.W))))))
	val jointHistogramCopy2 = Wire(VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U(8.W))))))
	val jointHistogramCopy3 = Wire(VecInit(Seq.fill(16)(VecInit(Seq.fill(16)(0.U(8.W))))))

	jointHistogramCopy1 := jointHistogram
	jointHistogramCopy2 := jointHistogram
	jointHistogramCopy3 := jointHistogram

	// Step 4: Compute individual histograms for reference and current images
	// This step would involve mapping the joint histogram into individual histograms

	// Step 5: Distribute histograms to entropy calculation PEs
	val pe_entropies = Seq.fill(numPEs)(Module(new EntropyEngine))		// 实例化numPEs个EntropyPE模

	// 分割 jointHistogram 为 numPEs 个子直方图
	val subHistograms = Seq.tabulate(numPEs) { pe =>
		jointHistogram.slice(pe * histogram_size * histogram_size / numPEs, (pe + 1) * histogram_size * histogram_size / numPEs).flatMap(_.slice(0, histogram_size)) // 将二维切片转换为一维
	}


	// 将子直方图输入到 EntropyEngine 并启动计算
	for (pe <- 0 until numPEs) {
		val engine = pe_entropies(pe)
		val subHistogram = subHistograms(pe)

		for (i <- 0 until histogram_size * histogram_size / numPEs) {
			for (j <- 0 until histogram_size * histogram_size / numPEs) {
				engine.io.inHistogram.bits(i)(j) := subHistogram(i)(j)
			}
		}
		engine.io.inHistogram.valid := true.B
		engine.io.ctrl_io.resetCounter.valid := false.B
	}

  	// Step 6: Collect entropy results from PEs and sum them
	// 汇总所有 EntropyEngine 的熵值
	val totalEntropy = pe_entropies.map(_.io.outEntropy.bits).reduce(_ + _)
	val XY_Entropy = totalEntropy


	// Step 7: Compute mutual information
	io.mutualInformation := XY_Entropy // Placeholder, actual mutual information computation goes here
}

// object MutualInformation extends App {
//   chisel3.Driver.execute(args, () => new MutualInformationController(numPEs = 4))
// }
