package spatial_templates.histogram

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class HistogramEngineTest extends AnyFlatSpec with ChiselScalatestTester {
  "HistogramEngine" should "accumulate histogram correctly" in {
    test(new HistogramEngine(queue_size = 16, data_width = 8)) { dut =>
      // 重置直方图计数器
      dut.io.ctrl_io.resetCounter.bits.poke(0.U)
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
      dut.io.outData.bits(3).expect(3.U) // 值为3的计数应为3
      dut.io.outData.bits(7).expect(2.U) // 值为7的计数应为2
      dut.io.outData.bits(1).expect(1.U) // 值为1的计数应为1
      dut.io.ctrl_io.idle.expect(true.B) // 确保模块处于空闲状态
    }
  }
}
