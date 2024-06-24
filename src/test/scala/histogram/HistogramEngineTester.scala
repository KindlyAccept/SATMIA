package spatial_templates.histogram

import chisel3._
import chiseltest._
import chiseltest.simulator.WriteVcdAnnotation
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.experimental.FixedPoint


class HistogramEngineTester extends AnyFlatSpec with ChiselScalatestTester {
  "HistogramEngine" should "accumulate histogram correctly" in {
    test(new HistogramEngine(queue_size = 16, data_width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
		// 重置直方图计数器
		// dut.io.ctrl_io.resetCounter.bits.poke(0.U)
		dut.io.ctrl_io.resetCounter.valid.poke(true.B)
		dut.clock.step()
		dut.io.ctrl_io.resetCounter.valid.poke(false.B)

		// 发送一系列输入数据
		val inputs = Seq(3, 3, 3, 7, 7, 1)
		for (value <- inputs) {
			dut.io.inData.bits.poke(value.U)
			dut.io.inData.valid.poke(true.B)
			while (!dut.io.inData.ready.peek().litToBoolean) {
				dut.clock.step()
			}
			dut.clock.step()
			dut.io.inData.valid.poke(false.B)
		}

		// 确保所有输入数据处理完毕
		dut.clock.step(10)

		// 检查直方图计数是否正确
		dut.io.outData.ready.poke(true.B)
		dut.clock.step()
		dut.io.outData.bits(3).expect(3.U)    // 值为3的计数应为3
		dut.io.outData.bits(7).expect(2.U)    // 值为7的计数应为2
		dut.io.outData.bits(1).expect(1.U)    // 值为1的计数应为1
		dut.io.ctrl_io.idle.expect(true.B)    // 确保模块处于空闲状态
    }
  }
}


class JointHistogramEngineTester extends AnyFlatSpec with ChiselScalatestTester {
	"JointHistogramEngine" should "accumulate joint histogram correctly" in {
		test(new JointHistogramEngine(queue_size = 16, data_width = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
		// 重置直方图计数器
		dut.io.ctrl_io.resetCounter.valid.poke(true.B)
		dut.clock.step()
		dut.io.ctrl_io.resetCounter.valid.poke(false.B)

		// 示例输入二维灰度图像 (每个像素的灰度值在0-255之间)
		val imageX = Array(
			Array(3, 7, 1),
			Array(3, 7, 1),
			Array(3, 7, 1)
		)

		val imageY = Array(
			Array(4, 8, 2),
			Array(4, 8, 2),
			Array(5, 8, 2)
		)

		// 将二维灰度图像展开成一维数组，并发送输入数据 (X, Y) 对
		for (i <- imageX.indices; j <- imageX(i).indices) {
			dut.io.inDataX.bits.poke(imageX(i)(j).U)
			dut.io.inDataX.valid.poke(true.B)
			dut.io.inDataY.bits.poke(imageY(i)(j).U)
			dut.io.inDataY.valid.poke(true.B)

			// 等待队列准备好接收数据
			while (!dut.io.inDataX.ready.peek().litToBoolean || !dut.io.inDataY.ready.peek().litToBoolean) {
			dut.clock.step()
			}
			dut.clock.step()
			dut.io.inDataX.valid.poke(false.B)
			dut.io.inDataY.valid.poke(false.B)
		}

		// 确保所有输入数据处理完毕
		dut.clock.step(10)

		// 检查联合直方图计数是否正确
		dut.io.outData.ready.poke(true.B)
		dut.clock.step()

		def checkBin(x: Int, y: Int, expected: Int) = {
			dut.io.outData.bits(x)(y).expect(expected.U)
		}

		checkBin(3, 4, 2)  // 值为 (3, 4) 的计数应为 2
		checkBin(3, 5, 1)  // 值为 (3, 5) 的计数应为 1
		checkBin(7, 8, 3)  // 值为 (7, 8) 的计数应为 3
		checkBin(1, 2, 3)  // 值为 (1, 2) 的计数应为 3
		dut.io.ctrl_io.idle.expect(true.B)  // 确保模块处于空闲状态
		}
	}
}


class FixedPointHistogramEngineTester extends AnyFlatSpec with ChiselScalatestTester {
  "HistogramEngine" should "accumulate histogram correctly" in {
    test(new FixedPointHistogramEngine(queue_size = 16, data_width = 8, binary_point = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
	// 重置直方图计数器
    //   dut.io.ctrl_io.resetCounter.bits.poke(true.B)
      dut.io.ctrl_io.resetCounter.valid.poke(true.B)
      while (!dut.io.ctrl_io.resetCounter.ready.peek().litToBoolean) {
        dut.clock.step()
      }
      dut.clock.step()
      dut.io.ctrl_io.resetCounter.valid.poke(false.B)

      // 发送一系列输入数据
      val inputs = Seq(0.1, 0.1, 0.1, 0.2, 0.2, 0.5)
      for (value <- inputs) {
        dut.io.inData.bits.poke((value).F(9.W, 8.BP))
        dut.io.inData.valid.poke(true.B)
        while (!dut.io.inData.ready.peek().litToBoolean) {
          dut.clock.step()
        }
        dut.clock.step()
        dut.io.inData.valid.poke(false.B)
      }

      // 确保所有输入数据处理完毕
      dut.clock.step(10)

      // 检查直方图计数是否正确
      dut.io.outData.ready.poke(true.B)
      dut.clock.step()
      dut.io.outData.bits(25).expect(3.U) 	// 值为0.1的计数应为3
      dut.io.outData.bits(50).expect(2.U) 	// 值为0.2的计数应为2
      dut.io.outData.bits(127).expect(1.U) 	// 值为0.5的计数应为1
      dut.io.ctrl_io.idle.expect(true.B) // 确保模块处于空闲状态
    }
  }
}

class FixedPointJointHistogramEngineTester extends AnyFlatSpec with ChiselScalatestTester {
  "JointHistogramEngine" should "accumulate histogram correctly" in {
    test(new FixedPointJointHistogramEngine(queue_size = 16, data_width = 8, binary_point = 8)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
	// 重置直方图计数器
      dut.io.ctrl_io.resetCounter.valid.poke(true.B)
      while (!dut.io.ctrl_io.resetCounter.ready.peek().litToBoolean) {
        dut.clock.step()
      }
      dut.clock.step()
      dut.io.ctrl_io.resetCounter.valid.poke(false.B)

	// 示例输入二维灰度图像 (每个像素的灰度值在0-255之间)
	val imageX = Array(
		Array(0.0625, 0.0078125, 0.00390625),
		Array(0.0625, 0.0078125, 0.00390625),
		Array(0.0625, 0.0078125, 0.00390625)
	)

	val imageY = Array(
		Array(0.0625, 0.0078125, 0.03125),
		Array(0.0625, 0.0078125, 0.03125),
		Array(0.0078125, 0.0625, 0.03125)
	)

	// 将二维灰度图像展开成一维数组，并发送输入数据 (X, Y) 对
	for (i <- imageX.indices; j <- imageX(i).indices) {
		dut.io.inDataX.bits.poke(imageX(i)(j).F(8.W, 8.BP))
		dut.io.inDataX.valid.poke(true.B)
		dut.io.inDataY.bits.poke(imageY(i)(j).F(8.W, 8.BP))
		dut.io.inDataY.valid.poke(true.B)

		// 等待队列准备好接收数据
		while (!dut.io.inDataX.ready.peek().litToBoolean || !dut.io.inDataY.ready.peek().litToBoolean) {
		dut.clock.step()
		}
		dut.clock.step()
		dut.io.inDataX.valid.poke(false.B)
		dut.io.inDataY.valid.poke(false.B)
	}

	// 确保所有输入数据处理完毕
	dut.clock.step(10)

	// 检查直方图计数是否正确
	dut.io.outData.ready.poke(true.B)
	dut.clock.step()

	def checkBin(x: Int, y: Int, expected: Int) = {
		dut.io.outData.bits(x-1)(y-1).expect(expected.U)
	}

	checkBin(1, 8, 3)  // 值为 (1, 8) 的计数应为 3
	checkBin(2, 2, 2)  // 值为 (2, 2) 的计数应为 2
	checkBin(2, 16, 1)  // 值为 (2, 16) 的计数应为 1
	checkBin(16, 2, 1)  // 值为 (16, 2) 的计数应为 1
	checkBin(16, 16, 2)  // 值为 (16, 16) 的计数应为 2
	dut.io.ctrl_io.idle.expect(true.B)  // 确保模块处于空闲状态
	}
  }
}