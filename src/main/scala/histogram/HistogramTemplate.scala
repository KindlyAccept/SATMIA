// package spatial_templates.histogram

// import chisel3._
// import chisel3.util._
// import spatial_templates.histogram._
// import spatial_templates.template._
// import spatial_templates.controller._
// import spatial_templates.me._
// import spatial_templates.mi._
// import spatial_templates.pe._

// class HistogramTemplate (
//     n_banks: Int,
//     n_queues: Int,
//     n_pe: Int,
//     resp_q_size: Int,
//     req_q_size: Int,
//     bank_size: Int,
//     data_size: Int,
//     dfe_q_size: Int,
//     use_bb: Boolean = false
// ) extends Module 
// with WithNtoMMemInterface
// with WithDataflowPE
// with WithNToMDataflowToMem
// with WithBRAMLikeMEM {
//     // 获取银行位数
//     def get_bank_bits(n_banks: Int): Int = {
//         if (n_banks > 1)
//             return log2Ceil(n_banks)
//         else
//             return 0
//     }
    
//     // 根据 use_bb 决定使用哪种内存模块
//     val mem = if (use_bb) {
//         Seq.tabulate[BRAMLikeMem2](n_banks)(n =>
//             Module(new BRAMLikeMem2(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
//         )
//     } else {
//         Seq.tabulate[BRAMLikeMem1](n_banks)(n =>
//             Module(new BRAMLikeMem1(new ElemId(3, n, 0, 0), 36, log2Up(bank_size)))
//         )
//     }

//     // 初始化内存接口并连接到内存模块
//     val me_interface = Module(
//         new NtoMMemInterface(
//             data_size, // p_width
//             log2Up(bank_size), // addr_width
//             n_banks, // n_banks
//             n_queues * n_pe + 1, // n_queue
//             req_q_size // q_depth
//         )
//     )
//     me_interface.connectMems(mem)

//     // 创建多个 HistogramPE 单元，按需分配给每个处理单元。
//     val df_pe = Seq.tabulate[HistogramPE](n_pe)(n =>
//     Module(
//             new HistogramPE(
//             new ElemId(3, n, 0, 0),
//             new CtrlInterfaceIO(),
//             data_size, // p_width
//             log2Up(bank_size), // addr_width
//             data_size, // data_width
//             resp_q_size, // rQueueDepth
//             n_banks, // n_banks
//             n, // bank_id
//             dfe_q_size
//             )
//         )
//     )

//     // 将每个 HistogramPE 单元连接到内存接口。
//     for (i <- 0 until df_pe.size) {
//         connectDFPEToNtoMMEInterfaceInterleaved(
//             me_interface,
//             df_pe(i),
//             i,
//             df_pe.size,
//             Array(false, true, true, true, true),
//             1
//         )
//     }

//     // 创建并初始化 HistogramController
//     // val controller = Module(
//     //     // new HistogramController(log2Up(bank_size) + get_bank_bits(n_banks), data_size, n_banks)
//     // )   

//     // 将控制器连接到内存接口和数据流处理单元。
//     controller.mem_io.request <> me_interface.io.inReq(0)
//     controller.mem_io.response <> me_interface.io.outData(0)
//     controller.mem_io.busy := me_interface.io.busy

//     for (i <- 0 until n_pe) {
//         df_pe(i).addr_gen_ctrl_io <> controller.pe_regs(i)
//         controller.pe_ctrl(i) <> df_pe(i).io
//     }

//     // 外部 RoCC 接口？
//     // val ctrl_io = IO(new RoCCControllerIO(n_pe, 32))
//     // controller.io <> ctrl_io

// // TODO: imitate

// }

