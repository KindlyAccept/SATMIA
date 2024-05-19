// package spatial_templates.histogram

// import chisel3._
// import chisel3.util._
// import chiseltest._
// import org.scalatest.flatspec.AnyFlatSpec

// class HistogramAddressGeneratorTester extends AnyFlatSpec with ChiselScalatestTester {
//     "HistogramAddressGenerator" should "initialize and process addresses correctly" in {
//         test(new HistogramAddressGenerator(addr_width = 16, data_width = 32, n_banks = 4, bank = 0)) { dut =>
            
//             // Initialize the DUT with reset_setup
//             dut.pe_ctrl_io.reset_setup.poke(true.B)
//             dut.pe_ctrl_io.in_data.poke(10.U)
//             dut.pe_ctrl_io.in_hist_addr.poke(20.U)
//             dut.pe_ctrl_io.in_bins.poke(30.U)
//             dut.clock.step()
//             dut.pe_ctrl_io.reset_setup.poke(false.B)
            
//             // Check if registers are set correctly
//             dut.base_data.expect(10.U)
//             dut.base_hist.expect(20.U)
//             dut.num_bins.expect(30.U)
//             dut.curr_data.expect(0.U)
//             dut.curr_bin.expect(0.U)
//             dut.bin_counts.expect(0.U)
            
//             // Simulate address request and response
//             dut.mem_io.addressRequests(0).ready.poke(true.B)
//             dut.clock.step()
            
//             dut.mem_io.addressRequests(0).valid.expect(true.B)
//             dut.mem_io.addressRequests(0).bits.expect(10.U)
            
//             // Simulate data response
//             dut.mem_io.dataResponses(0).valid.poke(true.B)
//             dut.mem_io.dataResponses(0).bits.poke(42.U)
//             dut.clock.step()
            
//             dut.ctrl_io.data_vals.valid.expect(true.B)
//             dut.ctrl_io.data_vals.bits.expect(42.U)
//             dut.mem_io.dataResponses(0).ready.expect(dut.ctrl_io.data_vals.ready.peek())
            
//             // Simulate histogram bin write request
//             dut.ctrl_io.hist_vals.valid.poke(true.B)
//             dut.ctrl_io.hist_vals.bits.poke(55.U)
//             dut.mem_io.writeRequests(0).ready.poke(true.B)
//             dut.clock.step()
            
//             dut.mem_io.writeRequests(0).valid.expect(true.B)
//             dut.mem_io.writeRequests(0).bits.address.expect(20.U)
//             dut.mem_io.writeRequests(0).bits.data.expect(55.U)
            
//             // Simulate bin count update
//             dut.ctrl_io.bin_counts.ready.poke(true.B)
//             dut.ctrl_io.bin_counts.bits.poke(5.U)
//             dut.clock.step()
            
//             dut.bin_counts.expect(5.U)
//         }
//     }
// }
