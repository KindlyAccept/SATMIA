package spatial_templates.muInfo

import chisel3._
import chiseltest._
import chiseltest.simulator.WriteVcdAnnotation
import org.scalatest.flatspec.AnyFlatSpec
import chisel3.experimental.FixedPoint
import scala.io.Source


// 没有测试过
class EntropyEngineTester extends AnyFlatSpec with ChiselScalatestTester {
"EntropyEngine" should "calculate entropy correctly" in {
    test(new EntropyEngine(queue_size = 16, data_width = 60, binary_point = 50, histogram_size = 16, lutSize = 1024)) { dut =>

    // Reset counter and entropy
    dut.io.ctrl_io.resetCounter.valid.poke(true.B)
    dut.clock.step()
    dut.io.ctrl_io.resetCounter.valid.poke(false.B)

    // Example histogram data (replace with your test data)
    val histogramData = Array.fill(16, 16)(0)

    // Load example histogram data into the input interface
    dut.io.inHistogram.valid.poke(true.B)
    for (i <- 0 until 16) {
        for (j <- 0 until 16) {
            dut.io.inHistogram.bits(i)(j).poke(histogramData(i)(j).U)
        }
    }

    // Wait for inputs to be processed
    dut.clock.step(10)

    // Read output entropy
    dut.io.inHistogram.valid.poke(false.B)
    dut.io.outEntropy.ready.poke(true.B)
    dut.clock.step()
    
    // Example assertions (replace with your expected values)
    // Ensure output entropy is valid (you may need to adjust these assertions based on your expected behavior)
    dut.io.outEntropy.valid.expect(true.B)

    // Additional assertions based on expected behavior
    // Add more assertions as needed based on your expected output values

    // Example: Check if entropy value is within expected range
    // dut.io.outEntropy.bits.expect(...) 

    // Example: Check if module is idle
    // dut.io.ctrl_io.idle.expect(true.B)
    }
}
}
