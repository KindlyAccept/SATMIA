package spatial_templates.muInfo

import chisel3._
import chisel3.util._
// import freechips.rocketchip.config.{Config, Parameters}
// import freechips.rocketchip.diplomacy.LazyModule
// import freechips.rocketchip.tile.{BuildRoCC, OpcodeSet, XLen}
// import freechips.rocketchip.tilelink._
// import freechips.rocketchip.tile._
import spatial_templates.template._
import spatial_templates.controller._
import spatial_templates.me._
import spatial_templates.mi._
import spatial_templates.pe._

class MITemplate(    
    n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    req_q_size: Int,
    bank_size: Int,
    data_size: Int,
    dfe_q_size: Int,
    use_bb: Boolean = false
) extends Module
    with WithNtoMMemInterface
    with WithDataflowPE
    with WithNToMDataflowToMem
    with WithBRAMLikeMEM {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }

  val mem =  if(use_bb){
    Seq.tabulate[BRAMLikeMem2](n_banks)(n =>
      Module(new BRAMLikeMem2(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
    )
  } else {
    Seq.tabulate[BRAMLikeMem1](n_banks)(n =>
      Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
    )
  }
  val me_interface = Module(
    new NtoMMemInterface(
      data_size, // p_width,
      log2Up(bank_size), // addr_width,
      n_banks, // n_banks,
      n_queues * n_pe + 1, // n_queue,
      req_q_size // q_depth
    )
  )

  me_interface.connectMems(mem)

  val df_pe = Seq.tabulate[MIPE](n_pe)(n =>
    Module(
      new MIPE(
        new ElemId(3, n, 0, 0),
        new CtrlInterfaceIO(),
        data_size, // p_width
        log2Up(bank_size), // addr_width
        data_size, // data_width
        resp_q_size, // rQueueDepth
        n_banks, // n_banks
        n, // bank_id
        dfe_q_size
      )
    )
  )

  for (i <- 0 until df_pe.size) {
    connectDFPEToNtoMMEInterfaceInterleaved(
      me_interface,
      df_pe(i),
      i,
      df_pe.size,
      Array(false, true, true, true, true),
      1
    )
  }

  val controller = Module(
    new MIController(log2Up(bank_size)+get_bank_bits(n_banks), data_size, n_banks)
  )

  // TODO: internalize this logic
  controller.mem_io.request <> me_interface.io.inReq(0)
  controller.mem_io.response <> me_interface.io.outData(0)
  controller.mem_io.busy := me_interface.io.busy

  for (i <- 0 until n_pe) {
    df_pe(i).addr_gen_ctrl_io <> controller.pe_regs(i)
    controller.pe_ctrl(i) <> df_pe(i).io
  }

  val ctrl_io = IO(new RoCCControllerIO(n_pe, 32))
  controller.io <> ctrl_io
}