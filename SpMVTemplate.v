module BRAMLikeMem1(
  input         clock,
  input         io_enable_1,
  input         io_write_1,
  input  [13:0] io_addr_1,
  input  [35:0] io_dataIn_1,
  output [35:0] io_dataOut_1,
  input         io_enable_2,
  input         io_write_2,
  input  [13:0] io_addr_2,
  input  [35:0] io_dataIn_2,
  output [35:0] io_dataOut_2
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [35:0] mem [0:16383]; // @[ME.scala 113:24]
  wire  mem_io_dataOut_1_MPORT_en; // @[ME.scala 113:24]
  wire [13:0] mem_io_dataOut_1_MPORT_addr; // @[ME.scala 113:24]
  wire [35:0] mem_io_dataOut_1_MPORT_data; // @[ME.scala 113:24]
  wire  mem_io_dataOut_2_MPORT_en; // @[ME.scala 113:24]
  wire [13:0] mem_io_dataOut_2_MPORT_addr; // @[ME.scala 113:24]
  wire [35:0] mem_io_dataOut_2_MPORT_data; // @[ME.scala 113:24]
  wire [35:0] mem_MPORT_data; // @[ME.scala 113:24]
  wire [13:0] mem_MPORT_addr; // @[ME.scala 113:24]
  wire  mem_MPORT_mask; // @[ME.scala 113:24]
  wire  mem_MPORT_en; // @[ME.scala 113:24]
  wire [35:0] mem_MPORT_1_data; // @[ME.scala 113:24]
  wire [13:0] mem_MPORT_1_addr; // @[ME.scala 113:24]
  wire  mem_MPORT_1_mask; // @[ME.scala 113:24]
  wire  mem_MPORT_1_en; // @[ME.scala 113:24]
  reg  mem_io_dataOut_1_MPORT_en_pipe_0;
  reg [13:0] mem_io_dataOut_1_MPORT_addr_pipe_0;
  reg  mem_io_dataOut_2_MPORT_en_pipe_0;
  reg [13:0] mem_io_dataOut_2_MPORT_addr_pipe_0;
  assign mem_io_dataOut_1_MPORT_en = mem_io_dataOut_1_MPORT_en_pipe_0;
  assign mem_io_dataOut_1_MPORT_addr = mem_io_dataOut_1_MPORT_addr_pipe_0;
  assign mem_io_dataOut_1_MPORT_data = mem[mem_io_dataOut_1_MPORT_addr]; // @[ME.scala 113:24]
  assign mem_io_dataOut_2_MPORT_en = mem_io_dataOut_2_MPORT_en_pipe_0;
  assign mem_io_dataOut_2_MPORT_addr = mem_io_dataOut_2_MPORT_addr_pipe_0;
  assign mem_io_dataOut_2_MPORT_data = mem[mem_io_dataOut_2_MPORT_addr]; // @[ME.scala 113:24]
  assign mem_MPORT_data = io_dataIn_1;
  assign mem_MPORT_addr = io_addr_1;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_write_1;
  assign mem_MPORT_1_data = io_dataIn_2;
  assign mem_MPORT_1_addr = io_addr_2;
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_write_2;
  assign io_dataOut_1 = mem_io_dataOut_1_MPORT_data; // @[ME.scala 116:16]
  assign io_dataOut_2 = mem_io_dataOut_2_MPORT_data; // @[ME.scala 119:16]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[ME.scala 113:24]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[ME.scala 113:24]
    end
    mem_io_dataOut_1_MPORT_en_pipe_0 <= io_enable_1;
    if (io_enable_1) begin
      mem_io_dataOut_1_MPORT_addr_pipe_0 <= io_addr_1;
    end
    mem_io_dataOut_2_MPORT_en_pipe_0 <= io_enable_2;
    if (io_enable_2) begin
      mem_io_dataOut_2_MPORT_addr_pipe_0 <= io_addr_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem[initvar] = _RAND_0[35:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_dataOut_1_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_dataOut_1_MPORT_addr_pipe_0 = _RAND_2[13:0];
  _RAND_3 = {1{`RANDOM}};
  mem_io_dataOut_2_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mem_io_dataOut_2_MPORT_addr_pipe_0 = _RAND_4[13:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_write,
  input  [14:0] io_enq_bits_addr,
  input  [31:0] io_enq_bits_dataIn,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_write,
  output [14:0] io_deq_bits_addr,
  output [31:0] io_deq_bits_dataIn
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  ram_write [0:1023]; // @[Decoupled.scala 275:95]
  wire  ram_write_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [9:0] ram_write_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_write_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_write_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_write_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_write_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_write_MPORT_en; // @[Decoupled.scala 275:95]
  reg [14:0] ram_addr [0:1023]; // @[Decoupled.scala 275:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [9:0] ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [14:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [14:0] ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_addr_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_dataIn [0:1023]; // @[Decoupled.scala 275:95]
  wire  ram_dataIn_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [9:0] ram_dataIn_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_dataIn_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_dataIn_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_dataIn_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_dataIn_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_dataIn_MPORT_en; // @[Decoupled.scala 275:95]
  reg [9:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [9:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [9:0] _value_T_1 = enq_ptr_value + 10'h1; // @[Counter.scala 77:24]
  wire [9:0] _value_T_3 = deq_ptr_value + 10'h1; // @[Counter.scala 77:24]
  assign ram_write_io_deq_bits_MPORT_en = 1'h1;
  assign ram_write_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_write_io_deq_bits_MPORT_data = ram_write[ram_write_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_write_MPORT_data = io_enq_bits_write;
  assign ram_write_MPORT_addr = enq_ptr_value;
  assign ram_write_MPORT_mask = 1'h1;
  assign ram_write_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = enq_ptr_value;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_dataIn_io_deq_bits_MPORT_en = 1'h1;
  assign ram_dataIn_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_dataIn_io_deq_bits_MPORT_data = ram_dataIn[ram_dataIn_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_dataIn_MPORT_data = io_enq_bits_dataIn;
  assign ram_dataIn_MPORT_addr = enq_ptr_value;
  assign ram_dataIn_MPORT_mask = 1'h1;
  assign ram_dataIn_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_write = ram_write_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_dataIn = ram_dataIn_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_write_MPORT_en & ram_write_MPORT_mask) begin
      ram_write[ram_write_MPORT_addr] <= ram_write_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_dataIn_MPORT_en & ram_dataIn_MPORT_mask) begin
      ram_dataIn[ram_dataIn_MPORT_addr] <= ram_dataIn_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 10'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 10'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_write[initvar] = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_addr[initvar] = _RAND_1[14:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_dataIn[initvar] = _RAND_2[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enq_ptr_value = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  deq_ptr_value = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BankAccessQueue(
  input         clock,
  input         reset,
  output        io_outSeq_0_write,
  output [13:0] io_outSeq_0_addr,
  output [31:0] io_outSeq_0_dataIn,
  output        io_outSeq_0_valid,
  input  [31:0] io_outSeq_0_dataOut,
  output        io_outSeq_1_write,
  output [13:0] io_outSeq_1_addr,
  output [31:0] io_outSeq_1_dataIn,
  output        io_outSeq_1_valid,
  input  [31:0] io_outSeq_1_dataOut,
  output        io_inReq_ready,
  input         io_inReq_valid,
  input         io_inReq_bits_write,
  input  [14:0] io_inReq_bits_addr,
  input  [31:0] io_inReq_bits_dataIn,
  input         io_reqDone_0,
  input         io_reqDone_1,
  input         io_outData_ready,
  output        io_outData_valid,
  output [31:0] io_outData_bits,
  output        io_empty
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  requestQueue_clock; // @[Decoupled.scala 377:21]
  wire  requestQueue_reset; // @[Decoupled.scala 377:21]
  wire  requestQueue_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  requestQueue_io_enq_valid; // @[Decoupled.scala 377:21]
  wire  requestQueue_io_enq_bits_write; // @[Decoupled.scala 377:21]
  wire [14:0] requestQueue_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire [31:0] requestQueue_io_enq_bits_dataIn; // @[Decoupled.scala 377:21]
  wire  requestQueue_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  requestQueue_io_deq_valid; // @[Decoupled.scala 377:21]
  wire  requestQueue_io_deq_bits_write; // @[Decoupled.scala 377:21]
  wire [14:0] requestQueue_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire [31:0] requestQueue_io_deq_bits_dataIn; // @[Decoupled.scala 377:21]
  wire  reqBank = requestQueue_io_deq_bits_addr[14]; // @[MEInterface.scala 106:26]
  wire  validEl = ~reqBank & requestQueue_io_deq_valid; // @[MEInterface.scala 108:58]
  wire  validEl_1 = reqBank & requestQueue_io_deq_valid; // @[MEInterface.scala 108:58]
  wire [1:0] _T = {io_reqDone_1,io_reqDone_0}; // @[MEInterface.scala 117:20]
  wire [1:0] _outSel_T = {io_reqDone_0,io_reqDone_1}; // @[Cat.scala 33:92]
  wire [1:0] _outSel_T_3 = {_outSel_T[0],_outSel_T[1]}; // @[Cat.scala 33:92]
  wire [1:0] _outSel_T_4 = 2'h1 << reqBank; // @[OneHot.scala 57:35]
  reg  io_outData_valid_REG; // @[MEInterface.scala 126:30]
  reg [1:0] io_outData_bits_REG; // @[MEInterface.scala 127:35]
  wire [31:0] _io_outData_bits_T_2 = io_outData_bits_REG[0] ? io_outSeq_0_dataOut : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_outData_bits_T_3 = io_outData_bits_REG[1] ? io_outSeq_1_dataOut : 32'h0; // @[Mux.scala 27:73]
  Queue requestQueue ( // @[Decoupled.scala 377:21]
    .clock(requestQueue_clock),
    .reset(requestQueue_reset),
    .io_enq_ready(requestQueue_io_enq_ready),
    .io_enq_valid(requestQueue_io_enq_valid),
    .io_enq_bits_write(requestQueue_io_enq_bits_write),
    .io_enq_bits_addr(requestQueue_io_enq_bits_addr),
    .io_enq_bits_dataIn(requestQueue_io_enq_bits_dataIn),
    .io_deq_ready(requestQueue_io_deq_ready),
    .io_deq_valid(requestQueue_io_deq_valid),
    .io_deq_bits_write(requestQueue_io_deq_bits_write),
    .io_deq_bits_addr(requestQueue_io_deq_bits_addr),
    .io_deq_bits_dataIn(requestQueue_io_deq_bits_dataIn)
  );
  assign io_outSeq_0_write = requestQueue_io_deq_bits_write & validEl; // @[MEInterface.scala 109:45]
  assign io_outSeq_0_addr = requestQueue_io_deq_bits_addr[13:0]; // @[MEInterface.scala 112:42]
  assign io_outSeq_0_dataIn = requestQueue_io_deq_bits_dataIn; // @[MEInterface.scala 110:20]
  assign io_outSeq_0_valid = ~reqBank & requestQueue_io_deq_valid; // @[MEInterface.scala 108:58]
  assign io_outSeq_1_write = requestQueue_io_deq_bits_write & validEl_1; // @[MEInterface.scala 109:45]
  assign io_outSeq_1_addr = requestQueue_io_deq_bits_addr[13:0]; // @[MEInterface.scala 112:42]
  assign io_outSeq_1_dataIn = requestQueue_io_deq_bits_dataIn; // @[MEInterface.scala 110:20]
  assign io_outSeq_1_valid = reqBank & requestQueue_io_deq_valid; // @[MEInterface.scala 108:58]
  assign io_inReq_ready = requestQueue_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_outData_valid = io_outData_valid_REG; // @[MEInterface.scala 126:20]
  assign io_outData_bits = _io_outData_bits_T_2 | _io_outData_bits_T_3; // @[Mux.scala 27:73]
  assign io_empty = ~requestQueue_io_deq_valid; // @[MEInterface.scala 128:15]
  assign requestQueue_clock = clock;
  assign requestQueue_reset = reset;
  assign requestQueue_io_enq_valid = io_inReq_valid; // @[Decoupled.scala 379:22]
  assign requestQueue_io_enq_bits_write = io_inReq_bits_write; // @[Decoupled.scala 380:21]
  assign requestQueue_io_enq_bits_addr = io_inReq_bits_addr; // @[Decoupled.scala 380:21]
  assign requestQueue_io_enq_bits_dataIn = io_inReq_bits_dataIn; // @[Decoupled.scala 380:21]
  assign requestQueue_io_deq_ready = |_T & (io_outData_ready | requestQueue_io_deq_bits_write); // @[MEInterface.scala 117:84]
  always @(posedge clock) begin
    io_outData_valid_REG <= |_T & (io_outData_ready | requestQueue_io_deq_bits_write) & ~requestQueue_io_deq_bits_write; // @[MEInterface.scala 117:132 118:15 122:15]
    io_outData_bits_REG <= _outSel_T_3 & _outSel_T_4; // @[MEInterface.scala 124:41]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_outData_valid_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_outData_bits_REG = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TwoBankSelector(
  input         clock,
  output        io_portOut_1_write,
  output [13:0] io_portOut_1_addr,
  output [31:0] io_portOut_1_dataIn,
  output        io_portOut_1_valid,
  input  [31:0] io_portOut_1_dataOut,
  output        io_portOut_2_write,
  output [13:0] io_portOut_2_addr,
  output [31:0] io_portOut_2_dataIn,
  output        io_portOut_2_valid,
  input  [31:0] io_portOut_2_dataOut,
  input         io_inSeq_0_write,
  input  [13:0] io_inSeq_0_addr,
  input  [31:0] io_inSeq_0_dataIn,
  input         io_inSeq_0_valid,
  output [31:0] io_inSeq_0_dataOut,
  input         io_inSeq_1_write,
  input  [13:0] io_inSeq_1_addr,
  input  [31:0] io_inSeq_1_dataIn,
  input         io_inSeq_1_valid,
  output [31:0] io_inSeq_1_dataOut,
  input         io_inSeq_2_write,
  input  [13:0] io_inSeq_2_addr,
  input  [31:0] io_inSeq_2_dataIn,
  input         io_inSeq_2_valid,
  output [31:0] io_inSeq_2_dataOut,
  input         io_inSeq_3_write,
  input  [13:0] io_inSeq_3_addr,
  input  [31:0] io_inSeq_3_dataIn,
  input         io_inSeq_3_valid,
  output [31:0] io_inSeq_3_dataOut,
  input         io_inSeq_4_write,
  input  [13:0] io_inSeq_4_addr,
  input  [31:0] io_inSeq_4_dataIn,
  input         io_inSeq_4_valid,
  output [31:0] io_inSeq_4_dataOut,
  input         io_inSeq_5_write,
  input  [13:0] io_inSeq_5_addr,
  input  [31:0] io_inSeq_5_dataIn,
  input         io_inSeq_5_valid,
  output [31:0] io_inSeq_5_dataOut,
  input         io_inSeq_6_write,
  input  [13:0] io_inSeq_6_addr,
  input  [31:0] io_inSeq_6_dataIn,
  input         io_inSeq_6_valid,
  output [31:0] io_inSeq_6_dataOut,
  input         io_inSeq_7_write,
  input  [13:0] io_inSeq_7_addr,
  input  [31:0] io_inSeq_7_dataIn,
  input         io_inSeq_7_valid,
  output [31:0] io_inSeq_7_dataOut,
  input         io_inSeq_8_write,
  input  [13:0] io_inSeq_8_addr,
  input  [31:0] io_inSeq_8_dataIn,
  input         io_inSeq_8_valid,
  output [31:0] io_inSeq_8_dataOut,
  input         io_inSeq_9_write,
  input  [13:0] io_inSeq_9_addr,
  input  [31:0] io_inSeq_9_dataIn,
  input         io_inSeq_9_valid,
  output [31:0] io_inSeq_9_dataOut,
  input         io_inSeq_10_write,
  input  [13:0] io_inSeq_10_addr,
  input  [31:0] io_inSeq_10_dataIn,
  input         io_inSeq_10_valid,
  output [31:0] io_inSeq_10_dataOut,
  output        io_reqDone_0,
  output        io_reqDone_1,
  output        io_reqDone_2,
  output        io_reqDone_3,
  output        io_reqDone_4,
  output        io_reqDone_5,
  output        io_reqDone_6,
  output        io_reqDone_7,
  output        io_reqDone_8,
  output        io_reqDone_9,
  output        io_reqDone_10
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] oHSeq_lo = {io_inSeq_6_valid,io_inSeq_7_valid,io_inSeq_8_valid,io_inSeq_9_valid,io_inSeq_10_valid}; // @[Cat.scala 33:92]
  wire [10:0] _oHSeq_T = {io_inSeq_0_valid,io_inSeq_1_valid,io_inSeq_2_valid,io_inSeq_3_valid,io_inSeq_4_valid,
    io_inSeq_5_valid,oHSeq_lo}; // @[Cat.scala 33:92]
  wire [7:0] _GEN_0 = {{4'd0}, _oHSeq_T[7:4]}; // @[Bitwise.scala 108:31]
  wire [7:0] _oHSeq_T_5 = _GEN_0 & 8'hf; // @[Bitwise.scala 108:31]
  wire [7:0] _oHSeq_T_7 = {_oHSeq_T[3:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [7:0] _oHSeq_T_9 = _oHSeq_T_7 & 8'hf0; // @[Bitwise.scala 108:80]
  wire [7:0] _oHSeq_T_10 = _oHSeq_T_5 | _oHSeq_T_9; // @[Bitwise.scala 108:39]
  wire [7:0] _GEN_1 = {{2'd0}, _oHSeq_T_10[7:2]}; // @[Bitwise.scala 108:31]
  wire [7:0] _oHSeq_T_15 = _GEN_1 & 8'h33; // @[Bitwise.scala 108:31]
  wire [7:0] _oHSeq_T_17 = {_oHSeq_T_10[5:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [7:0] _oHSeq_T_19 = _oHSeq_T_17 & 8'hcc; // @[Bitwise.scala 108:80]
  wire [7:0] _oHSeq_T_20 = _oHSeq_T_15 | _oHSeq_T_19; // @[Bitwise.scala 108:39]
  wire [7:0] _GEN_2 = {{1'd0}, _oHSeq_T_20[7:1]}; // @[Bitwise.scala 108:31]
  wire [7:0] _oHSeq_T_25 = _GEN_2 & 8'h55; // @[Bitwise.scala 108:31]
  wire [7:0] _oHSeq_T_27 = {_oHSeq_T_20[6:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [7:0] _oHSeq_T_29 = _oHSeq_T_27 & 8'haa; // @[Bitwise.scala 108:80]
  wire [7:0] _oHSeq_T_30 = _oHSeq_T_25 | _oHSeq_T_29; // @[Bitwise.scala 108:39]
  wire [10:0] oHSeq = {_oHSeq_T_30,_oHSeq_T[8],_oHSeq_T[9],_oHSeq_T[10]}; // @[Cat.scala 33:92]
  wire [3:0] _portOneEncoded_T_11 = oHSeq[9] ? 4'h9 : 4'ha; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_12 = oHSeq[8] ? 4'h8 : _portOneEncoded_T_11; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_13 = oHSeq[7] ? 4'h7 : _portOneEncoded_T_12; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_14 = oHSeq[6] ? 4'h6 : _portOneEncoded_T_13; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_15 = oHSeq[5] ? 4'h5 : _portOneEncoded_T_14; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_16 = oHSeq[4] ? 4'h4 : _portOneEncoded_T_15; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_17 = oHSeq[3] ? 4'h3 : _portOneEncoded_T_16; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_18 = oHSeq[2] ? 4'h2 : _portOneEncoded_T_17; // @[Mux.scala 47:70]
  wire [3:0] _portOneEncoded_T_19 = oHSeq[1] ? 4'h1 : _portOneEncoded_T_18; // @[Mux.scala 47:70]
  wire [3:0] portOneEncoded = oHSeq[0] ? 4'h0 : _portOneEncoded_T_19; // @[Mux.scala 47:70]
  wire [15:0] _oHSeq_2_T = 16'h1 << portOneEncoded; // @[MEInterface.scala 37:24]
  wire [15:0] _oHSeq_2_T_1 = ~_oHSeq_2_T; // @[MEInterface.scala 37:18]
  wire [15:0] _GEN_3 = {{5'd0}, oHSeq}; // @[MEInterface.scala 37:44]
  wire [15:0] oHSeq_2 = _oHSeq_2_T_1 & _GEN_3; // @[MEInterface.scala 37:44]
  wire [3:0] _portTwoEncoded_T_16 = oHSeq_2[14] ? 4'he : 4'hf; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_17 = oHSeq_2[13] ? 4'hd : _portTwoEncoded_T_16; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_18 = oHSeq_2[12] ? 4'hc : _portTwoEncoded_T_17; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_19 = oHSeq_2[11] ? 4'hb : _portTwoEncoded_T_18; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_20 = oHSeq_2[10] ? 4'ha : _portTwoEncoded_T_19; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_21 = oHSeq_2[9] ? 4'h9 : _portTwoEncoded_T_20; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_22 = oHSeq_2[8] ? 4'h8 : _portTwoEncoded_T_21; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_23 = oHSeq_2[7] ? 4'h7 : _portTwoEncoded_T_22; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_24 = oHSeq_2[6] ? 4'h6 : _portTwoEncoded_T_23; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_25 = oHSeq_2[5] ? 4'h5 : _portTwoEncoded_T_24; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_26 = oHSeq_2[4] ? 4'h4 : _portTwoEncoded_T_25; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_27 = oHSeq_2[3] ? 4'h3 : _portTwoEncoded_T_26; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_28 = oHSeq_2[2] ? 4'h2 : _portTwoEncoded_T_27; // @[Mux.scala 47:70]
  wire [3:0] _portTwoEncoded_T_29 = oHSeq_2[1] ? 4'h1 : _portTwoEncoded_T_28; // @[Mux.scala 47:70]
  wire [3:0] portTwoEncoded = oHSeq_2[0] ? 4'h0 : _portTwoEncoded_T_29; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_11 = oHSeq[9] ? io_inSeq_9_write : io_inSeq_10_write; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_12 = oHSeq[8] ? io_inSeq_8_write : _portSelector_1_write_T_11; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_13 = oHSeq[7] ? io_inSeq_7_write : _portSelector_1_write_T_12; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_14 = oHSeq[6] ? io_inSeq_6_write : _portSelector_1_write_T_13; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_15 = oHSeq[5] ? io_inSeq_5_write : _portSelector_1_write_T_14; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_16 = oHSeq[4] ? io_inSeq_4_write : _portSelector_1_write_T_15; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_17 = oHSeq[3] ? io_inSeq_3_write : _portSelector_1_write_T_16; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_18 = oHSeq[2] ? io_inSeq_2_write : _portSelector_1_write_T_17; // @[Mux.scala 47:70]
  wire  _portSelector_1_write_T_19 = oHSeq[1] ? io_inSeq_1_write : _portSelector_1_write_T_18; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_11 = oHSeq[9] ? io_inSeq_9_addr : io_inSeq_10_addr; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_12 = oHSeq[8] ? io_inSeq_8_addr : _portSelector_1_addr_T_11; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_13 = oHSeq[7] ? io_inSeq_7_addr : _portSelector_1_addr_T_12; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_14 = oHSeq[6] ? io_inSeq_6_addr : _portSelector_1_addr_T_13; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_15 = oHSeq[5] ? io_inSeq_5_addr : _portSelector_1_addr_T_14; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_16 = oHSeq[4] ? io_inSeq_4_addr : _portSelector_1_addr_T_15; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_17 = oHSeq[3] ? io_inSeq_3_addr : _portSelector_1_addr_T_16; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_18 = oHSeq[2] ? io_inSeq_2_addr : _portSelector_1_addr_T_17; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_1_addr_T_19 = oHSeq[1] ? io_inSeq_1_addr : _portSelector_1_addr_T_18; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_11 = oHSeq[9] ? io_inSeq_9_dataIn : io_inSeq_10_dataIn; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_12 = oHSeq[8] ? io_inSeq_8_dataIn : _portSelector_1_dataIn_T_11; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_13 = oHSeq[7] ? io_inSeq_7_dataIn : _portSelector_1_dataIn_T_12; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_14 = oHSeq[6] ? io_inSeq_6_dataIn : _portSelector_1_dataIn_T_13; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_15 = oHSeq[5] ? io_inSeq_5_dataIn : _portSelector_1_dataIn_T_14; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_16 = oHSeq[4] ? io_inSeq_4_dataIn : _portSelector_1_dataIn_T_15; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_17 = oHSeq[3] ? io_inSeq_3_dataIn : _portSelector_1_dataIn_T_16; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_18 = oHSeq[2] ? io_inSeq_2_dataIn : _portSelector_1_dataIn_T_17; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_1_dataIn_T_19 = oHSeq[1] ? io_inSeq_1_dataIn : _portSelector_1_dataIn_T_18; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_11 = oHSeq[9] ? io_inSeq_9_valid : io_inSeq_10_valid; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_12 = oHSeq[8] ? io_inSeq_8_valid : _portSelector_1_valid_T_11; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_13 = oHSeq[7] ? io_inSeq_7_valid : _portSelector_1_valid_T_12; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_14 = oHSeq[6] ? io_inSeq_6_valid : _portSelector_1_valid_T_13; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_15 = oHSeq[5] ? io_inSeq_5_valid : _portSelector_1_valid_T_14; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_16 = oHSeq[4] ? io_inSeq_4_valid : _portSelector_1_valid_T_15; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_17 = oHSeq[3] ? io_inSeq_3_valid : _portSelector_1_valid_T_16; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_18 = oHSeq[2] ? io_inSeq_2_valid : _portSelector_1_valid_T_17; // @[Mux.scala 47:70]
  wire  _portSelector_1_valid_T_19 = oHSeq[1] ? io_inSeq_1_valid : _portSelector_1_valid_T_18; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_11 = oHSeq_2[9] ? io_inSeq_9_write : io_inSeq_10_write; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_12 = oHSeq_2[8] ? io_inSeq_8_write : _portSelector_2_write_T_11; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_13 = oHSeq_2[7] ? io_inSeq_7_write : _portSelector_2_write_T_12; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_14 = oHSeq_2[6] ? io_inSeq_6_write : _portSelector_2_write_T_13; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_15 = oHSeq_2[5] ? io_inSeq_5_write : _portSelector_2_write_T_14; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_16 = oHSeq_2[4] ? io_inSeq_4_write : _portSelector_2_write_T_15; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_17 = oHSeq_2[3] ? io_inSeq_3_write : _portSelector_2_write_T_16; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_18 = oHSeq_2[2] ? io_inSeq_2_write : _portSelector_2_write_T_17; // @[Mux.scala 47:70]
  wire  _portSelector_2_write_T_19 = oHSeq_2[1] ? io_inSeq_1_write : _portSelector_2_write_T_18; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_11 = oHSeq_2[9] ? io_inSeq_9_addr : io_inSeq_10_addr; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_12 = oHSeq_2[8] ? io_inSeq_8_addr : _portSelector_2_addr_T_11; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_13 = oHSeq_2[7] ? io_inSeq_7_addr : _portSelector_2_addr_T_12; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_14 = oHSeq_2[6] ? io_inSeq_6_addr : _portSelector_2_addr_T_13; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_15 = oHSeq_2[5] ? io_inSeq_5_addr : _portSelector_2_addr_T_14; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_16 = oHSeq_2[4] ? io_inSeq_4_addr : _portSelector_2_addr_T_15; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_17 = oHSeq_2[3] ? io_inSeq_3_addr : _portSelector_2_addr_T_16; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_18 = oHSeq_2[2] ? io_inSeq_2_addr : _portSelector_2_addr_T_17; // @[Mux.scala 47:70]
  wire [13:0] _portSelector_2_addr_T_19 = oHSeq_2[1] ? io_inSeq_1_addr : _portSelector_2_addr_T_18; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_11 = oHSeq_2[9] ? io_inSeq_9_dataIn : io_inSeq_10_dataIn; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_12 = oHSeq_2[8] ? io_inSeq_8_dataIn : _portSelector_2_dataIn_T_11; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_13 = oHSeq_2[7] ? io_inSeq_7_dataIn : _portSelector_2_dataIn_T_12; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_14 = oHSeq_2[6] ? io_inSeq_6_dataIn : _portSelector_2_dataIn_T_13; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_15 = oHSeq_2[5] ? io_inSeq_5_dataIn : _portSelector_2_dataIn_T_14; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_16 = oHSeq_2[4] ? io_inSeq_4_dataIn : _portSelector_2_dataIn_T_15; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_17 = oHSeq_2[3] ? io_inSeq_3_dataIn : _portSelector_2_dataIn_T_16; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_18 = oHSeq_2[2] ? io_inSeq_2_dataIn : _portSelector_2_dataIn_T_17; // @[Mux.scala 47:70]
  wire [31:0] _portSelector_2_dataIn_T_19 = oHSeq_2[1] ? io_inSeq_1_dataIn : _portSelector_2_dataIn_T_18; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_11 = oHSeq_2[9] ? io_inSeq_9_valid : io_inSeq_10_valid; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_12 = oHSeq_2[8] ? io_inSeq_8_valid : _portSelector_2_valid_T_11; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_13 = oHSeq_2[7] ? io_inSeq_7_valid : _portSelector_2_valid_T_12; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_14 = oHSeq_2[6] ? io_inSeq_6_valid : _portSelector_2_valid_T_13; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_15 = oHSeq_2[5] ? io_inSeq_5_valid : _portSelector_2_valid_T_14; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_16 = oHSeq_2[4] ? io_inSeq_4_valid : _portSelector_2_valid_T_15; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_17 = oHSeq_2[3] ? io_inSeq_3_valid : _portSelector_2_valid_T_16; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_18 = oHSeq_2[2] ? io_inSeq_2_valid : _portSelector_2_valid_T_17; // @[Mux.scala 47:70]
  wire  _portSelector_2_valid_T_19 = oHSeq_2[1] ? io_inSeq_1_valid : _portSelector_2_valid_T_18; // @[Mux.scala 47:70]
  wire  _io_inSeq_0_dataOut_T = portOneEncoded == 4'h0; // @[MEInterface.scala 62:32]
  reg  io_inSeq_0_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_1_dataOut_T = portOneEncoded == 4'h1; // @[MEInterface.scala 62:32]
  reg  io_inSeq_1_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_2_dataOut_T = portOneEncoded == 4'h2; // @[MEInterface.scala 62:32]
  reg  io_inSeq_2_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_3_dataOut_T = portOneEncoded == 4'h3; // @[MEInterface.scala 62:32]
  reg  io_inSeq_3_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_4_dataOut_T = portOneEncoded == 4'h4; // @[MEInterface.scala 62:32]
  reg  io_inSeq_4_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_5_dataOut_T = portOneEncoded == 4'h5; // @[MEInterface.scala 62:32]
  reg  io_inSeq_5_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_6_dataOut_T = portOneEncoded == 4'h6; // @[MEInterface.scala 62:32]
  reg  io_inSeq_6_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_7_dataOut_T = portOneEncoded == 4'h7; // @[MEInterface.scala 62:32]
  reg  io_inSeq_7_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_8_dataOut_T = portOneEncoded == 4'h8; // @[MEInterface.scala 62:32]
  reg  io_inSeq_8_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_9_dataOut_T = portOneEncoded == 4'h9; // @[MEInterface.scala 62:32]
  reg  io_inSeq_9_dataOut_REG; // @[MEInterface.scala 62:14]
  wire  _io_inSeq_10_dataOut_T = portOneEncoded == 4'ha; // @[MEInterface.scala 62:32]
  reg  io_inSeq_10_dataOut_REG; // @[MEInterface.scala 62:14]
  assign io_portOut_1_write = oHSeq[0] ? io_inSeq_0_write : _portSelector_1_write_T_19; // @[Mux.scala 47:70]
  assign io_portOut_1_addr = oHSeq[0] ? io_inSeq_0_addr : _portSelector_1_addr_T_19; // @[Mux.scala 47:70]
  assign io_portOut_1_dataIn = oHSeq[0] ? io_inSeq_0_dataIn : _portSelector_1_dataIn_T_19; // @[Mux.scala 47:70]
  assign io_portOut_1_valid = oHSeq[0] ? io_inSeq_0_valid : _portSelector_1_valid_T_19; // @[Mux.scala 47:70]
  assign io_portOut_2_write = oHSeq_2[0] ? io_inSeq_0_write : _portSelector_2_write_T_19; // @[Mux.scala 47:70]
  assign io_portOut_2_addr = oHSeq_2[0] ? io_inSeq_0_addr : _portSelector_2_addr_T_19; // @[Mux.scala 47:70]
  assign io_portOut_2_dataIn = oHSeq_2[0] ? io_inSeq_0_dataIn : _portSelector_2_dataIn_T_19; // @[Mux.scala 47:70]
  assign io_portOut_2_valid = oHSeq_2[0] ? io_inSeq_0_valid : _portSelector_2_valid_T_19; // @[Mux.scala 47:70]
  assign io_inSeq_0_dataOut = io_inSeq_0_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_1_dataOut = io_inSeq_1_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_2_dataOut = io_inSeq_2_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_3_dataOut = io_inSeq_3_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_4_dataOut = io_inSeq_4_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_5_dataOut = io_inSeq_5_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_6_dataOut = io_inSeq_6_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_7_dataOut = io_inSeq_7_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_8_dataOut = io_inSeq_8_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_9_dataOut = io_inSeq_9_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_inSeq_10_dataOut = io_inSeq_10_dataOut_REG ? io_portOut_1_dataOut : io_portOut_2_dataOut; // @[MEInterface.scala 61:27]
  assign io_reqDone_0 = (_io_inSeq_0_dataOut_T | portTwoEncoded == 4'h0) & io_inSeq_0_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_1 = (_io_inSeq_1_dataOut_T | portTwoEncoded == 4'h1) & io_inSeq_1_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_2 = (_io_inSeq_2_dataOut_T | portTwoEncoded == 4'h2) & io_inSeq_2_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_3 = (_io_inSeq_3_dataOut_T | portTwoEncoded == 4'h3) & io_inSeq_3_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_4 = (_io_inSeq_4_dataOut_T | portTwoEncoded == 4'h4) & io_inSeq_4_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_5 = (_io_inSeq_5_dataOut_T | portTwoEncoded == 4'h5) & io_inSeq_5_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_6 = (_io_inSeq_6_dataOut_T | portTwoEncoded == 4'h6) & io_inSeq_6_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_7 = (_io_inSeq_7_dataOut_T | portTwoEncoded == 4'h7) & io_inSeq_7_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_8 = (_io_inSeq_8_dataOut_T | portTwoEncoded == 4'h8) & io_inSeq_8_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_9 = (_io_inSeq_9_dataOut_T | portTwoEncoded == 4'h9) & io_inSeq_9_valid; // @[MEInterface.scala 68:59]
  assign io_reqDone_10 = (_io_inSeq_10_dataOut_T | portTwoEncoded == 4'ha) & io_inSeq_10_valid; // @[MEInterface.scala 68:59]
  always @(posedge clock) begin
    io_inSeq_0_dataOut_REG <= portOneEncoded == 4'h0; // @[MEInterface.scala 62:32]
    io_inSeq_1_dataOut_REG <= portOneEncoded == 4'h1; // @[MEInterface.scala 62:32]
    io_inSeq_2_dataOut_REG <= portOneEncoded == 4'h2; // @[MEInterface.scala 62:32]
    io_inSeq_3_dataOut_REG <= portOneEncoded == 4'h3; // @[MEInterface.scala 62:32]
    io_inSeq_4_dataOut_REG <= portOneEncoded == 4'h4; // @[MEInterface.scala 62:32]
    io_inSeq_5_dataOut_REG <= portOneEncoded == 4'h5; // @[MEInterface.scala 62:32]
    io_inSeq_6_dataOut_REG <= portOneEncoded == 4'h6; // @[MEInterface.scala 62:32]
    io_inSeq_7_dataOut_REG <= portOneEncoded == 4'h7; // @[MEInterface.scala 62:32]
    io_inSeq_8_dataOut_REG <= portOneEncoded == 4'h8; // @[MEInterface.scala 62:32]
    io_inSeq_9_dataOut_REG <= portOneEncoded == 4'h9; // @[MEInterface.scala 62:32]
    io_inSeq_10_dataOut_REG <= portOneEncoded == 4'ha; // @[MEInterface.scala 62:32]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_inSeq_0_dataOut_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_inSeq_1_dataOut_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_inSeq_2_dataOut_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_inSeq_3_dataOut_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_inSeq_4_dataOut_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_inSeq_5_dataOut_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_inSeq_6_dataOut_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_inSeq_7_dataOut_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_inSeq_8_dataOut_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_inSeq_9_dataOut_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_inSeq_10_dataOut_REG = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NtoMMemInterface(
  input         clock,
  input         reset,
  output        io_inReq_0_ready,
  input         io_inReq_0_valid,
  input         io_inReq_0_bits_write,
  input  [14:0] io_inReq_0_bits_addr,
  input  [31:0] io_inReq_0_bits_dataIn,
  output        io_inReq_1_ready,
  input         io_inReq_1_valid,
  input  [14:0] io_inReq_1_bits_addr,
  input  [31:0] io_inReq_1_bits_dataIn,
  output        io_inReq_2_ready,
  input         io_inReq_2_valid,
  input  [14:0] io_inReq_2_bits_addr,
  input  [31:0] io_inReq_2_bits_dataIn,
  output        io_inReq_3_ready,
  input         io_inReq_3_valid,
  input  [14:0] io_inReq_3_bits_addr,
  output        io_inReq_4_ready,
  input         io_inReq_4_valid,
  input  [14:0] io_inReq_4_bits_addr,
  output        io_inReq_5_ready,
  input         io_inReq_5_valid,
  input  [14:0] io_inReq_5_bits_addr,
  output        io_inReq_6_ready,
  input         io_inReq_6_valid,
  input  [14:0] io_inReq_6_bits_addr,
  output        io_inReq_7_ready,
  input         io_inReq_7_valid,
  input  [14:0] io_inReq_7_bits_addr,
  output        io_inReq_8_ready,
  input         io_inReq_8_valid,
  input  [14:0] io_inReq_8_bits_addr,
  output        io_inReq_9_ready,
  input         io_inReq_9_valid,
  input  [14:0] io_inReq_9_bits_addr,
  output        io_inReq_10_ready,
  input         io_inReq_10_valid,
  input  [14:0] io_inReq_10_bits_addr,
  output        io_outData_0_valid,
  output [31:0] io_outData_0_bits,
  input         io_outData_3_ready,
  output        io_outData_3_valid,
  output [31:0] io_outData_3_bits,
  input         io_outData_4_ready,
  output        io_outData_4_valid,
  output [31:0] io_outData_4_bits,
  input         io_outData_5_ready,
  output        io_outData_5_valid,
  output [31:0] io_outData_5_bits,
  input         io_outData_6_ready,
  output        io_outData_6_valid,
  output [31:0] io_outData_6_bits,
  input         io_outData_7_ready,
  output        io_outData_7_valid,
  output [31:0] io_outData_7_bits,
  input         io_outData_8_ready,
  output        io_outData_8_valid,
  output [31:0] io_outData_8_bits,
  input         io_outData_9_ready,
  output        io_outData_9_valid,
  output [31:0] io_outData_9_bits,
  input         io_outData_10_ready,
  output        io_outData_10_valid,
  output [31:0] io_outData_10_bits,
  output        io_portOut_1_0_write,
  output [13:0] io_portOut_1_0_addr,
  output [31:0] io_portOut_1_0_dataIn,
  output        io_portOut_1_0_valid,
  input  [31:0] io_portOut_1_0_dataOut,
  output        io_portOut_1_1_write,
  output [13:0] io_portOut_1_1_addr,
  output [31:0] io_portOut_1_1_dataIn,
  output        io_portOut_1_1_valid,
  input  [31:0] io_portOut_1_1_dataOut,
  output        io_portOut_2_0_write,
  output [13:0] io_portOut_2_0_addr,
  output [31:0] io_portOut_2_0_dataIn,
  output        io_portOut_2_0_valid,
  input  [31:0] io_portOut_2_0_dataOut,
  output        io_portOut_2_1_write,
  output [13:0] io_portOut_2_1_addr,
  output [31:0] io_portOut_2_1_dataIn,
  output        io_portOut_2_1_valid,
  input  [31:0] io_portOut_2_1_dataOut,
  output        io_busy
);
  wire  reqQueues_0_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_0_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_0_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_0_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_0_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_0_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_0_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_0_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_0_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_0_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_0_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_1_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_1_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_1_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_1_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_1_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_1_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_1_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_1_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_1_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_1_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_2_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_2_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_2_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_2_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_2_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_2_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_2_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_2_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_2_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_2_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_3_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_3_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_3_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_3_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_3_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_3_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_3_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_3_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_3_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_3_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_4_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_4_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_4_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_4_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_4_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_4_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_4_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_4_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_4_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_4_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_5_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_5_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_5_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_5_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_5_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_5_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_5_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_5_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_5_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_5_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_6_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_6_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_6_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_6_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_6_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_6_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_6_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_6_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_6_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_6_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_7_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_7_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_7_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_7_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_7_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_7_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_7_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_7_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_7_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_7_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_8_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_8_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_8_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_8_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_8_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_8_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_8_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_8_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_8_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_8_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_9_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_9_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_9_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_9_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_9_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_9_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_9_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_9_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_9_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_9_io_empty; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_clock; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_reset; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_outSeq_0_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_10_io_outSeq_0_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_10_io_outSeq_0_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_outSeq_0_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_10_io_outSeq_0_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_outSeq_1_write; // @[MEInterface.scala 179:11]
  wire [13:0] reqQueues_10_io_outSeq_1_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_10_io_outSeq_1_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_outSeq_1_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_10_io_outSeq_1_dataOut; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_inReq_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_inReq_valid; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_inReq_bits_write; // @[MEInterface.scala 179:11]
  wire [14:0] reqQueues_10_io_inReq_bits_addr; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_10_io_inReq_bits_dataIn; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_reqDone_0; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_reqDone_1; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_outData_ready; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_outData_valid; // @[MEInterface.scala 179:11]
  wire [31:0] reqQueues_10_io_outData_bits; // @[MEInterface.scala 179:11]
  wire  reqQueues_10_io_empty; // @[MEInterface.scala 179:11]
  wire  bankSelectors_0_clock; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_portOut_1_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_portOut_1_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_portOut_1_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_portOut_1_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_portOut_1_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_portOut_2_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_portOut_2_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_portOut_2_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_portOut_2_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_portOut_2_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_0_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_0_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_0_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_0_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_0_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_1_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_1_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_1_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_1_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_1_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_2_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_2_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_2_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_2_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_2_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_3_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_3_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_3_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_3_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_3_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_4_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_4_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_4_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_4_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_4_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_5_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_5_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_5_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_5_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_5_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_6_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_6_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_6_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_6_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_6_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_7_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_7_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_7_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_7_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_7_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_8_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_8_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_8_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_8_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_8_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_9_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_9_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_9_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_9_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_9_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_10_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_0_io_inSeq_10_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_10_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_inSeq_10_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_0_io_inSeq_10_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_0; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_1; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_2; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_3; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_4; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_5; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_6; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_7; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_8; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_9; // @[MEInterface.scala 183:29]
  wire  bankSelectors_0_io_reqDone_10; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_clock; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_portOut_1_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_portOut_1_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_portOut_1_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_portOut_1_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_portOut_1_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_portOut_2_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_portOut_2_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_portOut_2_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_portOut_2_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_portOut_2_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_0_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_0_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_0_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_0_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_0_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_1_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_1_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_1_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_1_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_1_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_2_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_2_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_2_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_2_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_2_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_3_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_3_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_3_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_3_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_3_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_4_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_4_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_4_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_4_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_4_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_5_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_5_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_5_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_5_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_5_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_6_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_6_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_6_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_6_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_6_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_7_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_7_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_7_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_7_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_7_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_8_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_8_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_8_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_8_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_8_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_9_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_9_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_9_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_9_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_9_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_10_write; // @[MEInterface.scala 183:29]
  wire [13:0] bankSelectors_1_io_inSeq_10_addr; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_10_dataIn; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_inSeq_10_valid; // @[MEInterface.scala 183:29]
  wire [31:0] bankSelectors_1_io_inSeq_10_dataOut; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_0; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_1; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_2; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_3; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_4; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_5; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_6; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_7; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_8; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_9; // @[MEInterface.scala 183:29]
  wire  bankSelectors_1_io_reqDone_10; // @[MEInterface.scala 183:29]
  BankAccessQueue reqQueues_0 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_0_clock),
    .reset(reqQueues_0_reset),
    .io_outSeq_0_write(reqQueues_0_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_0_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_0_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_0_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_0_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_0_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_0_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_0_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_0_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_0_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_0_io_inReq_ready),
    .io_inReq_valid(reqQueues_0_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_0_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_0_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_0_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_0_io_reqDone_0),
    .io_reqDone_1(reqQueues_0_io_reqDone_1),
    .io_outData_ready(reqQueues_0_io_outData_ready),
    .io_outData_valid(reqQueues_0_io_outData_valid),
    .io_outData_bits(reqQueues_0_io_outData_bits),
    .io_empty(reqQueues_0_io_empty)
  );
  BankAccessQueue reqQueues_1 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_1_clock),
    .reset(reqQueues_1_reset),
    .io_outSeq_0_write(reqQueues_1_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_1_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_1_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_1_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_1_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_1_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_1_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_1_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_1_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_1_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_1_io_inReq_ready),
    .io_inReq_valid(reqQueues_1_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_1_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_1_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_1_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_1_io_reqDone_0),
    .io_reqDone_1(reqQueues_1_io_reqDone_1),
    .io_outData_ready(reqQueues_1_io_outData_ready),
    .io_outData_valid(reqQueues_1_io_outData_valid),
    .io_outData_bits(reqQueues_1_io_outData_bits),
    .io_empty(reqQueues_1_io_empty)
  );
  BankAccessQueue reqQueues_2 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_2_clock),
    .reset(reqQueues_2_reset),
    .io_outSeq_0_write(reqQueues_2_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_2_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_2_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_2_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_2_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_2_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_2_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_2_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_2_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_2_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_2_io_inReq_ready),
    .io_inReq_valid(reqQueues_2_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_2_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_2_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_2_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_2_io_reqDone_0),
    .io_reqDone_1(reqQueues_2_io_reqDone_1),
    .io_outData_ready(reqQueues_2_io_outData_ready),
    .io_outData_valid(reqQueues_2_io_outData_valid),
    .io_outData_bits(reqQueues_2_io_outData_bits),
    .io_empty(reqQueues_2_io_empty)
  );
  BankAccessQueue reqQueues_3 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_3_clock),
    .reset(reqQueues_3_reset),
    .io_outSeq_0_write(reqQueues_3_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_3_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_3_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_3_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_3_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_3_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_3_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_3_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_3_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_3_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_3_io_inReq_ready),
    .io_inReq_valid(reqQueues_3_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_3_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_3_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_3_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_3_io_reqDone_0),
    .io_reqDone_1(reqQueues_3_io_reqDone_1),
    .io_outData_ready(reqQueues_3_io_outData_ready),
    .io_outData_valid(reqQueues_3_io_outData_valid),
    .io_outData_bits(reqQueues_3_io_outData_bits),
    .io_empty(reqQueues_3_io_empty)
  );
  BankAccessQueue reqQueues_4 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_4_clock),
    .reset(reqQueues_4_reset),
    .io_outSeq_0_write(reqQueues_4_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_4_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_4_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_4_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_4_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_4_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_4_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_4_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_4_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_4_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_4_io_inReq_ready),
    .io_inReq_valid(reqQueues_4_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_4_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_4_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_4_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_4_io_reqDone_0),
    .io_reqDone_1(reqQueues_4_io_reqDone_1),
    .io_outData_ready(reqQueues_4_io_outData_ready),
    .io_outData_valid(reqQueues_4_io_outData_valid),
    .io_outData_bits(reqQueues_4_io_outData_bits),
    .io_empty(reqQueues_4_io_empty)
  );
  BankAccessQueue reqQueues_5 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_5_clock),
    .reset(reqQueues_5_reset),
    .io_outSeq_0_write(reqQueues_5_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_5_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_5_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_5_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_5_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_5_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_5_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_5_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_5_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_5_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_5_io_inReq_ready),
    .io_inReq_valid(reqQueues_5_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_5_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_5_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_5_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_5_io_reqDone_0),
    .io_reqDone_1(reqQueues_5_io_reqDone_1),
    .io_outData_ready(reqQueues_5_io_outData_ready),
    .io_outData_valid(reqQueues_5_io_outData_valid),
    .io_outData_bits(reqQueues_5_io_outData_bits),
    .io_empty(reqQueues_5_io_empty)
  );
  BankAccessQueue reqQueues_6 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_6_clock),
    .reset(reqQueues_6_reset),
    .io_outSeq_0_write(reqQueues_6_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_6_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_6_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_6_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_6_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_6_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_6_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_6_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_6_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_6_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_6_io_inReq_ready),
    .io_inReq_valid(reqQueues_6_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_6_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_6_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_6_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_6_io_reqDone_0),
    .io_reqDone_1(reqQueues_6_io_reqDone_1),
    .io_outData_ready(reqQueues_6_io_outData_ready),
    .io_outData_valid(reqQueues_6_io_outData_valid),
    .io_outData_bits(reqQueues_6_io_outData_bits),
    .io_empty(reqQueues_6_io_empty)
  );
  BankAccessQueue reqQueues_7 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_7_clock),
    .reset(reqQueues_7_reset),
    .io_outSeq_0_write(reqQueues_7_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_7_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_7_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_7_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_7_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_7_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_7_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_7_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_7_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_7_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_7_io_inReq_ready),
    .io_inReq_valid(reqQueues_7_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_7_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_7_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_7_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_7_io_reqDone_0),
    .io_reqDone_1(reqQueues_7_io_reqDone_1),
    .io_outData_ready(reqQueues_7_io_outData_ready),
    .io_outData_valid(reqQueues_7_io_outData_valid),
    .io_outData_bits(reqQueues_7_io_outData_bits),
    .io_empty(reqQueues_7_io_empty)
  );
  BankAccessQueue reqQueues_8 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_8_clock),
    .reset(reqQueues_8_reset),
    .io_outSeq_0_write(reqQueues_8_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_8_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_8_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_8_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_8_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_8_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_8_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_8_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_8_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_8_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_8_io_inReq_ready),
    .io_inReq_valid(reqQueues_8_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_8_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_8_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_8_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_8_io_reqDone_0),
    .io_reqDone_1(reqQueues_8_io_reqDone_1),
    .io_outData_ready(reqQueues_8_io_outData_ready),
    .io_outData_valid(reqQueues_8_io_outData_valid),
    .io_outData_bits(reqQueues_8_io_outData_bits),
    .io_empty(reqQueues_8_io_empty)
  );
  BankAccessQueue reqQueues_9 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_9_clock),
    .reset(reqQueues_9_reset),
    .io_outSeq_0_write(reqQueues_9_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_9_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_9_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_9_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_9_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_9_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_9_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_9_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_9_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_9_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_9_io_inReq_ready),
    .io_inReq_valid(reqQueues_9_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_9_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_9_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_9_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_9_io_reqDone_0),
    .io_reqDone_1(reqQueues_9_io_reqDone_1),
    .io_outData_ready(reqQueues_9_io_outData_ready),
    .io_outData_valid(reqQueues_9_io_outData_valid),
    .io_outData_bits(reqQueues_9_io_outData_bits),
    .io_empty(reqQueues_9_io_empty)
  );
  BankAccessQueue reqQueues_10 ( // @[MEInterface.scala 179:11]
    .clock(reqQueues_10_clock),
    .reset(reqQueues_10_reset),
    .io_outSeq_0_write(reqQueues_10_io_outSeq_0_write),
    .io_outSeq_0_addr(reqQueues_10_io_outSeq_0_addr),
    .io_outSeq_0_dataIn(reqQueues_10_io_outSeq_0_dataIn),
    .io_outSeq_0_valid(reqQueues_10_io_outSeq_0_valid),
    .io_outSeq_0_dataOut(reqQueues_10_io_outSeq_0_dataOut),
    .io_outSeq_1_write(reqQueues_10_io_outSeq_1_write),
    .io_outSeq_1_addr(reqQueues_10_io_outSeq_1_addr),
    .io_outSeq_1_dataIn(reqQueues_10_io_outSeq_1_dataIn),
    .io_outSeq_1_valid(reqQueues_10_io_outSeq_1_valid),
    .io_outSeq_1_dataOut(reqQueues_10_io_outSeq_1_dataOut),
    .io_inReq_ready(reqQueues_10_io_inReq_ready),
    .io_inReq_valid(reqQueues_10_io_inReq_valid),
    .io_inReq_bits_write(reqQueues_10_io_inReq_bits_write),
    .io_inReq_bits_addr(reqQueues_10_io_inReq_bits_addr),
    .io_inReq_bits_dataIn(reqQueues_10_io_inReq_bits_dataIn),
    .io_reqDone_0(reqQueues_10_io_reqDone_0),
    .io_reqDone_1(reqQueues_10_io_reqDone_1),
    .io_outData_ready(reqQueues_10_io_outData_ready),
    .io_outData_valid(reqQueues_10_io_outData_valid),
    .io_outData_bits(reqQueues_10_io_outData_bits),
    .io_empty(reqQueues_10_io_empty)
  );
  TwoBankSelector bankSelectors_0 ( // @[MEInterface.scala 183:29]
    .clock(bankSelectors_0_clock),
    .io_portOut_1_write(bankSelectors_0_io_portOut_1_write),
    .io_portOut_1_addr(bankSelectors_0_io_portOut_1_addr),
    .io_portOut_1_dataIn(bankSelectors_0_io_portOut_1_dataIn),
    .io_portOut_1_valid(bankSelectors_0_io_portOut_1_valid),
    .io_portOut_1_dataOut(bankSelectors_0_io_portOut_1_dataOut),
    .io_portOut_2_write(bankSelectors_0_io_portOut_2_write),
    .io_portOut_2_addr(bankSelectors_0_io_portOut_2_addr),
    .io_portOut_2_dataIn(bankSelectors_0_io_portOut_2_dataIn),
    .io_portOut_2_valid(bankSelectors_0_io_portOut_2_valid),
    .io_portOut_2_dataOut(bankSelectors_0_io_portOut_2_dataOut),
    .io_inSeq_0_write(bankSelectors_0_io_inSeq_0_write),
    .io_inSeq_0_addr(bankSelectors_0_io_inSeq_0_addr),
    .io_inSeq_0_dataIn(bankSelectors_0_io_inSeq_0_dataIn),
    .io_inSeq_0_valid(bankSelectors_0_io_inSeq_0_valid),
    .io_inSeq_0_dataOut(bankSelectors_0_io_inSeq_0_dataOut),
    .io_inSeq_1_write(bankSelectors_0_io_inSeq_1_write),
    .io_inSeq_1_addr(bankSelectors_0_io_inSeq_1_addr),
    .io_inSeq_1_dataIn(bankSelectors_0_io_inSeq_1_dataIn),
    .io_inSeq_1_valid(bankSelectors_0_io_inSeq_1_valid),
    .io_inSeq_1_dataOut(bankSelectors_0_io_inSeq_1_dataOut),
    .io_inSeq_2_write(bankSelectors_0_io_inSeq_2_write),
    .io_inSeq_2_addr(bankSelectors_0_io_inSeq_2_addr),
    .io_inSeq_2_dataIn(bankSelectors_0_io_inSeq_2_dataIn),
    .io_inSeq_2_valid(bankSelectors_0_io_inSeq_2_valid),
    .io_inSeq_2_dataOut(bankSelectors_0_io_inSeq_2_dataOut),
    .io_inSeq_3_write(bankSelectors_0_io_inSeq_3_write),
    .io_inSeq_3_addr(bankSelectors_0_io_inSeq_3_addr),
    .io_inSeq_3_dataIn(bankSelectors_0_io_inSeq_3_dataIn),
    .io_inSeq_3_valid(bankSelectors_0_io_inSeq_3_valid),
    .io_inSeq_3_dataOut(bankSelectors_0_io_inSeq_3_dataOut),
    .io_inSeq_4_write(bankSelectors_0_io_inSeq_4_write),
    .io_inSeq_4_addr(bankSelectors_0_io_inSeq_4_addr),
    .io_inSeq_4_dataIn(bankSelectors_0_io_inSeq_4_dataIn),
    .io_inSeq_4_valid(bankSelectors_0_io_inSeq_4_valid),
    .io_inSeq_4_dataOut(bankSelectors_0_io_inSeq_4_dataOut),
    .io_inSeq_5_write(bankSelectors_0_io_inSeq_5_write),
    .io_inSeq_5_addr(bankSelectors_0_io_inSeq_5_addr),
    .io_inSeq_5_dataIn(bankSelectors_0_io_inSeq_5_dataIn),
    .io_inSeq_5_valid(bankSelectors_0_io_inSeq_5_valid),
    .io_inSeq_5_dataOut(bankSelectors_0_io_inSeq_5_dataOut),
    .io_inSeq_6_write(bankSelectors_0_io_inSeq_6_write),
    .io_inSeq_6_addr(bankSelectors_0_io_inSeq_6_addr),
    .io_inSeq_6_dataIn(bankSelectors_0_io_inSeq_6_dataIn),
    .io_inSeq_6_valid(bankSelectors_0_io_inSeq_6_valid),
    .io_inSeq_6_dataOut(bankSelectors_0_io_inSeq_6_dataOut),
    .io_inSeq_7_write(bankSelectors_0_io_inSeq_7_write),
    .io_inSeq_7_addr(bankSelectors_0_io_inSeq_7_addr),
    .io_inSeq_7_dataIn(bankSelectors_0_io_inSeq_7_dataIn),
    .io_inSeq_7_valid(bankSelectors_0_io_inSeq_7_valid),
    .io_inSeq_7_dataOut(bankSelectors_0_io_inSeq_7_dataOut),
    .io_inSeq_8_write(bankSelectors_0_io_inSeq_8_write),
    .io_inSeq_8_addr(bankSelectors_0_io_inSeq_8_addr),
    .io_inSeq_8_dataIn(bankSelectors_0_io_inSeq_8_dataIn),
    .io_inSeq_8_valid(bankSelectors_0_io_inSeq_8_valid),
    .io_inSeq_8_dataOut(bankSelectors_0_io_inSeq_8_dataOut),
    .io_inSeq_9_write(bankSelectors_0_io_inSeq_9_write),
    .io_inSeq_9_addr(bankSelectors_0_io_inSeq_9_addr),
    .io_inSeq_9_dataIn(bankSelectors_0_io_inSeq_9_dataIn),
    .io_inSeq_9_valid(bankSelectors_0_io_inSeq_9_valid),
    .io_inSeq_9_dataOut(bankSelectors_0_io_inSeq_9_dataOut),
    .io_inSeq_10_write(bankSelectors_0_io_inSeq_10_write),
    .io_inSeq_10_addr(bankSelectors_0_io_inSeq_10_addr),
    .io_inSeq_10_dataIn(bankSelectors_0_io_inSeq_10_dataIn),
    .io_inSeq_10_valid(bankSelectors_0_io_inSeq_10_valid),
    .io_inSeq_10_dataOut(bankSelectors_0_io_inSeq_10_dataOut),
    .io_reqDone_0(bankSelectors_0_io_reqDone_0),
    .io_reqDone_1(bankSelectors_0_io_reqDone_1),
    .io_reqDone_2(bankSelectors_0_io_reqDone_2),
    .io_reqDone_3(bankSelectors_0_io_reqDone_3),
    .io_reqDone_4(bankSelectors_0_io_reqDone_4),
    .io_reqDone_5(bankSelectors_0_io_reqDone_5),
    .io_reqDone_6(bankSelectors_0_io_reqDone_6),
    .io_reqDone_7(bankSelectors_0_io_reqDone_7),
    .io_reqDone_8(bankSelectors_0_io_reqDone_8),
    .io_reqDone_9(bankSelectors_0_io_reqDone_9),
    .io_reqDone_10(bankSelectors_0_io_reqDone_10)
  );
  TwoBankSelector bankSelectors_1 ( // @[MEInterface.scala 183:29]
    .clock(bankSelectors_1_clock),
    .io_portOut_1_write(bankSelectors_1_io_portOut_1_write),
    .io_portOut_1_addr(bankSelectors_1_io_portOut_1_addr),
    .io_portOut_1_dataIn(bankSelectors_1_io_portOut_1_dataIn),
    .io_portOut_1_valid(bankSelectors_1_io_portOut_1_valid),
    .io_portOut_1_dataOut(bankSelectors_1_io_portOut_1_dataOut),
    .io_portOut_2_write(bankSelectors_1_io_portOut_2_write),
    .io_portOut_2_addr(bankSelectors_1_io_portOut_2_addr),
    .io_portOut_2_dataIn(bankSelectors_1_io_portOut_2_dataIn),
    .io_portOut_2_valid(bankSelectors_1_io_portOut_2_valid),
    .io_portOut_2_dataOut(bankSelectors_1_io_portOut_2_dataOut),
    .io_inSeq_0_write(bankSelectors_1_io_inSeq_0_write),
    .io_inSeq_0_addr(bankSelectors_1_io_inSeq_0_addr),
    .io_inSeq_0_dataIn(bankSelectors_1_io_inSeq_0_dataIn),
    .io_inSeq_0_valid(bankSelectors_1_io_inSeq_0_valid),
    .io_inSeq_0_dataOut(bankSelectors_1_io_inSeq_0_dataOut),
    .io_inSeq_1_write(bankSelectors_1_io_inSeq_1_write),
    .io_inSeq_1_addr(bankSelectors_1_io_inSeq_1_addr),
    .io_inSeq_1_dataIn(bankSelectors_1_io_inSeq_1_dataIn),
    .io_inSeq_1_valid(bankSelectors_1_io_inSeq_1_valid),
    .io_inSeq_1_dataOut(bankSelectors_1_io_inSeq_1_dataOut),
    .io_inSeq_2_write(bankSelectors_1_io_inSeq_2_write),
    .io_inSeq_2_addr(bankSelectors_1_io_inSeq_2_addr),
    .io_inSeq_2_dataIn(bankSelectors_1_io_inSeq_2_dataIn),
    .io_inSeq_2_valid(bankSelectors_1_io_inSeq_2_valid),
    .io_inSeq_2_dataOut(bankSelectors_1_io_inSeq_2_dataOut),
    .io_inSeq_3_write(bankSelectors_1_io_inSeq_3_write),
    .io_inSeq_3_addr(bankSelectors_1_io_inSeq_3_addr),
    .io_inSeq_3_dataIn(bankSelectors_1_io_inSeq_3_dataIn),
    .io_inSeq_3_valid(bankSelectors_1_io_inSeq_3_valid),
    .io_inSeq_3_dataOut(bankSelectors_1_io_inSeq_3_dataOut),
    .io_inSeq_4_write(bankSelectors_1_io_inSeq_4_write),
    .io_inSeq_4_addr(bankSelectors_1_io_inSeq_4_addr),
    .io_inSeq_4_dataIn(bankSelectors_1_io_inSeq_4_dataIn),
    .io_inSeq_4_valid(bankSelectors_1_io_inSeq_4_valid),
    .io_inSeq_4_dataOut(bankSelectors_1_io_inSeq_4_dataOut),
    .io_inSeq_5_write(bankSelectors_1_io_inSeq_5_write),
    .io_inSeq_5_addr(bankSelectors_1_io_inSeq_5_addr),
    .io_inSeq_5_dataIn(bankSelectors_1_io_inSeq_5_dataIn),
    .io_inSeq_5_valid(bankSelectors_1_io_inSeq_5_valid),
    .io_inSeq_5_dataOut(bankSelectors_1_io_inSeq_5_dataOut),
    .io_inSeq_6_write(bankSelectors_1_io_inSeq_6_write),
    .io_inSeq_6_addr(bankSelectors_1_io_inSeq_6_addr),
    .io_inSeq_6_dataIn(bankSelectors_1_io_inSeq_6_dataIn),
    .io_inSeq_6_valid(bankSelectors_1_io_inSeq_6_valid),
    .io_inSeq_6_dataOut(bankSelectors_1_io_inSeq_6_dataOut),
    .io_inSeq_7_write(bankSelectors_1_io_inSeq_7_write),
    .io_inSeq_7_addr(bankSelectors_1_io_inSeq_7_addr),
    .io_inSeq_7_dataIn(bankSelectors_1_io_inSeq_7_dataIn),
    .io_inSeq_7_valid(bankSelectors_1_io_inSeq_7_valid),
    .io_inSeq_7_dataOut(bankSelectors_1_io_inSeq_7_dataOut),
    .io_inSeq_8_write(bankSelectors_1_io_inSeq_8_write),
    .io_inSeq_8_addr(bankSelectors_1_io_inSeq_8_addr),
    .io_inSeq_8_dataIn(bankSelectors_1_io_inSeq_8_dataIn),
    .io_inSeq_8_valid(bankSelectors_1_io_inSeq_8_valid),
    .io_inSeq_8_dataOut(bankSelectors_1_io_inSeq_8_dataOut),
    .io_inSeq_9_write(bankSelectors_1_io_inSeq_9_write),
    .io_inSeq_9_addr(bankSelectors_1_io_inSeq_9_addr),
    .io_inSeq_9_dataIn(bankSelectors_1_io_inSeq_9_dataIn),
    .io_inSeq_9_valid(bankSelectors_1_io_inSeq_9_valid),
    .io_inSeq_9_dataOut(bankSelectors_1_io_inSeq_9_dataOut),
    .io_inSeq_10_write(bankSelectors_1_io_inSeq_10_write),
    .io_inSeq_10_addr(bankSelectors_1_io_inSeq_10_addr),
    .io_inSeq_10_dataIn(bankSelectors_1_io_inSeq_10_dataIn),
    .io_inSeq_10_valid(bankSelectors_1_io_inSeq_10_valid),
    .io_inSeq_10_dataOut(bankSelectors_1_io_inSeq_10_dataOut),
    .io_reqDone_0(bankSelectors_1_io_reqDone_0),
    .io_reqDone_1(bankSelectors_1_io_reqDone_1),
    .io_reqDone_2(bankSelectors_1_io_reqDone_2),
    .io_reqDone_3(bankSelectors_1_io_reqDone_3),
    .io_reqDone_4(bankSelectors_1_io_reqDone_4),
    .io_reqDone_5(bankSelectors_1_io_reqDone_5),
    .io_reqDone_6(bankSelectors_1_io_reqDone_6),
    .io_reqDone_7(bankSelectors_1_io_reqDone_7),
    .io_reqDone_8(bankSelectors_1_io_reqDone_8),
    .io_reqDone_9(bankSelectors_1_io_reqDone_9),
    .io_reqDone_10(bankSelectors_1_io_reqDone_10)
  );
  assign io_inReq_0_ready = reqQueues_0_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_1_ready = reqQueues_1_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_2_ready = reqQueues_2_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_3_ready = reqQueues_3_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_4_ready = reqQueues_4_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_5_ready = reqQueues_5_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_6_ready = reqQueues_6_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_7_ready = reqQueues_7_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_8_ready = reqQueues_8_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_9_ready = reqQueues_9_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_inReq_10_ready = reqQueues_10_io_inReq_ready; // @[MEInterface.scala 197:17]
  assign io_outData_0_valid = reqQueues_0_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_0_bits = reqQueues_0_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_3_valid = reqQueues_3_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_3_bits = reqQueues_3_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_4_valid = reqQueues_4_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_4_bits = reqQueues_4_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_5_valid = reqQueues_5_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_5_bits = reqQueues_5_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_6_valid = reqQueues_6_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_6_bits = reqQueues_6_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_7_valid = reqQueues_7_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_7_bits = reqQueues_7_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_8_valid = reqQueues_8_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_8_bits = reqQueues_8_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_9_valid = reqQueues_9_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_9_bits = reqQueues_9_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_outData_10_valid = reqQueues_10_io_outData_valid; // @[MEInterface.scala 198:19]
  assign io_outData_10_bits = reqQueues_10_io_outData_bits; // @[MEInterface.scala 198:19]
  assign io_portOut_1_0_write = bankSelectors_0_io_portOut_1_write; // @[MEInterface.scala 187:35]
  assign io_portOut_1_0_addr = bankSelectors_0_io_portOut_1_addr; // @[MEInterface.scala 187:35]
  assign io_portOut_1_0_dataIn = bankSelectors_0_io_portOut_1_dataIn; // @[MEInterface.scala 187:35]
  assign io_portOut_1_0_valid = bankSelectors_0_io_portOut_1_valid; // @[MEInterface.scala 187:35]
  assign io_portOut_1_1_write = bankSelectors_1_io_portOut_1_write; // @[MEInterface.scala 187:35]
  assign io_portOut_1_1_addr = bankSelectors_1_io_portOut_1_addr; // @[MEInterface.scala 187:35]
  assign io_portOut_1_1_dataIn = bankSelectors_1_io_portOut_1_dataIn; // @[MEInterface.scala 187:35]
  assign io_portOut_1_1_valid = bankSelectors_1_io_portOut_1_valid; // @[MEInterface.scala 187:35]
  assign io_portOut_2_0_write = bankSelectors_0_io_portOut_2_write; // @[MEInterface.scala 188:35]
  assign io_portOut_2_0_addr = bankSelectors_0_io_portOut_2_addr; // @[MEInterface.scala 188:35]
  assign io_portOut_2_0_dataIn = bankSelectors_0_io_portOut_2_dataIn; // @[MEInterface.scala 188:35]
  assign io_portOut_2_0_valid = bankSelectors_0_io_portOut_2_valid; // @[MEInterface.scala 188:35]
  assign io_portOut_2_1_write = bankSelectors_1_io_portOut_2_write; // @[MEInterface.scala 188:35]
  assign io_portOut_2_1_addr = bankSelectors_1_io_portOut_2_addr; // @[MEInterface.scala 188:35]
  assign io_portOut_2_1_dataIn = bankSelectors_1_io_portOut_2_dataIn; // @[MEInterface.scala 188:35]
  assign io_portOut_2_1_valid = bankSelectors_1_io_portOut_2_valid; // @[MEInterface.scala 188:35]
  assign io_busy = ~(reqQueues_0_io_empty & reqQueues_1_io_empty & reqQueues_2_io_empty & reqQueues_3_io_empty &
    reqQueues_4_io_empty & reqQueues_5_io_empty & reqQueues_6_io_empty & reqQueues_7_io_empty & reqQueues_8_io_empty &
    reqQueues_9_io_empty & reqQueues_10_io_empty); // @[MEInterface.scala 201:14]
  assign reqQueues_0_clock = clock;
  assign reqQueues_0_reset = reset;
  assign reqQueues_0_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_0_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_0_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_0_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_0_io_inReq_valid = io_inReq_0_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_0_io_inReq_bits_write = io_inReq_0_bits_write; // @[MEInterface.scala 197:17]
  assign reqQueues_0_io_inReq_bits_addr = io_inReq_0_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_0_io_inReq_bits_dataIn = io_inReq_0_bits_dataIn; // @[MEInterface.scala 197:17]
  assign reqQueues_0_io_reqDone_0 = bankSelectors_0_io_reqDone_0; // @[MEInterface.scala 192:38]
  assign reqQueues_0_io_reqDone_1 = bankSelectors_1_io_reqDone_0; // @[MEInterface.scala 192:38]
  assign reqQueues_0_io_outData_ready = 1'h1; // @[MEInterface.scala 198:19]
  assign reqQueues_1_clock = clock;
  assign reqQueues_1_reset = reset;
  assign reqQueues_1_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_1_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_1_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_1_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_1_io_inReq_valid = io_inReq_1_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_1_io_inReq_bits_write = 1'h1; // @[MEInterface.scala 197:17]
  assign reqQueues_1_io_inReq_bits_addr = io_inReq_1_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_1_io_inReq_bits_dataIn = io_inReq_1_bits_dataIn; // @[MEInterface.scala 197:17]
  assign reqQueues_1_io_reqDone_0 = bankSelectors_0_io_reqDone_1; // @[MEInterface.scala 192:38]
  assign reqQueues_1_io_reqDone_1 = bankSelectors_1_io_reqDone_1; // @[MEInterface.scala 192:38]
  assign reqQueues_1_io_outData_ready = 1'h1; // @[MEInterface.scala 198:19]
  assign reqQueues_2_clock = clock;
  assign reqQueues_2_reset = reset;
  assign reqQueues_2_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_2_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_2_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_2_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_2_io_inReq_valid = io_inReq_2_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_2_io_inReq_bits_write = 1'h1; // @[MEInterface.scala 197:17]
  assign reqQueues_2_io_inReq_bits_addr = io_inReq_2_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_2_io_inReq_bits_dataIn = io_inReq_2_bits_dataIn; // @[MEInterface.scala 197:17]
  assign reqQueues_2_io_reqDone_0 = bankSelectors_0_io_reqDone_2; // @[MEInterface.scala 192:38]
  assign reqQueues_2_io_reqDone_1 = bankSelectors_1_io_reqDone_2; // @[MEInterface.scala 192:38]
  assign reqQueues_2_io_outData_ready = 1'h1; // @[MEInterface.scala 198:19]
  assign reqQueues_3_clock = clock;
  assign reqQueues_3_reset = reset;
  assign reqQueues_3_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_3_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_3_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_3_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_3_io_inReq_valid = io_inReq_3_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_3_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_3_io_inReq_bits_addr = io_inReq_3_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_3_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_3_io_reqDone_0 = bankSelectors_0_io_reqDone_3; // @[MEInterface.scala 192:38]
  assign reqQueues_3_io_reqDone_1 = bankSelectors_1_io_reqDone_3; // @[MEInterface.scala 192:38]
  assign reqQueues_3_io_outData_ready = io_outData_3_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_4_clock = clock;
  assign reqQueues_4_reset = reset;
  assign reqQueues_4_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_4_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_4_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_4_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_4_io_inReq_valid = io_inReq_4_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_4_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_4_io_inReq_bits_addr = io_inReq_4_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_4_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_4_io_reqDone_0 = bankSelectors_0_io_reqDone_4; // @[MEInterface.scala 192:38]
  assign reqQueues_4_io_reqDone_1 = bankSelectors_1_io_reqDone_4; // @[MEInterface.scala 192:38]
  assign reqQueues_4_io_outData_ready = io_outData_4_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_5_clock = clock;
  assign reqQueues_5_reset = reset;
  assign reqQueues_5_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_5_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_5_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_5_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_5_io_inReq_valid = io_inReq_5_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_5_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_5_io_inReq_bits_addr = io_inReq_5_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_5_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_5_io_reqDone_0 = bankSelectors_0_io_reqDone_5; // @[MEInterface.scala 192:38]
  assign reqQueues_5_io_reqDone_1 = bankSelectors_1_io_reqDone_5; // @[MEInterface.scala 192:38]
  assign reqQueues_5_io_outData_ready = io_outData_5_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_6_clock = clock;
  assign reqQueues_6_reset = reset;
  assign reqQueues_6_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_6_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_6_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_6_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_6_io_inReq_valid = io_inReq_6_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_6_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_6_io_inReq_bits_addr = io_inReq_6_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_6_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_6_io_reqDone_0 = bankSelectors_0_io_reqDone_6; // @[MEInterface.scala 192:38]
  assign reqQueues_6_io_reqDone_1 = bankSelectors_1_io_reqDone_6; // @[MEInterface.scala 192:38]
  assign reqQueues_6_io_outData_ready = io_outData_6_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_7_clock = clock;
  assign reqQueues_7_reset = reset;
  assign reqQueues_7_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_7_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_7_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_7_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_7_io_inReq_valid = io_inReq_7_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_7_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_7_io_inReq_bits_addr = io_inReq_7_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_7_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_7_io_reqDone_0 = bankSelectors_0_io_reqDone_7; // @[MEInterface.scala 192:38]
  assign reqQueues_7_io_reqDone_1 = bankSelectors_1_io_reqDone_7; // @[MEInterface.scala 192:38]
  assign reqQueues_7_io_outData_ready = io_outData_7_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_8_clock = clock;
  assign reqQueues_8_reset = reset;
  assign reqQueues_8_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_8_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_8_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_8_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_8_io_inReq_valid = io_inReq_8_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_8_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_8_io_inReq_bits_addr = io_inReq_8_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_8_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_8_io_reqDone_0 = bankSelectors_0_io_reqDone_8; // @[MEInterface.scala 192:38]
  assign reqQueues_8_io_reqDone_1 = bankSelectors_1_io_reqDone_8; // @[MEInterface.scala 192:38]
  assign reqQueues_8_io_outData_ready = io_outData_8_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_9_clock = clock;
  assign reqQueues_9_reset = reset;
  assign reqQueues_9_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_9_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_9_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_9_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_9_io_inReq_valid = io_inReq_9_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_9_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_9_io_inReq_bits_addr = io_inReq_9_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_9_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_9_io_reqDone_0 = bankSelectors_0_io_reqDone_9; // @[MEInterface.scala 192:38]
  assign reqQueues_9_io_reqDone_1 = bankSelectors_1_io_reqDone_9; // @[MEInterface.scala 192:38]
  assign reqQueues_9_io_outData_ready = io_outData_9_ready; // @[MEInterface.scala 198:19]
  assign reqQueues_10_clock = clock;
  assign reqQueues_10_reset = reset;
  assign reqQueues_10_io_outSeq_0_dataOut = bankSelectors_0_io_inSeq_10_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_10_io_outSeq_1_dataOut = bankSelectors_1_io_inSeq_10_dataOut; // @[MEInterface.scala 191:36]
  assign reqQueues_10_io_inReq_valid = io_inReq_10_valid; // @[MEInterface.scala 197:17]
  assign reqQueues_10_io_inReq_bits_write = 1'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_10_io_inReq_bits_addr = io_inReq_10_bits_addr; // @[MEInterface.scala 197:17]
  assign reqQueues_10_io_inReq_bits_dataIn = 32'h0; // @[MEInterface.scala 197:17]
  assign reqQueues_10_io_reqDone_0 = bankSelectors_0_io_reqDone_10; // @[MEInterface.scala 192:38]
  assign reqQueues_10_io_reqDone_1 = bankSelectors_1_io_reqDone_10; // @[MEInterface.scala 192:38]
  assign reqQueues_10_io_outData_ready = io_outData_10_ready; // @[MEInterface.scala 198:19]
  assign bankSelectors_0_clock = clock;
  assign bankSelectors_0_io_portOut_1_dataOut = io_portOut_1_0_dataOut; // @[MEInterface.scala 187:35]
  assign bankSelectors_0_io_portOut_2_dataOut = io_portOut_2_0_dataOut; // @[MEInterface.scala 188:35]
  assign bankSelectors_0_io_inSeq_0_write = reqQueues_0_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_0_addr = reqQueues_0_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_0_dataIn = reqQueues_0_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_0_valid = reqQueues_0_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_1_write = reqQueues_1_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_1_addr = reqQueues_1_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_1_dataIn = reqQueues_1_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_1_valid = reqQueues_1_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_2_write = reqQueues_2_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_2_addr = reqQueues_2_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_2_dataIn = reqQueues_2_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_2_valid = reqQueues_2_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_3_write = reqQueues_3_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_3_addr = reqQueues_3_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_3_dataIn = reqQueues_3_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_3_valid = reqQueues_3_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_4_write = reqQueues_4_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_4_addr = reqQueues_4_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_4_dataIn = reqQueues_4_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_4_valid = reqQueues_4_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_5_write = reqQueues_5_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_5_addr = reqQueues_5_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_5_dataIn = reqQueues_5_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_5_valid = reqQueues_5_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_6_write = reqQueues_6_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_6_addr = reqQueues_6_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_6_dataIn = reqQueues_6_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_6_valid = reqQueues_6_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_7_write = reqQueues_7_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_7_addr = reqQueues_7_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_7_dataIn = reqQueues_7_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_7_valid = reqQueues_7_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_8_write = reqQueues_8_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_8_addr = reqQueues_8_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_8_dataIn = reqQueues_8_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_8_valid = reqQueues_8_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_9_write = reqQueues_9_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_9_addr = reqQueues_9_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_9_dataIn = reqQueues_9_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_9_valid = reqQueues_9_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_10_write = reqQueues_10_io_outSeq_0_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_10_addr = reqQueues_10_io_outSeq_0_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_10_dataIn = reqQueues_10_io_outSeq_0_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_0_io_inSeq_10_valid = reqQueues_10_io_outSeq_0_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_clock = clock;
  assign bankSelectors_1_io_portOut_1_dataOut = io_portOut_1_1_dataOut; // @[MEInterface.scala 187:35]
  assign bankSelectors_1_io_portOut_2_dataOut = io_portOut_2_1_dataOut; // @[MEInterface.scala 188:35]
  assign bankSelectors_1_io_inSeq_0_write = reqQueues_0_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_0_addr = reqQueues_0_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_0_dataIn = reqQueues_0_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_0_valid = reqQueues_0_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_1_write = reqQueues_1_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_1_addr = reqQueues_1_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_1_dataIn = reqQueues_1_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_1_valid = reqQueues_1_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_2_write = reqQueues_2_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_2_addr = reqQueues_2_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_2_dataIn = reqQueues_2_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_2_valid = reqQueues_2_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_3_write = reqQueues_3_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_3_addr = reqQueues_3_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_3_dataIn = reqQueues_3_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_3_valid = reqQueues_3_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_4_write = reqQueues_4_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_4_addr = reqQueues_4_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_4_dataIn = reqQueues_4_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_4_valid = reqQueues_4_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_5_write = reqQueues_5_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_5_addr = reqQueues_5_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_5_dataIn = reqQueues_5_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_5_valid = reqQueues_5_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_6_write = reqQueues_6_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_6_addr = reqQueues_6_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_6_dataIn = reqQueues_6_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_6_valid = reqQueues_6_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_7_write = reqQueues_7_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_7_addr = reqQueues_7_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_7_dataIn = reqQueues_7_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_7_valid = reqQueues_7_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_8_write = reqQueues_8_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_8_addr = reqQueues_8_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_8_dataIn = reqQueues_8_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_8_valid = reqQueues_8_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_9_write = reqQueues_9_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_9_addr = reqQueues_9_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_9_dataIn = reqQueues_9_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_9_valid = reqQueues_9_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_10_write = reqQueues_10_io_outSeq_1_write; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_10_addr = reqQueues_10_io_outSeq_1_addr; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_10_dataIn = reqQueues_10_io_outSeq_1_dataIn; // @[MEInterface.scala 191:36]
  assign bankSelectors_1_io_inSeq_10_valid = reqQueues_10_io_outSeq_1_valid; // @[MEInterface.scala 191:36]
endmodule
module Queue_11(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits,
  output [10:0] io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:1023]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [9:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [9:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [9:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [9:0] _value_T_1 = enq_ptr_value + 10'h1; // @[Counter.scala 77:24]
  wire [9:0] _value_T_3 = deq_ptr_value + 10'h1; // @[Counter.scala 77:24]
  wire [9:0] ptr_diff = enq_ptr_value - deq_ptr_value; // @[Decoupled.scala 328:32]
  wire [10:0] _io_count_T_1 = maybe_full & ptr_match ? 11'h400 : 11'h0; // @[Decoupled.scala 331:20]
  wire [10:0] _GEN_11 = {{1'd0}, ptr_diff}; // @[Decoupled.scala 331:62]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_count = _io_count_T_1 | _GEN_11; // @[Decoupled.scala 331:62]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 10'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 10'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SpMVAddressGenerator(
  input         clock,
  input         reset,
  input         mem_io_addressRequests_0_ready,
  output        mem_io_addressRequests_0_valid,
  output [14:0] mem_io_addressRequests_0_bits,
  input         mem_io_addressRequests_1_ready,
  output        mem_io_addressRequests_1_valid,
  output [14:0] mem_io_addressRequests_1_bits,
  input         mem_io_addressRequests_2_ready,
  output        mem_io_addressRequests_2_valid,
  output [14:0] mem_io_addressRequests_2_bits,
  input         mem_io_addressRequests_3_ready,
  output        mem_io_addressRequests_3_valid,
  output [14:0] mem_io_addressRequests_3_bits,
  output        mem_io_dataResponses_0_ready,
  input         mem_io_dataResponses_0_valid,
  input  [31:0] mem_io_dataResponses_0_bits,
  output        mem_io_dataResponses_1_ready,
  input         mem_io_dataResponses_1_valid,
  input  [31:0] mem_io_dataResponses_1_bits,
  output        mem_io_dataResponses_2_ready,
  input         mem_io_dataResponses_2_valid,
  input  [31:0] mem_io_dataResponses_2_bits,
  output        mem_io_dataResponses_3_ready,
  input         mem_io_dataResponses_3_valid,
  input  [31:0] mem_io_dataResponses_3_bits,
  input         mem_io_writeRequests_0_ready,
  output        mem_io_writeRequests_0_valid,
  output [14:0] mem_io_writeRequests_0_bits_address,
  output [31:0] mem_io_writeRequests_0_bits_data,
  output        mem_io_generatingRequests,
  input         ctrl_io_a_vals_ready,
  output        ctrl_io_a_vals_valid,
  output [31:0] ctrl_io_a_vals_bits,
  input         ctrl_io_x_vals_ready,
  output        ctrl_io_x_vals_valid,
  output [31:0] ctrl_io_x_vals_bits,
  output        ctrl_io_y_vals_ready,
  input         ctrl_io_y_vals_valid,
  input  [31:0] ctrl_io_y_vals_bits,
  input         ctrl_io_row_elem_left_ready,
  output        ctrl_io_row_elem_left_valid,
  output [31:0] ctrl_io_row_elem_left_bits,
  input  [14:0] pe_ctrl_io_in_A,
  input  [14:0] pe_ctrl_io_in_col_idx,
  input  [14:0] pe_ctrl_io_in_row_ptr,
  input  [14:0] pe_ctrl_io_in_y_addr,
  input  [14:0] pe_ctrl_io_in_nrows,
  input  [14:0] pe_ctrl_io_in_row_start,
  input  [14:0] pe_ctrl_io_in_xlen_pow2,
  input         pe_ctrl_io_reset_setup
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] base_A; // @[SpMVAddressGenerator.scala 76:21]
  reg [14:0] base_col_idx; // @[SpMVAddressGenerator.scala 77:27]
  reg [14:0] base_row_ptr; // @[SpMVAddressGenerator.scala 78:27]
  reg [14:0] base_y_ptr; // @[SpMVAddressGenerator.scala 80:25]
  reg [14:0] nrows; // @[SpMVAddressGenerator.scala 81:20]
  reg [14:0] log_xchunk; // @[SpMVAddressGenerator.scala 82:25]
  reg [14:0] xlen_pow2; // @[SpMVAddressGenerator.scala 83:24]
  reg [14:0] curr_a_nz; // @[SpMVAddressGenerator.scala 85:24]
  reg [14:0] curr_col_nz; // @[SpMVAddressGenerator.scala 86:26]
  reg [14:0] row_elem_left_a; // @[SpMVAddressGenerator.scala 87:30]
  reg [14:0] row_elem_left_col; // @[SpMVAddressGenerator.scala 88:32]
  reg [14:0] row_start; // @[SpMVAddressGenerator.scala 89:24]
  reg [14:0] curr_row; // @[SpMVAddressGenerator.scala 90:23]
  reg [14:0] curr_y; // @[SpMVAddressGenerator.scala 91:21]
  reg  request_3_enable; // @[SpMVAddressGenerator.scala 93:35]
  wire  not_last_row = curr_row != nrows; // @[SpMVAddressGenerator.scala 95:34]
  wire  update_row = row_elem_left_a == 15'h0 & row_elem_left_col == 15'h0; // @[SpMVAddressGenerator.scala 96:48]
  wire [3:0] _log_xchunk_T_15 = pe_ctrl_io_in_xlen_pow2[13] ? 4'hc : 4'hd; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_16 = pe_ctrl_io_in_xlen_pow2[12] ? 4'hb : _log_xchunk_T_15; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_17 = pe_ctrl_io_in_xlen_pow2[11] ? 4'ha : _log_xchunk_T_16; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_18 = pe_ctrl_io_in_xlen_pow2[10] ? 4'h9 : _log_xchunk_T_17; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_19 = pe_ctrl_io_in_xlen_pow2[9] ? 4'h8 : _log_xchunk_T_18; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_20 = pe_ctrl_io_in_xlen_pow2[8] ? 4'h7 : _log_xchunk_T_19; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_21 = pe_ctrl_io_in_xlen_pow2[7] ? 4'h6 : _log_xchunk_T_20; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_22 = pe_ctrl_io_in_xlen_pow2[6] ? 4'h5 : _log_xchunk_T_21; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_23 = pe_ctrl_io_in_xlen_pow2[5] ? 4'h4 : _log_xchunk_T_22; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_24 = pe_ctrl_io_in_xlen_pow2[4] ? 4'h3 : _log_xchunk_T_23; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_25 = pe_ctrl_io_in_xlen_pow2[3] ? 4'h2 : _log_xchunk_T_24; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_26 = pe_ctrl_io_in_xlen_pow2[2] ? 4'h1 : _log_xchunk_T_25; // @[Mux.scala 47:70]
  wire [3:0] _log_xchunk_T_27 = pe_ctrl_io_in_xlen_pow2[1] ? 4'h0 : _log_xchunk_T_26; // @[Mux.scala 47:70]
  wire [14:0] _GEN_16 = pe_ctrl_io_reset_setup ? 15'h0 : row_elem_left_col; // @[SpMVAddressGenerator.scala 129:34 145:27 88:32]
  wire [14:0] _GEN_17 = pe_ctrl_io_reset_setup ? 15'h0 : row_elem_left_a; // @[SpMVAddressGenerator.scala 129:34 146:25 87:30]
  wire [14:0] _GEN_18 = pe_ctrl_io_reset_setup ? pe_ctrl_io_in_row_start : row_start; // @[SpMVAddressGenerator.scala 129:34 148:19 89:24]
  wire  _GEN_21 = pe_ctrl_io_reset_setup | request_3_enable; // @[SpMVAddressGenerator.scala 129:34 152:26 93:35]
  wire [31:0] _x_bank_mask_T = mem_io_dataResponses_2_bits >> log_xchunk; // @[SpMVAddressGenerator.scala 164:31]
  wire [45:0] _x_bank_mask_T_1 = {_x_bank_mask_T, 14'h0}; // @[SpMVAddressGenerator.scala 164:46]
  wire [16:0] x_bank_mask = _x_bank_mask_T_1[16:0]; // @[SpMVAddressGenerator.scala 164:60]
  wire [14:0] _x_offset_T_1 = xlen_pow2 - 15'h1; // @[SpMVAddressGenerator.scala 167:46]
  wire [31:0] _GEN_46 = {{17'd0}, _x_offset_T_1}; // @[SpMVAddressGenerator.scala 167:31]
  wire [31:0] _x_offset_T_2 = mem_io_dataResponses_2_bits & _GEN_46; // @[SpMVAddressGenerator.scala 167:31]
  wire [16:0] x_offset = _x_offset_T_2[16:0]; // @[SpMVAddressGenerator.scala 167:53]
  wire [16:0] _mem_io_addressRequests_0_bits_T_2 = x_offset | x_bank_mask; // @[SpMVAddressGenerator.scala 168:91]
  wire  _T_7 = update_row & not_last_row; // @[SpMVAddressGenerator.scala 181:21]
  wire [14:0] _mem_io_addressRequests_3_bits_T_1 = base_row_ptr + curr_row; // @[SpMVAddressGenerator.scala 191:56]
  wire  _GEN_29 = mem_io_addressRequests_3_ready & mem_io_addressRequests_3_valid ? 1'h0 : _GEN_21; // @[SpMVAddressGenerator.scala 198:78 199:26]
  wire  _T_12 = mem_io_dataResponses_3_ready & mem_io_dataResponses_3_valid; // @[SpMVAddressGenerator.scala 202:40]
  wire [31:0] _GEN_47 = {{17'd0}, row_start}; // @[SpMVAddressGenerator.scala 204:68]
  wire [16:0] next_row_val = mem_io_dataResponses_3_bits[16:0]; // @[SpMVAddressGenerator.scala 212:56]
  wire [14:0] _curr_row_T_1 = curr_row + 15'h1; // @[SpMVAddressGenerator.scala 213:30]
  wire [16:0] _GEN_48 = {{2'd0}, row_start}; // @[SpMVAddressGenerator.scala 214:41]
  wire [16:0] _row_elem_left_a_T_1 = next_row_val - _GEN_48; // @[SpMVAddressGenerator.scala 214:41]
  wire [16:0] _GEN_33 = _T_12 ? _row_elem_left_a_T_1 : {{2'd0}, _GEN_17}; // @[SpMVAddressGenerator.scala 211:74 214:25]
  wire [16:0] _GEN_34 = _T_12 ? _row_elem_left_a_T_1 : {{2'd0}, _GEN_16}; // @[SpMVAddressGenerator.scala 211:74 215:27]
  wire [16:0] _GEN_35 = _T_12 ? next_row_val : {{2'd0}, _GEN_18}; // @[SpMVAddressGenerator.scala 211:74 216:19]
  wire  _GEN_36 = _T_12 | _GEN_29; // @[SpMVAddressGenerator.scala 211:74 217:26]
  wire  _T_14 = row_elem_left_a > 15'h0; // @[SpMVAddressGenerator.scala 220:26]
  wire  _T_16 = mem_io_addressRequests_1_ready & mem_io_addressRequests_1_valid; // @[SpMVAddressGenerator.scala 230:42]
  wire [14:0] _curr_a_nz_T_1 = curr_a_nz + 15'h1; // @[SpMVAddressGenerator.scala 231:32]
  wire [14:0] _row_elem_left_a_T_3 = row_elem_left_a - 15'h1; // @[SpMVAddressGenerator.scala 236:44]
  wire [16:0] _GEN_40 = _T_16 & _T_14 ? {{2'd0}, _row_elem_left_a_T_3} : _GEN_33; // @[SpMVAddressGenerator.scala 235:103 236:25]
  wire  _T_20 = row_elem_left_col > 15'h0; // @[SpMVAddressGenerator.scala 239:28]
  wire  _T_22 = mem_io_addressRequests_2_ready & mem_io_addressRequests_2_valid; // @[SpMVAddressGenerator.scala 249:42]
  wire [14:0] _curr_col_nz_T_1 = curr_col_nz + 15'h1; // @[SpMVAddressGenerator.scala 250:36]
  wire [14:0] _row_elem_left_col_T_3 = row_elem_left_col - 15'h1; // @[SpMVAddressGenerator.scala 255:48]
  wire [16:0] _GEN_44 = _T_22 & _T_20 ? {{2'd0}, _row_elem_left_col_T_3} : _GEN_34; // @[SpMVAddressGenerator.scala 254:105 255:27]
  wire [14:0] _curr_y_T_1 = curr_y + 15'h1; // @[SpMVAddressGenerator.scala 260:26]
  assign mem_io_addressRequests_0_valid = mem_io_dataResponses_2_valid & mem_io_dataResponses_2_ready &
    mem_io_addressRequests_0_ready; // @[SpMVAddressGenerator.scala 165:73]
  assign mem_io_addressRequests_0_bits = _mem_io_addressRequests_0_bits_T_2[14:0];
  assign mem_io_addressRequests_1_valid = row_elem_left_a > 15'h0 & mem_io_addressRequests_1_ready; // @[SpMVAddressGenerator.scala 220:32]
  assign mem_io_addressRequests_1_bits = base_A + curr_a_nz; // @[SpMVAddressGenerator.scala 222:50]
  assign mem_io_addressRequests_2_valid = row_elem_left_col > 15'h0 & mem_io_addressRequests_2_ready; // @[SpMVAddressGenerator.scala 239:34]
  assign mem_io_addressRequests_2_bits = base_col_idx + curr_col_nz; // @[SpMVAddressGenerator.scala 241:56]
  assign mem_io_addressRequests_3_valid = _T_7 & request_3_enable & ctrl_io_row_elem_left_ready; // @[SpMVAddressGenerator.scala 188:57]
  assign mem_io_addressRequests_3_bits = _mem_io_addressRequests_3_bits_T_1 + 15'h1; // @[SpMVAddressGenerator.scala 191:67]
  assign mem_io_dataResponses_0_ready = mem_io_dataResponses_0_valid & mem_io_dataResponses_1_valid &
    ctrl_io_a_vals_ready & ctrl_io_x_vals_ready; // @[SpMVAddressGenerator.scala 98:97]
  assign mem_io_dataResponses_1_ready = mem_io_dataResponses_0_valid & mem_io_dataResponses_1_valid &
    ctrl_io_a_vals_ready & ctrl_io_x_vals_ready; // @[SpMVAddressGenerator.scala 98:97]
  assign mem_io_dataResponses_2_ready = mem_io_addressRequests_0_ready; // @[SpMVAddressGenerator.scala 175:78 176:39 178:39]
  assign mem_io_dataResponses_3_ready = update_row & not_last_row; // @[SpMVAddressGenerator.scala 181:21]
  assign mem_io_writeRequests_0_valid = mem_io_writeRequests_0_ready & ctrl_io_y_vals_valid; // @[SpMVAddressGenerator.scala 115:40]
  assign mem_io_writeRequests_0_bits_address = base_y_ptr + curr_y; // @[SpMVAddressGenerator.scala 119:60]
  assign mem_io_writeRequests_0_bits_data = ctrl_io_y_vals_bits; // @[SpMVAddressGenerator.scala 115:65 118:43]
  assign mem_io_generatingRequests = curr_y != nrows; // @[SpMVAddressGenerator.scala 154:17]
  assign ctrl_io_a_vals_valid = mem_io_dataResponses_0_valid & mem_io_dataResponses_1_valid & ctrl_io_a_vals_ready &
    ctrl_io_x_vals_ready; // @[SpMVAddressGenerator.scala 98:97]
  assign ctrl_io_a_vals_bits = mem_io_dataResponses_0_bits; // @[SpMVAddressGenerator.scala 98:122 102:29]
  assign ctrl_io_x_vals_valid = mem_io_dataResponses_0_valid & mem_io_dataResponses_1_valid & ctrl_io_a_vals_ready &
    ctrl_io_x_vals_ready; // @[SpMVAddressGenerator.scala 98:97]
  assign ctrl_io_x_vals_bits = mem_io_dataResponses_1_bits; // @[SpMVAddressGenerator.scala 98:122 104:29]
  assign ctrl_io_y_vals_ready = mem_io_writeRequests_0_ready & ctrl_io_y_vals_valid; // @[SpMVAddressGenerator.scala 115:40]
  assign ctrl_io_row_elem_left_valid = mem_io_dataResponses_3_ready & mem_io_dataResponses_3_valid; // @[SpMVAddressGenerator.scala 202:40]
  assign ctrl_io_row_elem_left_bits = mem_io_dataResponses_3_bits - _GEN_47; // @[SpMVAddressGenerator.scala 204:68]
  always @(posedge clock) begin
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      base_A <= pe_ctrl_io_in_A; // @[SpMVAddressGenerator.scala 131:16]
    end
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      base_col_idx <= pe_ctrl_io_in_col_idx; // @[SpMVAddressGenerator.scala 132:22]
    end
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      base_row_ptr <= pe_ctrl_io_in_row_ptr; // @[SpMVAddressGenerator.scala 133:22]
    end
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      base_y_ptr <= pe_ctrl_io_in_y_addr; // @[SpMVAddressGenerator.scala 135:20]
    end
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      nrows <= pe_ctrl_io_in_nrows; // @[SpMVAddressGenerator.scala 140:15]
    end
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      log_xchunk <= {{11'd0}, _log_xchunk_T_27}; // @[SpMVAddressGenerator.scala 137:20]
    end
    if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      xlen_pow2 <= {{1'd0}, pe_ctrl_io_in_xlen_pow2[14:1]}; // @[SpMVAddressGenerator.scala 138:19]
    end
    if (mem_io_addressRequests_1_ready & mem_io_addressRequests_1_valid) begin // @[SpMVAddressGenerator.scala 230:78]
      curr_a_nz <= _curr_a_nz_T_1; // @[SpMVAddressGenerator.scala 231:19]
    end else if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      curr_a_nz <= 15'h0; // @[SpMVAddressGenerator.scala 142:19]
    end
    if (mem_io_addressRequests_2_ready & mem_io_addressRequests_2_valid) begin // @[SpMVAddressGenerator.scala 249:78]
      curr_col_nz <= _curr_col_nz_T_1; // @[SpMVAddressGenerator.scala 250:21]
    end else if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      curr_col_nz <= 15'h0; // @[SpMVAddressGenerator.scala 143:21]
    end
    row_elem_left_a <= _GEN_40[14:0];
    row_elem_left_col <= _GEN_44[14:0];
    row_start <= _GEN_35[14:0];
    if (_T_12) begin // @[SpMVAddressGenerator.scala 211:74]
      curr_row <= _curr_row_T_1; // @[SpMVAddressGenerator.scala 213:18]
    end else if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      curr_row <= 15'h0; // @[SpMVAddressGenerator.scala 150:18]
    end
    if (mem_io_writeRequests_0_ready & mem_io_writeRequests_0_valid) begin // @[SpMVAddressGenerator.scala 259:74]
      curr_y <= _curr_y_T_1; // @[SpMVAddressGenerator.scala 260:16]
    end else if (pe_ctrl_io_reset_setup) begin // @[SpMVAddressGenerator.scala 129:34]
      curr_y <= 15'h0; // @[SpMVAddressGenerator.scala 151:16]
    end
    request_3_enable <= reset | _GEN_36; // @[SpMVAddressGenerator.scala 93:{35,35}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  base_A = _RAND_0[14:0];
  _RAND_1 = {1{`RANDOM}};
  base_col_idx = _RAND_1[14:0];
  _RAND_2 = {1{`RANDOM}};
  base_row_ptr = _RAND_2[14:0];
  _RAND_3 = {1{`RANDOM}};
  base_y_ptr = _RAND_3[14:0];
  _RAND_4 = {1{`RANDOM}};
  nrows = _RAND_4[14:0];
  _RAND_5 = {1{`RANDOM}};
  log_xchunk = _RAND_5[14:0];
  _RAND_6 = {1{`RANDOM}};
  xlen_pow2 = _RAND_6[14:0];
  _RAND_7 = {1{`RANDOM}};
  curr_a_nz = _RAND_7[14:0];
  _RAND_8 = {1{`RANDOM}};
  curr_col_nz = _RAND_8[14:0];
  _RAND_9 = {1{`RANDOM}};
  row_elem_left_a = _RAND_9[14:0];
  _RAND_10 = {1{`RANDOM}};
  row_elem_left_col = _RAND_10[14:0];
  _RAND_11 = {1{`RANDOM}};
  row_start = _RAND_11[14:0];
  _RAND_12 = {1{`RANDOM}};
  curr_row = _RAND_12[14:0];
  _RAND_13 = {1{`RANDOM}};
  curr_y = _RAND_13[14:0];
  _RAND_14 = {1{`RANDOM}};
  request_3_enable = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RecFNToRecFN(
  input  [32:0] io_in,
  output [32:0] io_out
);
  assign io_out = io_in; // @[RecFNToRecFN.scala 64:35]
endmodule
module MulAddRecFNToRaw_preMul(
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [32:0] io_c,
  output [23:0] io_mulAddA,
  output [23:0] io_mulAddB,
  output [47:0] io_mulAddC,
  output        io_toPostMul_isSigNaNAny,
  output        io_toPostMul_isNaNAOrB,
  output        io_toPostMul_isInfA,
  output        io_toPostMul_isZeroA,
  output        io_toPostMul_isInfB,
  output        io_toPostMul_isZeroB,
  output        io_toPostMul_signProd,
  output        io_toPostMul_isNaNC,
  output        io_toPostMul_isInfC,
  output        io_toPostMul_isZeroC,
  output [9:0]  io_toPostMul_sExpSum,
  output        io_toPostMul_doSubMags,
  output        io_toPostMul_CIsDominant,
  output [4:0]  io_toPostMul_CDom_CAlignDist,
  output [25:0] io_toPostMul_highAlignedSigC,
  output        io_toPostMul_bit0AlignedSigC
);
  wire [8:0] rawA_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 51:21]
  wire  rawA_isZero = rawA_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  rawA_isSpecial = rawA_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  rawA__isNaN = rawA_isSpecial & rawA_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawA__sign = io_a[32]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] rawA__sExp = {1'b0,$signed(rawA_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _rawA_out_sig_T = ~rawA_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [24:0] rawA__sig = {1'h0,_rawA_out_sig_T,io_a[22:0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire [8:0] rawB_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 51:21]
  wire  rawB_isZero = rawB_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  rawB_isSpecial = rawB_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  rawB__isNaN = rawB_isSpecial & rawB_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawB__sign = io_b[32]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] rawB__sExp = {1'b0,$signed(rawB_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _rawB_out_sig_T = ~rawB_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [24:0] rawB__sig = {1'h0,_rawB_out_sig_T,io_b[22:0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire [8:0] rawC_exp = io_c[31:23]; // @[rawFloatFromRecFN.scala 51:21]
  wire  rawC_isZero = rawC_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  rawC_isSpecial = rawC_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  rawC__isNaN = rawC_isSpecial & rawC_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawC__sign = io_c[32]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] rawC__sExp = {1'b0,$signed(rawC_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _rawC_out_sig_T = ~rawC_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [24:0] rawC__sig = {1'h0,_rawC_out_sig_T,io_c[22:0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire  signProd = rawA__sign ^ rawB__sign; // @[MulAddRecFN.scala 96:30]
  wire [10:0] _sExpAlignedProd_T = $signed(rawA__sExp) + $signed(rawB__sExp); // @[MulAddRecFN.scala 99:19]
  wire [10:0] sExpAlignedProd = $signed(_sExpAlignedProd_T) - 11'she5; // @[MulAddRecFN.scala 99:32]
  wire  doSubMags = signProd ^ rawC__sign; // @[MulAddRecFN.scala 101:30]
  wire [10:0] _GEN_0 = {{1{rawC__sExp[9]}},rawC__sExp}; // @[MulAddRecFN.scala 105:42]
  wire [10:0] sNatCAlignDist = $signed(sExpAlignedProd) - $signed(_GEN_0); // @[MulAddRecFN.scala 105:42]
  wire [9:0] posNatCAlignDist = sNatCAlignDist[9:0]; // @[MulAddRecFN.scala 106:42]
  wire  isMinCAlign = rawA_isZero | rawB_isZero | $signed(sNatCAlignDist) < 11'sh0; // @[MulAddRecFN.scala 107:50]
  wire  CIsDominant = _rawC_out_sig_T & (isMinCAlign | posNatCAlignDist <= 10'h18); // @[MulAddRecFN.scala 109:23]
  wire [6:0] _CAlignDist_T_2 = posNatCAlignDist < 10'h4a ? posNatCAlignDist[6:0] : 7'h4a; // @[MulAddRecFN.scala 113:16]
  wire [6:0] CAlignDist = isMinCAlign ? 7'h0 : _CAlignDist_T_2; // @[MulAddRecFN.scala 111:12]
  wire [24:0] _mainAlignedSigC_T = ~rawC__sig; // @[MulAddRecFN.scala 119:25]
  wire [24:0] _mainAlignedSigC_T_1 = doSubMags ? _mainAlignedSigC_T : rawC__sig; // @[MulAddRecFN.scala 119:13]
  wire [52:0] _mainAlignedSigC_T_3 = doSubMags ? 53'h1fffffffffffff : 53'h0; // @[Bitwise.scala 77:12]
  wire [77:0] _mainAlignedSigC_T_5 = {_mainAlignedSigC_T_1,_mainAlignedSigC_T_3}; // @[MulAddRecFN.scala 119:94]
  wire [77:0] mainAlignedSigC = $signed(_mainAlignedSigC_T_5) >>> CAlignDist; // @[MulAddRecFN.scala 119:100]
  wire [26:0] _reduced4CExtra_T = {rawC__sig, 2'h0}; // @[MulAddRecFN.scala 121:30]
  wire  reduced4CExtra_reducedVec_0 = |_reduced4CExtra_T[3:0]; // @[primitives.scala 120:54]
  wire  reduced4CExtra_reducedVec_1 = |_reduced4CExtra_T[7:4]; // @[primitives.scala 120:54]
  wire  reduced4CExtra_reducedVec_2 = |_reduced4CExtra_T[11:8]; // @[primitives.scala 120:54]
  wire  reduced4CExtra_reducedVec_3 = |_reduced4CExtra_T[15:12]; // @[primitives.scala 120:54]
  wire  reduced4CExtra_reducedVec_4 = |_reduced4CExtra_T[19:16]; // @[primitives.scala 120:54]
  wire  reduced4CExtra_reducedVec_5 = |_reduced4CExtra_T[23:20]; // @[primitives.scala 120:54]
  wire  reduced4CExtra_reducedVec_6 = |_reduced4CExtra_T[26:24]; // @[primitives.scala 123:57]
  wire [6:0] _reduced4CExtra_T_1 = {reduced4CExtra_reducedVec_6,reduced4CExtra_reducedVec_5,reduced4CExtra_reducedVec_4,
    reduced4CExtra_reducedVec_3,reduced4CExtra_reducedVec_2,reduced4CExtra_reducedVec_1,reduced4CExtra_reducedVec_0}; // @[primitives.scala 124:20]
  wire [32:0] reduced4CExtra_shift = 33'sh100000000 >>> CAlignDist[6:2]; // @[primitives.scala 76:56]
  wire [5:0] _reduced4CExtra_T_18 = {reduced4CExtra_shift[14],reduced4CExtra_shift[15],reduced4CExtra_shift[16],
    reduced4CExtra_shift[17],reduced4CExtra_shift[18],reduced4CExtra_shift[19]}; // @[Cat.scala 33:92]
  wire [6:0] _GEN_1 = {{1'd0}, _reduced4CExtra_T_18}; // @[MulAddRecFN.scala 121:68]
  wire [6:0] _reduced4CExtra_T_19 = _reduced4CExtra_T_1 & _GEN_1; // @[MulAddRecFN.scala 121:68]
  wire  reduced4CExtra = |_reduced4CExtra_T_19; // @[MulAddRecFN.scala 129:11]
  wire  _alignedSigC_T_4 = &mainAlignedSigC[2:0] & ~reduced4CExtra; // @[MulAddRecFN.scala 133:44]
  wire  _alignedSigC_T_7 = |mainAlignedSigC[2:0] | reduced4CExtra; // @[MulAddRecFN.scala 134:44]
  wire  _alignedSigC_T_8 = doSubMags ? _alignedSigC_T_4 : _alignedSigC_T_7; // @[MulAddRecFN.scala 132:16]
  wire [74:0] alignedSigC_hi = mainAlignedSigC[77:3]; // @[Cat.scala 33:92]
  wire [75:0] alignedSigC = {alignedSigC_hi,_alignedSigC_T_8}; // @[Cat.scala 33:92]
  wire  _io_toPostMul_isSigNaNAny_T_2 = rawA__isNaN & ~rawA__sig[22]; // @[common.scala 82:46]
  wire  _io_toPostMul_isSigNaNAny_T_5 = rawB__isNaN & ~rawB__sig[22]; // @[common.scala 82:46]
  wire  _io_toPostMul_isSigNaNAny_T_9 = rawC__isNaN & ~rawC__sig[22]; // @[common.scala 82:46]
  wire [10:0] _io_toPostMul_sExpSum_T_2 = $signed(sExpAlignedProd) - 11'sh18; // @[MulAddRecFN.scala 157:53]
  wire [10:0] _io_toPostMul_sExpSum_T_3 = CIsDominant ? $signed({{1{rawC__sExp[9]}},rawC__sExp}) : $signed(
    _io_toPostMul_sExpSum_T_2); // @[MulAddRecFN.scala 157:12]
  assign io_mulAddA = rawA__sig[23:0]; // @[MulAddRecFN.scala 140:16]
  assign io_mulAddB = rawB__sig[23:0]; // @[MulAddRecFN.scala 141:16]
  assign io_mulAddC = alignedSigC[48:1]; // @[MulAddRecFN.scala 142:30]
  assign io_toPostMul_isSigNaNAny = _io_toPostMul_isSigNaNAny_T_2 | _io_toPostMul_isSigNaNAny_T_5 |
    _io_toPostMul_isSigNaNAny_T_9; // @[MulAddRecFN.scala 145:58]
  assign io_toPostMul_isNaNAOrB = rawA__isNaN | rawB__isNaN; // @[MulAddRecFN.scala 147:42]
  assign io_toPostMul_isInfA = rawA_isSpecial & ~rawA_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  assign io_toPostMul_isZeroA = rawA_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  assign io_toPostMul_isInfB = rawB_isSpecial & ~rawB_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  assign io_toPostMul_isZeroB = rawB_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  assign io_toPostMul_signProd = rawA__sign ^ rawB__sign; // @[MulAddRecFN.scala 96:30]
  assign io_toPostMul_isNaNC = rawC_isSpecial & rawC_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign io_toPostMul_isInfC = rawC_isSpecial & ~rawC_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  assign io_toPostMul_isZeroC = rawC_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  assign io_toPostMul_sExpSum = _io_toPostMul_sExpSum_T_3[9:0]; // @[MulAddRecFN.scala 156:28]
  assign io_toPostMul_doSubMags = signProd ^ rawC__sign; // @[MulAddRecFN.scala 101:30]
  assign io_toPostMul_CIsDominant = _rawC_out_sig_T & (isMinCAlign | posNatCAlignDist <= 10'h18); // @[MulAddRecFN.scala 109:23]
  assign io_toPostMul_CDom_CAlignDist = CAlignDist[4:0]; // @[MulAddRecFN.scala 160:47]
  assign io_toPostMul_highAlignedSigC = alignedSigC[74:49]; // @[MulAddRecFN.scala 162:20]
  assign io_toPostMul_bit0AlignedSigC = alignedSigC[0]; // @[MulAddRecFN.scala 163:48]
endmodule
module MulAddRecFNToRaw_postMul(
  input         io_fromPreMul_isSigNaNAny,
  input         io_fromPreMul_isNaNAOrB,
  input         io_fromPreMul_isInfA,
  input         io_fromPreMul_isZeroA,
  input         io_fromPreMul_isInfB,
  input         io_fromPreMul_isZeroB,
  input         io_fromPreMul_signProd,
  input         io_fromPreMul_isNaNC,
  input         io_fromPreMul_isInfC,
  input         io_fromPreMul_isZeroC,
  input  [9:0]  io_fromPreMul_sExpSum,
  input         io_fromPreMul_doSubMags,
  input         io_fromPreMul_CIsDominant,
  input  [4:0]  io_fromPreMul_CDom_CAlignDist,
  input  [25:0] io_fromPreMul_highAlignedSigC,
  input         io_fromPreMul_bit0AlignedSigC,
  input  [48:0] io_mulAddResult,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  CDom_sign = io_fromPreMul_signProd ^ io_fromPreMul_doSubMags; // @[MulAddRecFN.scala 188:42]
  wire [25:0] _sigSum_T_2 = io_fromPreMul_highAlignedSigC + 26'h1; // @[MulAddRecFN.scala 191:47]
  wire [25:0] _sigSum_T_3 = io_mulAddResult[48] ? _sigSum_T_2 : io_fromPreMul_highAlignedSigC; // @[MulAddRecFN.scala 190:16]
  wire [74:0] sigSum = {_sigSum_T_3,io_mulAddResult[47:0],io_fromPreMul_bit0AlignedSigC}; // @[Cat.scala 33:92]
  wire [1:0] _CDom_sExp_T = {1'b0,$signed(io_fromPreMul_doSubMags)}; // @[MulAddRecFN.scala 201:69]
  wire [9:0] _GEN_0 = {{8{_CDom_sExp_T[1]}},_CDom_sExp_T}; // @[MulAddRecFN.scala 201:43]
  wire [9:0] CDom_sExp = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_0); // @[MulAddRecFN.scala 201:43]
  wire [49:0] _CDom_absSigSum_T_1 = ~sigSum[74:25]; // @[MulAddRecFN.scala 204:13]
  wire [49:0] _CDom_absSigSum_T_5 = {1'h0,io_fromPreMul_highAlignedSigC[25:24],sigSum[72:26]}; // @[MulAddRecFN.scala 207:71]
  wire [49:0] CDom_absSigSum = io_fromPreMul_doSubMags ? _CDom_absSigSum_T_1 : _CDom_absSigSum_T_5; // @[MulAddRecFN.scala 203:12]
  wire [23:0] _CDom_absSigSumExtra_T_1 = ~sigSum[24:1]; // @[MulAddRecFN.scala 213:14]
  wire  _CDom_absSigSumExtra_T_2 = |_CDom_absSigSumExtra_T_1; // @[MulAddRecFN.scala 213:36]
  wire  _CDom_absSigSumExtra_T_4 = |sigSum[25:1]; // @[MulAddRecFN.scala 214:37]
  wire  CDom_absSigSumExtra = io_fromPreMul_doSubMags ? _CDom_absSigSumExtra_T_2 : _CDom_absSigSumExtra_T_4; // @[MulAddRecFN.scala 212:12]
  wire [80:0] _GEN_5 = {{31'd0}, CDom_absSigSum}; // @[MulAddRecFN.scala 217:24]
  wire [80:0] _CDom_mainSig_T = _GEN_5 << io_fromPreMul_CDom_CAlignDist; // @[MulAddRecFN.scala 217:24]
  wire [28:0] CDom_mainSig = _CDom_mainSig_T[49:21]; // @[MulAddRecFN.scala 217:56]
  wire [26:0] _CDom_reduced4SigExtra_T_1 = {CDom_absSigSum[23:0], 3'h0}; // @[MulAddRecFN.scala 220:53]
  wire  CDom_reduced4SigExtra_reducedVec_0 = |_CDom_reduced4SigExtra_T_1[3:0]; // @[primitives.scala 120:54]
  wire  CDom_reduced4SigExtra_reducedVec_1 = |_CDom_reduced4SigExtra_T_1[7:4]; // @[primitives.scala 120:54]
  wire  CDom_reduced4SigExtra_reducedVec_2 = |_CDom_reduced4SigExtra_T_1[11:8]; // @[primitives.scala 120:54]
  wire  CDom_reduced4SigExtra_reducedVec_3 = |_CDom_reduced4SigExtra_T_1[15:12]; // @[primitives.scala 120:54]
  wire  CDom_reduced4SigExtra_reducedVec_4 = |_CDom_reduced4SigExtra_T_1[19:16]; // @[primitives.scala 120:54]
  wire  CDom_reduced4SigExtra_reducedVec_5 = |_CDom_reduced4SigExtra_T_1[23:20]; // @[primitives.scala 120:54]
  wire  CDom_reduced4SigExtra_reducedVec_6 = |_CDom_reduced4SigExtra_T_1[26:24]; // @[primitives.scala 123:57]
  wire [6:0] _CDom_reduced4SigExtra_T_2 = {CDom_reduced4SigExtra_reducedVec_6,CDom_reduced4SigExtra_reducedVec_5,
    CDom_reduced4SigExtra_reducedVec_4,CDom_reduced4SigExtra_reducedVec_3,CDom_reduced4SigExtra_reducedVec_2,
    CDom_reduced4SigExtra_reducedVec_1,CDom_reduced4SigExtra_reducedVec_0}; // @[primitives.scala 124:20]
  wire [2:0] _CDom_reduced4SigExtra_T_4 = ~io_fromPreMul_CDom_CAlignDist[4:2]; // @[primitives.scala 52:21]
  wire [8:0] CDom_reduced4SigExtra_shift = 9'sh100 >>> _CDom_reduced4SigExtra_T_4; // @[primitives.scala 76:56]
  wire [5:0] _CDom_reduced4SigExtra_T_20 = {CDom_reduced4SigExtra_shift[1],CDom_reduced4SigExtra_shift[2],
    CDom_reduced4SigExtra_shift[3],CDom_reduced4SigExtra_shift[4],CDom_reduced4SigExtra_shift[5],
    CDom_reduced4SigExtra_shift[6]}; // @[Cat.scala 33:92]
  wire [6:0] _GEN_1 = {{1'd0}, _CDom_reduced4SigExtra_T_20}; // @[MulAddRecFN.scala 220:72]
  wire [6:0] _CDom_reduced4SigExtra_T_21 = _CDom_reduced4SigExtra_T_2 & _GEN_1; // @[MulAddRecFN.scala 220:72]
  wire  CDom_reduced4SigExtra = |_CDom_reduced4SigExtra_T_21; // @[MulAddRecFN.scala 221:73]
  wire  _CDom_sig_T_4 = |CDom_mainSig[2:0] | CDom_reduced4SigExtra | CDom_absSigSumExtra; // @[MulAddRecFN.scala 224:61]
  wire [26:0] CDom_sig = {CDom_mainSig[28:3],_CDom_sig_T_4}; // @[Cat.scala 33:92]
  wire  notCDom_signSigSum = sigSum[51]; // @[MulAddRecFN.scala 230:36]
  wire [50:0] _notCDom_absSigSum_T_1 = ~sigSum[50:0]; // @[MulAddRecFN.scala 233:13]
  wire [50:0] _GEN_2 = {{50'd0}, io_fromPreMul_doSubMags}; // @[MulAddRecFN.scala 234:41]
  wire [50:0] _notCDom_absSigSum_T_4 = sigSum[50:0] + _GEN_2; // @[MulAddRecFN.scala 234:41]
  wire [50:0] notCDom_absSigSum = notCDom_signSigSum ? _notCDom_absSigSum_T_1 : _notCDom_absSigSum_T_4; // @[MulAddRecFN.scala 232:12]
  wire  notCDom_reduced2AbsSigSum_reducedVec_0 = |notCDom_absSigSum[1:0]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_1 = |notCDom_absSigSum[3:2]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_2 = |notCDom_absSigSum[5:4]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_3 = |notCDom_absSigSum[7:6]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_4 = |notCDom_absSigSum[9:8]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_5 = |notCDom_absSigSum[11:10]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_6 = |notCDom_absSigSum[13:12]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_7 = |notCDom_absSigSum[15:14]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_8 = |notCDom_absSigSum[17:16]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_9 = |notCDom_absSigSum[19:18]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_10 = |notCDom_absSigSum[21:20]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_11 = |notCDom_absSigSum[23:22]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_12 = |notCDom_absSigSum[25:24]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_13 = |notCDom_absSigSum[27:26]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_14 = |notCDom_absSigSum[29:28]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_15 = |notCDom_absSigSum[31:30]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_16 = |notCDom_absSigSum[33:32]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_17 = |notCDom_absSigSum[35:34]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_18 = |notCDom_absSigSum[37:36]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_19 = |notCDom_absSigSum[39:38]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_20 = |notCDom_absSigSum[41:40]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_21 = |notCDom_absSigSum[43:42]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_22 = |notCDom_absSigSum[45:44]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_23 = |notCDom_absSigSum[47:46]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_24 = |notCDom_absSigSum[49:48]; // @[primitives.scala 103:54]
  wire  notCDom_reduced2AbsSigSum_reducedVec_25 = |notCDom_absSigSum[50]; // @[primitives.scala 106:57]
  wire [5:0] notCDom_reduced2AbsSigSum_lo_lo = {notCDom_reduced2AbsSigSum_reducedVec_5,
    notCDom_reduced2AbsSigSum_reducedVec_4,notCDom_reduced2AbsSigSum_reducedVec_3,notCDom_reduced2AbsSigSum_reducedVec_2
    ,notCDom_reduced2AbsSigSum_reducedVec_1,notCDom_reduced2AbsSigSum_reducedVec_0}; // @[primitives.scala 107:20]
  wire [12:0] notCDom_reduced2AbsSigSum_lo = {notCDom_reduced2AbsSigSum_reducedVec_12,
    notCDom_reduced2AbsSigSum_reducedVec_11,notCDom_reduced2AbsSigSum_reducedVec_10,
    notCDom_reduced2AbsSigSum_reducedVec_9,notCDom_reduced2AbsSigSum_reducedVec_8,notCDom_reduced2AbsSigSum_reducedVec_7
    ,notCDom_reduced2AbsSigSum_reducedVec_6,notCDom_reduced2AbsSigSum_lo_lo}; // @[primitives.scala 107:20]
  wire [5:0] notCDom_reduced2AbsSigSum_hi_lo = {notCDom_reduced2AbsSigSum_reducedVec_18,
    notCDom_reduced2AbsSigSum_reducedVec_17,notCDom_reduced2AbsSigSum_reducedVec_16,
    notCDom_reduced2AbsSigSum_reducedVec_15,notCDom_reduced2AbsSigSum_reducedVec_14,
    notCDom_reduced2AbsSigSum_reducedVec_13}; // @[primitives.scala 107:20]
  wire [25:0] notCDom_reduced2AbsSigSum = {notCDom_reduced2AbsSigSum_reducedVec_25,
    notCDom_reduced2AbsSigSum_reducedVec_24,notCDom_reduced2AbsSigSum_reducedVec_23,
    notCDom_reduced2AbsSigSum_reducedVec_22,notCDom_reduced2AbsSigSum_reducedVec_21,
    notCDom_reduced2AbsSigSum_reducedVec_20,notCDom_reduced2AbsSigSum_reducedVec_19,notCDom_reduced2AbsSigSum_hi_lo,
    notCDom_reduced2AbsSigSum_lo}; // @[primitives.scala 107:20]
  wire [4:0] _notCDom_normDistReduced2_T_26 = notCDom_reduced2AbsSigSum[1] ? 5'h18 : 5'h19; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_27 = notCDom_reduced2AbsSigSum[2] ? 5'h17 : _notCDom_normDistReduced2_T_26; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_28 = notCDom_reduced2AbsSigSum[3] ? 5'h16 : _notCDom_normDistReduced2_T_27; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_29 = notCDom_reduced2AbsSigSum[4] ? 5'h15 : _notCDom_normDistReduced2_T_28; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_30 = notCDom_reduced2AbsSigSum[5] ? 5'h14 : _notCDom_normDistReduced2_T_29; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_31 = notCDom_reduced2AbsSigSum[6] ? 5'h13 : _notCDom_normDistReduced2_T_30; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_32 = notCDom_reduced2AbsSigSum[7] ? 5'h12 : _notCDom_normDistReduced2_T_31; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_33 = notCDom_reduced2AbsSigSum[8] ? 5'h11 : _notCDom_normDistReduced2_T_32; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_34 = notCDom_reduced2AbsSigSum[9] ? 5'h10 : _notCDom_normDistReduced2_T_33; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_35 = notCDom_reduced2AbsSigSum[10] ? 5'hf : _notCDom_normDistReduced2_T_34; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_36 = notCDom_reduced2AbsSigSum[11] ? 5'he : _notCDom_normDistReduced2_T_35; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_37 = notCDom_reduced2AbsSigSum[12] ? 5'hd : _notCDom_normDistReduced2_T_36; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_38 = notCDom_reduced2AbsSigSum[13] ? 5'hc : _notCDom_normDistReduced2_T_37; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_39 = notCDom_reduced2AbsSigSum[14] ? 5'hb : _notCDom_normDistReduced2_T_38; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_40 = notCDom_reduced2AbsSigSum[15] ? 5'ha : _notCDom_normDistReduced2_T_39; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_41 = notCDom_reduced2AbsSigSum[16] ? 5'h9 : _notCDom_normDistReduced2_T_40; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_42 = notCDom_reduced2AbsSigSum[17] ? 5'h8 : _notCDom_normDistReduced2_T_41; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_43 = notCDom_reduced2AbsSigSum[18] ? 5'h7 : _notCDom_normDistReduced2_T_42; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_44 = notCDom_reduced2AbsSigSum[19] ? 5'h6 : _notCDom_normDistReduced2_T_43; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_45 = notCDom_reduced2AbsSigSum[20] ? 5'h5 : _notCDom_normDistReduced2_T_44; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_46 = notCDom_reduced2AbsSigSum[21] ? 5'h4 : _notCDom_normDistReduced2_T_45; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_47 = notCDom_reduced2AbsSigSum[22] ? 5'h3 : _notCDom_normDistReduced2_T_46; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_48 = notCDom_reduced2AbsSigSum[23] ? 5'h2 : _notCDom_normDistReduced2_T_47; // @[Mux.scala 47:70]
  wire [4:0] _notCDom_normDistReduced2_T_49 = notCDom_reduced2AbsSigSum[24] ? 5'h1 : _notCDom_normDistReduced2_T_48; // @[Mux.scala 47:70]
  wire [4:0] notCDom_normDistReduced2 = notCDom_reduced2AbsSigSum[25] ? 5'h0 : _notCDom_normDistReduced2_T_49; // @[Mux.scala 47:70]
  wire [5:0] notCDom_nearNormDist = {notCDom_normDistReduced2, 1'h0}; // @[MulAddRecFN.scala 238:56]
  wire [6:0] _notCDom_sExp_T = {1'b0,$signed(notCDom_nearNormDist)}; // @[MulAddRecFN.scala 239:76]
  wire [9:0] _GEN_3 = {{3{_notCDom_sExp_T[6]}},_notCDom_sExp_T}; // @[MulAddRecFN.scala 239:46]
  wire [9:0] notCDom_sExp = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_3); // @[MulAddRecFN.scala 239:46]
  wire [113:0] _GEN_6 = {{63'd0}, notCDom_absSigSum}; // @[MulAddRecFN.scala 241:27]
  wire [113:0] _notCDom_mainSig_T = _GEN_6 << notCDom_nearNormDist; // @[MulAddRecFN.scala 241:27]
  wire [28:0] notCDom_mainSig = _notCDom_mainSig_T[51:23]; // @[MulAddRecFN.scala 241:50]
  wire  notCDom_reduced4SigExtra_reducedVec_0 = |notCDom_reduced2AbsSigSum[1:0]; // @[primitives.scala 103:54]
  wire  notCDom_reduced4SigExtra_reducedVec_1 = |notCDom_reduced2AbsSigSum[3:2]; // @[primitives.scala 103:54]
  wire  notCDom_reduced4SigExtra_reducedVec_2 = |notCDom_reduced2AbsSigSum[5:4]; // @[primitives.scala 103:54]
  wire  notCDom_reduced4SigExtra_reducedVec_3 = |notCDom_reduced2AbsSigSum[7:6]; // @[primitives.scala 103:54]
  wire  notCDom_reduced4SigExtra_reducedVec_4 = |notCDom_reduced2AbsSigSum[9:8]; // @[primitives.scala 103:54]
  wire  notCDom_reduced4SigExtra_reducedVec_5 = |notCDom_reduced2AbsSigSum[11:10]; // @[primitives.scala 103:54]
  wire  notCDom_reduced4SigExtra_reducedVec_6 = |notCDom_reduced2AbsSigSum[12]; // @[primitives.scala 106:57]
  wire [6:0] _notCDom_reduced4SigExtra_T_2 = {notCDom_reduced4SigExtra_reducedVec_6,
    notCDom_reduced4SigExtra_reducedVec_5,notCDom_reduced4SigExtra_reducedVec_4,notCDom_reduced4SigExtra_reducedVec_3,
    notCDom_reduced4SigExtra_reducedVec_2,notCDom_reduced4SigExtra_reducedVec_1,notCDom_reduced4SigExtra_reducedVec_0}; // @[primitives.scala 107:20]
  wire [3:0] _notCDom_reduced4SigExtra_T_4 = ~notCDom_normDistReduced2[4:1]; // @[primitives.scala 52:21]
  wire [16:0] notCDom_reduced4SigExtra_shift = 17'sh10000 >>> _notCDom_reduced4SigExtra_T_4; // @[primitives.scala 76:56]
  wire [5:0] _notCDom_reduced4SigExtra_T_20 = {notCDom_reduced4SigExtra_shift[1],notCDom_reduced4SigExtra_shift[2],
    notCDom_reduced4SigExtra_shift[3],notCDom_reduced4SigExtra_shift[4],notCDom_reduced4SigExtra_shift[5],
    notCDom_reduced4SigExtra_shift[6]}; // @[Cat.scala 33:92]
  wire [6:0] _GEN_4 = {{1'd0}, _notCDom_reduced4SigExtra_T_20}; // @[MulAddRecFN.scala 245:78]
  wire [6:0] _notCDom_reduced4SigExtra_T_21 = _notCDom_reduced4SigExtra_T_2 & _GEN_4; // @[MulAddRecFN.scala 245:78]
  wire  notCDom_reduced4SigExtra = |_notCDom_reduced4SigExtra_T_21; // @[MulAddRecFN.scala 247:11]
  wire  _notCDom_sig_T_3 = |notCDom_mainSig[2:0] | notCDom_reduced4SigExtra; // @[MulAddRecFN.scala 250:39]
  wire [26:0] notCDom_sig = {notCDom_mainSig[28:3],_notCDom_sig_T_3}; // @[Cat.scala 33:92]
  wire  notCDom_completeCancellation = notCDom_sig[26:25] == 2'h0; // @[MulAddRecFN.scala 253:50]
  wire  _notCDom_sign_T = io_fromPreMul_signProd ^ notCDom_signSigSum; // @[MulAddRecFN.scala 257:36]
  wire  notCDom_sign = notCDom_completeCancellation ? 1'h0 : _notCDom_sign_T; // @[MulAddRecFN.scala 255:12]
  wire  notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB; // @[MulAddRecFN.scala 262:49]
  wire  notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC; // @[MulAddRecFN.scala 263:44]
  wire  notNaN_addZeros = (io_fromPreMul_isZeroA | io_fromPreMul_isZeroB) & io_fromPreMul_isZeroC; // @[MulAddRecFN.scala 265:58]
  wire  _io_invalidExc_T = io_fromPreMul_isInfA & io_fromPreMul_isZeroB; // @[MulAddRecFN.scala 270:31]
  wire  _io_invalidExc_T_1 = io_fromPreMul_isSigNaNAny | _io_invalidExc_T; // @[MulAddRecFN.scala 269:35]
  wire  _io_invalidExc_T_2 = io_fromPreMul_isZeroA & io_fromPreMul_isInfB; // @[MulAddRecFN.scala 271:32]
  wire  _io_invalidExc_T_3 = _io_invalidExc_T_1 | _io_invalidExc_T_2; // @[MulAddRecFN.scala 270:57]
  wire  _io_invalidExc_T_6 = ~io_fromPreMul_isNaNAOrB & notNaN_isInfProd; // @[MulAddRecFN.scala 272:36]
  wire  _io_invalidExc_T_7 = _io_invalidExc_T_6 & io_fromPreMul_isInfC; // @[MulAddRecFN.scala 273:61]
  wire  _io_invalidExc_T_8 = _io_invalidExc_T_7 & io_fromPreMul_doSubMags; // @[MulAddRecFN.scala 274:35]
  wire  _io_rawOut_isZero_T_1 = ~io_fromPreMul_CIsDominant & notCDom_completeCancellation; // @[MulAddRecFN.scala 281:42]
  wire  _io_rawOut_sign_T_1 = io_fromPreMul_isInfC & CDom_sign; // @[MulAddRecFN.scala 284:31]
  wire  _io_rawOut_sign_T_2 = notNaN_isInfProd & io_fromPreMul_signProd | _io_rawOut_sign_T_1; // @[MulAddRecFN.scala 283:54]
  wire  _io_rawOut_sign_T_5 = notNaN_addZeros & io_fromPreMul_signProd; // @[MulAddRecFN.scala 285:48]
  wire  _io_rawOut_sign_T_6 = _io_rawOut_sign_T_5 & CDom_sign; // @[MulAddRecFN.scala 286:36]
  wire  _io_rawOut_sign_T_7 = _io_rawOut_sign_T_2 | _io_rawOut_sign_T_6; // @[MulAddRecFN.scala 284:43]
  wire  _io_rawOut_sign_T_15 = io_fromPreMul_CIsDominant ? CDom_sign : notCDom_sign; // @[MulAddRecFN.scala 290:17]
  wire  _io_rawOut_sign_T_16 = ~notNaN_isInfOut & ~notNaN_addZeros & _io_rawOut_sign_T_15; // @[MulAddRecFN.scala 289:49]
  assign io_invalidExc = _io_invalidExc_T_3 | _io_invalidExc_T_8; // @[MulAddRecFN.scala 271:57]
  assign io_rawOut_isNaN = io_fromPreMul_isNaNAOrB | io_fromPreMul_isNaNC; // @[MulAddRecFN.scala 276:48]
  assign io_rawOut_isInf = notNaN_isInfProd | io_fromPreMul_isInfC; // @[MulAddRecFN.scala 263:44]
  assign io_rawOut_isZero = notNaN_addZeros | _io_rawOut_isZero_T_1; // @[MulAddRecFN.scala 280:25]
  assign io_rawOut_sign = _io_rawOut_sign_T_7 | _io_rawOut_sign_T_16; // @[MulAddRecFN.scala 288:50]
  assign io_rawOut_sExp = io_fromPreMul_CIsDominant ? $signed(CDom_sExp) : $signed(notCDom_sExp); // @[MulAddRecFN.scala 291:26]
  assign io_rawOut_sig = io_fromPreMul_CIsDominant ? CDom_sig : notCDom_sig; // @[MulAddRecFN.scala 292:25]
endmodule
module RoundAnyRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
  output [32:0] io_out
);
  wire  doShiftSigDown1 = io_in_sig[26]; // @[RoundAnyRawFNToRecFN.scala 119:57]
  wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0]; // @[primitives.scala 52:21]
  wire  roundMask_msb = _roundMask_T_1[8]; // @[primitives.scala 58:25]
  wire [7:0] roundMask_lsbs = _roundMask_T_1[7:0]; // @[primitives.scala 59:26]
  wire  roundMask_msb_1 = roundMask_lsbs[7]; // @[primitives.scala 58:25]
  wire [6:0] roundMask_lsbs_1 = roundMask_lsbs[6:0]; // @[primitives.scala 59:26]
  wire  roundMask_msb_2 = roundMask_lsbs_1[6]; // @[primitives.scala 58:25]
  wire [5:0] roundMask_lsbs_2 = roundMask_lsbs_1[5:0]; // @[primitives.scala 59:26]
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> roundMask_lsbs_2; // @[primitives.scala 76:56]
  wire [15:0] _GEN_0 = {{8'd0}, roundMask_shift[57:50]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_7 = _GEN_0 & 16'hff; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_9 = {roundMask_shift[49:42], 8'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_11 = _roundMask_T_9 & 16'hff00; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_1 = {{4'd0}, _roundMask_T_12[15:4]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_17 = _GEN_1 & 16'hf0f; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_19 = {_roundMask_T_12[11:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_21 = _roundMask_T_19 & 16'hf0f0; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_2 = {{2'd0}, _roundMask_T_22[15:2]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_27 = _GEN_2 & 16'h3333; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_29 = {_roundMask_T_22[13:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_31 = _roundMask_T_29 & 16'hcccc; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_32 = _roundMask_T_27 | _roundMask_T_31; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_3 = {{1'd0}, _roundMask_T_32[15:1]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_37 = _GEN_3 & 16'h5555; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_39 = {_roundMask_T_32[14:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_41 = _roundMask_T_39 & 16'haaaa; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_42 = _roundMask_T_37 | _roundMask_T_41; // @[Bitwise.scala 108:39]
  wire [21:0] _roundMask_T_59 = {_roundMask_T_42,roundMask_shift[58],roundMask_shift[59],roundMask_shift[60],
    roundMask_shift[61],roundMask_shift[62],roundMask_shift[63]}; // @[Cat.scala 33:92]
  wire [21:0] _roundMask_T_60 = ~_roundMask_T_59; // @[primitives.scala 73:32]
  wire [21:0] _roundMask_T_61 = roundMask_msb_2 ? 22'h0 : _roundMask_T_60; // @[primitives.scala 73:21]
  wire [21:0] _roundMask_T_62 = ~_roundMask_T_61; // @[primitives.scala 73:17]
  wire [24:0] _roundMask_T_63 = {_roundMask_T_62,3'h7}; // @[primitives.scala 68:58]
  wire [2:0] _roundMask_T_70 = {roundMask_shift[0],roundMask_shift[1],roundMask_shift[2]}; // @[Cat.scala 33:92]
  wire [2:0] _roundMask_T_71 = roundMask_msb_2 ? _roundMask_T_70 : 3'h0; // @[primitives.scala 62:24]
  wire [24:0] _roundMask_T_72 = roundMask_msb_1 ? _roundMask_T_63 : {{22'd0}, _roundMask_T_71}; // @[primitives.scala 67:24]
  wire [24:0] _roundMask_T_73 = roundMask_msb ? _roundMask_T_72 : 25'h0; // @[primitives.scala 62:24]
  wire [24:0] _GEN_4 = {{24'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 158:23]
  wire [24:0] _roundMask_T_74 = _roundMask_T_73 | _GEN_4; // @[RoundAnyRawFNToRecFN.scala 158:23]
  wire [26:0] roundMask = {_roundMask_T_74,2'h3}; // @[RoundAnyRawFNToRecFN.scala 158:42]
  wire [27:0] _shiftedRoundMask_T = {1'h0,_roundMask_T_74,2'h3}; // @[RoundAnyRawFNToRecFN.scala 161:41]
  wire [26:0] shiftedRoundMask = _shiftedRoundMask_T[27:1]; // @[RoundAnyRawFNToRecFN.scala 161:53]
  wire [26:0] _roundPosMask_T = ~shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 162:28]
  wire [26:0] roundPosMask = _roundPosMask_T & roundMask; // @[RoundAnyRawFNToRecFN.scala 162:46]
  wire [26:0] _roundPosBit_T = io_in_sig & roundPosMask; // @[RoundAnyRawFNToRecFN.scala 163:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 163:56]
  wire [26:0] _anyRoundExtra_T = io_in_sig & shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 164:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 164:62]
  wire [26:0] _roundedSig_T = io_in_sig | roundMask; // @[RoundAnyRawFNToRecFN.scala 173:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 173:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 175:30]
  wire [25:0] _roundedSig_T_7 = roundPosBit & _roundedSig_T_4 ? roundMask[26:1] : 26'h0; // @[RoundAnyRawFNToRecFN.scala 174:25]
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 174:21]
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 173:57]
  wire [26:0] _roundedSig_T_10 = ~roundMask; // @[RoundAnyRawFNToRecFN.scala 179:32]
  wire [26:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10; // @[RoundAnyRawFNToRecFN.scala 179:30]
  wire [25:0] _roundedSig_T_16 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 179:47]
  wire [25:0] roundedSig = roundPosBit ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 172:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 184:76]
  wire [9:0] _GEN_5 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 184:40]
  wire [10:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_5); // @[RoundAnyRawFNToRecFN.scala 184:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 186:37]
  wire [22:0] common_fractOut = doShiftSigDown1 ? roundedSig[23:1] : roundedSig[22:0]; // @[RoundAnyRawFNToRecFN.scala 188:16]
  wire [3:0] _common_overflow_T = sRoundedExp[10:7]; // @[RoundAnyRawFNToRecFN.scala 195:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 195:50]
  wire  common_totalUnderflow = $signed(sRoundedExp) < 11'sh6b; // @[RoundAnyRawFNToRecFN.scala 199:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 234:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 236:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 237:32]
  wire  notNaN_isInfOut = io_in_isInf | overflow; // @[RoundAnyRawFNToRecFN.scala 247:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 249:22]
  wire [8:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 252:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 252:14]
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 251:24]
  wire [8:0] _expOut_T_11 = notNaN_isInfOut ? 9'h40 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 264:18]
  wire [8:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 264:14]
  wire [8:0] _expOut_T_13 = _expOut_T_3 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 263:17]
  wire [8:0] _expOut_T_18 = notNaN_isInfOut ? 9'h180 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [8:0] _expOut_T_19 = _expOut_T_13 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 275:15]
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 277:16]
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 276:73]
  wire [22:0] _fractOut_T_2 = isNaNOut ? 23'h400000 : 23'h0; // @[RoundAnyRawFNToRecFN.scala 280:16]
  wire [22:0] fractOut = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 279:12]
  wire [9:0] _io_out_T = {signOut,expOut}; // @[RoundAnyRawFNToRecFN.scala 285:23]
  assign io_out = {_io_out_T,fractOut}; // @[RoundAnyRawFNToRecFN.scala 285:33]
endmodule
module RoundRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
  output [32:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire [9:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire [26:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 308:15]
  wire [32:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 308:15]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[RoundAnyRawFNToRecFN.scala 308:15]
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 316:23]
  assign roundAnyRawFNToRecFN_io_invalidExc = io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 311:44]
  assign roundAnyRawFNToRecFN_io_in_isNaN = io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 313:44]
  assign roundAnyRawFNToRecFN_io_in_isInf = io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 313:44]
  assign roundAnyRawFNToRecFN_io_in_isZero = io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 313:44]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in_sign; // @[RoundAnyRawFNToRecFN.scala 313:44]
  assign roundAnyRawFNToRecFN_io_in_sExp = io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 313:44]
  assign roundAnyRawFNToRecFN_io_in_sig = io_in_sig; // @[RoundAnyRawFNToRecFN.scala 313:44]
endmodule
module MulAddRecFN(
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [32:0] io_c,
  output [32:0] io_out
);
  wire [32:0] mulAddRecFNToRaw_preMul_io_a; // @[MulAddRecFN.scala 314:15]
  wire [32:0] mulAddRecFNToRaw_preMul_io_b; // @[MulAddRecFN.scala 314:15]
  wire [32:0] mulAddRecFNToRaw_preMul_io_c; // @[MulAddRecFN.scala 314:15]
  wire [23:0] mulAddRecFNToRaw_preMul_io_mulAddA; // @[MulAddRecFN.scala 314:15]
  wire [23:0] mulAddRecFNToRaw_preMul_io_mulAddB; // @[MulAddRecFN.scala 314:15]
  wire [47:0] mulAddRecFNToRaw_preMul_io_mulAddC; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfA; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfB; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_signProd; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isInfC; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC; // @[MulAddRecFN.scala 314:15]
  wire [9:0] mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant; // @[MulAddRecFN.scala 314:15]
  wire [4:0] mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist; // @[MulAddRecFN.scala 314:15]
  wire [25:0] mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC; // @[MulAddRecFN.scala 314:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_signProd; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC; // @[MulAddRecFN.scala 316:15]
  wire [9:0] mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant; // @[MulAddRecFN.scala 316:15]
  wire [4:0] mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist; // @[MulAddRecFN.scala 316:15]
  wire [25:0] mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC; // @[MulAddRecFN.scala 316:15]
  wire [48:0] mulAddRecFNToRaw_postMul_io_mulAddResult; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_invalidExc; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isNaN; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isInf; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_isZero; // @[MulAddRecFN.scala 316:15]
  wire  mulAddRecFNToRaw_postMul_io_rawOut_sign; // @[MulAddRecFN.scala 316:15]
  wire [9:0] mulAddRecFNToRaw_postMul_io_rawOut_sExp; // @[MulAddRecFN.scala 316:15]
  wire [26:0] mulAddRecFNToRaw_postMul_io_rawOut_sig; // @[MulAddRecFN.scala 316:15]
  wire  roundRawFNToRecFN_io_invalidExc; // @[MulAddRecFN.scala 336:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[MulAddRecFN.scala 336:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[MulAddRecFN.scala 336:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[MulAddRecFN.scala 336:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[MulAddRecFN.scala 336:15]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[MulAddRecFN.scala 336:15]
  wire [26:0] roundRawFNToRecFN_io_in_sig; // @[MulAddRecFN.scala 336:15]
  wire [32:0] roundRawFNToRecFN_io_out; // @[MulAddRecFN.scala 336:15]
  wire [47:0] _mulAddResult_T = mulAddRecFNToRaw_preMul_io_mulAddA * mulAddRecFNToRaw_preMul_io_mulAddB; // @[MulAddRecFN.scala 324:45]
  MulAddRecFNToRaw_preMul mulAddRecFNToRaw_preMul ( // @[MulAddRecFN.scala 314:15]
    .io_a(mulAddRecFNToRaw_preMul_io_a),
    .io_b(mulAddRecFNToRaw_preMul_io_b),
    .io_c(mulAddRecFNToRaw_preMul_io_c),
    .io_mulAddA(mulAddRecFNToRaw_preMul_io_mulAddA),
    .io_mulAddB(mulAddRecFNToRaw_preMul_io_mulAddB),
    .io_mulAddC(mulAddRecFNToRaw_preMul_io_mulAddC),
    .io_toPostMul_isSigNaNAny(mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny),
    .io_toPostMul_isNaNAOrB(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB),
    .io_toPostMul_isInfA(mulAddRecFNToRaw_preMul_io_toPostMul_isInfA),
    .io_toPostMul_isZeroA(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA),
    .io_toPostMul_isInfB(mulAddRecFNToRaw_preMul_io_toPostMul_isInfB),
    .io_toPostMul_isZeroB(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB),
    .io_toPostMul_signProd(mulAddRecFNToRaw_preMul_io_toPostMul_signProd),
    .io_toPostMul_isNaNC(mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC),
    .io_toPostMul_isInfC(mulAddRecFNToRaw_preMul_io_toPostMul_isInfC),
    .io_toPostMul_isZeroC(mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC),
    .io_toPostMul_sExpSum(mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum),
    .io_toPostMul_doSubMags(mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags),
    .io_toPostMul_CIsDominant(mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant),
    .io_toPostMul_CDom_CAlignDist(mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist),
    .io_toPostMul_highAlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC),
    .io_toPostMul_bit0AlignedSigC(mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC)
  );
  MulAddRecFNToRaw_postMul mulAddRecFNToRaw_postMul ( // @[MulAddRecFN.scala 316:15]
    .io_fromPreMul_isSigNaNAny(mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny),
    .io_fromPreMul_isNaNAOrB(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB),
    .io_fromPreMul_isInfA(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA),
    .io_fromPreMul_isZeroA(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA),
    .io_fromPreMul_isInfB(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB),
    .io_fromPreMul_isZeroB(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB),
    .io_fromPreMul_signProd(mulAddRecFNToRaw_postMul_io_fromPreMul_signProd),
    .io_fromPreMul_isNaNC(mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC),
    .io_fromPreMul_isInfC(mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC),
    .io_fromPreMul_isZeroC(mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC),
    .io_fromPreMul_sExpSum(mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum),
    .io_fromPreMul_doSubMags(mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags),
    .io_fromPreMul_CIsDominant(mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant),
    .io_fromPreMul_CDom_CAlignDist(mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist),
    .io_fromPreMul_highAlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC),
    .io_fromPreMul_bit0AlignedSigC(mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC),
    .io_mulAddResult(mulAddRecFNToRaw_postMul_io_mulAddResult),
    .io_invalidExc(mulAddRecFNToRaw_postMul_io_invalidExc),
    .io_rawOut_isNaN(mulAddRecFNToRaw_postMul_io_rawOut_isNaN),
    .io_rawOut_isInf(mulAddRecFNToRaw_postMul_io_rawOut_isInf),
    .io_rawOut_isZero(mulAddRecFNToRaw_postMul_io_rawOut_isZero),
    .io_rawOut_sign(mulAddRecFNToRaw_postMul_io_rawOut_sign),
    .io_rawOut_sExp(mulAddRecFNToRaw_postMul_io_rawOut_sExp),
    .io_rawOut_sig(mulAddRecFNToRaw_postMul_io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[MulAddRecFN.scala 336:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[MulAddRecFN.scala 342:23]
  assign mulAddRecFNToRaw_preMul_io_a = io_a; // @[MulAddRecFN.scala 319:35]
  assign mulAddRecFNToRaw_preMul_io_b = io_b; // @[MulAddRecFN.scala 320:35]
  assign mulAddRecFNToRaw_preMul_io_c = io_c; // @[MulAddRecFN.scala 321:35]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isSigNaNAny = mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNAOrB = mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfA = mulAddRecFNToRaw_preMul_io_toPostMul_isInfA; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroA = mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfB = mulAddRecFNToRaw_preMul_io_toPostMul_isInfB; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroB = mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_signProd = mulAddRecFNToRaw_preMul_io_toPostMul_signProd; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isNaNC = mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isInfC = mulAddRecFNToRaw_preMul_io_toPostMul_isInfC; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_isZeroC = mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_sExpSum = mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_doSubMags = mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CIsDominant = mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_CDom_CAlignDist = mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_highAlignedSigC = mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_fromPreMul_bit0AlignedSigC = mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC; // @[MulAddRecFN.scala 328:44]
  assign mulAddRecFNToRaw_postMul_io_mulAddResult = _mulAddResult_T + mulAddRecFNToRaw_preMul_io_mulAddC; // @[MulAddRecFN.scala 325:50]
  assign roundRawFNToRecFN_io_invalidExc = mulAddRecFNToRaw_postMul_io_invalidExc; // @[MulAddRecFN.scala 337:39]
  assign roundRawFNToRecFN_io_in_isNaN = mulAddRecFNToRaw_postMul_io_rawOut_isNaN; // @[MulAddRecFN.scala 339:39]
  assign roundRawFNToRecFN_io_in_isInf = mulAddRecFNToRaw_postMul_io_rawOut_isInf; // @[MulAddRecFN.scala 339:39]
  assign roundRawFNToRecFN_io_in_isZero = mulAddRecFNToRaw_postMul_io_rawOut_isZero; // @[MulAddRecFN.scala 339:39]
  assign roundRawFNToRecFN_io_in_sign = mulAddRecFNToRaw_postMul_io_rawOut_sign; // @[MulAddRecFN.scala 339:39]
  assign roundRawFNToRecFN_io_in_sExp = mulAddRecFNToRaw_postMul_io_rawOut_sExp; // @[MulAddRecFN.scala 339:39]
  assign roundRawFNToRecFN_io_in_sig = mulAddRecFNToRaw_postMul_io_rawOut_sig; // @[MulAddRecFN.scala 339:39]
endmodule
module Queue_15(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:15]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [3:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RoundAnyRawFNToRecFN_1(
  input  [3:0]  io_in_sExp,
  output [32:0] io_out
);
  wire [8:0] _GEN_0 = {{5{io_in_sExp[3]}},io_in_sExp}; // @[RoundAnyRawFNToRecFN.scala 103:25]
  wire [9:0] _sAdjustedExp_T = $signed(_GEN_0) + 9'shfc; // @[RoundAnyRawFNToRecFN.scala 103:25]
  wire [9:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[8:0])}; // @[RoundAnyRawFNToRecFN.scala 105:31]
  wire [9:0] _common_expOut_T_1 = {{1'd0}, sAdjustedExp[8:0]}; // @[RoundAnyRawFNToRecFN.scala 135:55]
  wire [8:0] common_expOut = _common_expOut_T_1[8:0]; // @[RoundAnyRawFNToRecFN.scala 135:55]
  wire [9:0] _io_out_T = {1'h0,common_expOut}; // @[RoundAnyRawFNToRecFN.scala 285:23]
  assign io_out = {_io_out_T,23'h0}; // @[RoundAnyRawFNToRecFN.scala 285:33]
endmodule
module INToRecFN(
  output [32:0] io_out
);
  wire [3:0] roundAnyRawFNToRecFN_io_in_sExp; // @[INToRecFN.scala 59:15]
  wire [32:0] roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 59:15]
  RoundAnyRawFNToRecFN_1 roundAnyRawFNToRecFN ( // @[INToRecFN.scala 59:15]
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[INToRecFN.scala 72:23]
  assign roundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(3'h4)}; // @[rawFloatFromIN.scala 64:72]
endmodule
module FloatMultAccEngine(
  input         clock,
  input         reset,
  output        io_inData_0_ready,
  input         io_inData_0_valid,
  input  [31:0] io_inData_0_bits_bits,
  output        io_inData_1_ready,
  input         io_inData_1_valid,
  input  [31:0] io_inData_1_bits_bits,
  input         io_outData_0_ready,
  output        io_outData_0_valid,
  output [31:0] io_outData_0_bits_bits,
  output        ctrl_io_resetCounter_ready,
  input         ctrl_io_resetCounter_valid,
  input  [31:0] ctrl_io_resetCounter_bits,
  output        ctrl_io_idle
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] multReg_t_resizer_io_in; // @[Arithmetic.scala 220:32]
  wire [32:0] multReg_t_resizer_io_out; // @[Arithmetic.scala 220:32]
  wire [32:0] multReg_muladder_io_a; // @[Arithmetic.scala 226:30]
  wire [32:0] multReg_muladder_io_b; // @[Arithmetic.scala 226:30]
  wire [32:0] multReg_muladder_io_c; // @[Arithmetic.scala 226:30]
  wire [32:0] multReg_muladder_io_out; // @[Arithmetic.scala 226:30]
  wire  accQueue_clock; // @[MAccDFE.scala 53:24]
  wire  accQueue_reset; // @[MAccDFE.scala 53:24]
  wire  accQueue_io_enq_ready; // @[MAccDFE.scala 53:24]
  wire  accQueue_io_enq_valid; // @[MAccDFE.scala 53:24]
  wire [31:0] accQueue_io_enq_bits; // @[MAccDFE.scala 53:24]
  wire  accQueue_io_deq_ready; // @[MAccDFE.scala 53:24]
  wire  accQueue_io_deq_valid; // @[MAccDFE.scala 53:24]
  wire [31:0] accQueue_io_deq_bits; // @[MAccDFE.scala 53:24]
  wire [32:0] result_1_in_to_rec_fn_io_out; // @[Arithmetic.scala 286:34]
  wire [32:0] result_1_t_resizer_io_in; // @[Arithmetic.scala 295:31]
  wire [32:0] result_1_t_resizer_io_out; // @[Arithmetic.scala 295:31]
  wire [32:0] result_1_muladder_io_a; // @[Arithmetic.scala 302:30]
  wire [32:0] result_1_muladder_io_b; // @[Arithmetic.scala 302:30]
  wire [32:0] result_1_muladder_io_c; // @[Arithmetic.scala 302:30]
  wire [32:0] result_1_muladder_io_out; // @[Arithmetic.scala 302:30]
  wire [32:0] io_outData_0_bits_in_to_rec_fn_io_out; // @[Arithmetic.scala 286:34]
  wire [32:0] io_outData_0_bits_t_resizer_io_in; // @[Arithmetic.scala 295:31]
  wire [32:0] io_outData_0_bits_t_resizer_io_out; // @[Arithmetic.scala 295:31]
  wire [32:0] io_outData_0_bits_muladder_io_a; // @[Arithmetic.scala 302:30]
  wire [32:0] io_outData_0_bits_muladder_io_b; // @[Arithmetic.scala 302:30]
  wire [32:0] io_outData_0_bits_muladder_io_c; // @[Arithmetic.scala 302:30]
  wire [32:0] io_outData_0_bits_muladder_io_out; // @[Arithmetic.scala 302:30]
  reg [31:0] multReg_bits; // @[MAccDFE.scala 21:24]
  reg  multValid; // @[MAccDFE.scala 22:26]
  wire  _T_2 = io_inData_0_ready & io_inData_1_ready & io_inData_0_valid & io_inData_1_valid; // @[MAccDFE.scala 24:71]
  wire  multReg_t_rec_rawIn_sign = io_inData_1_bits_bits[31]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] multReg_t_rec_rawIn_expIn = io_inData_1_bits_bits[30:23]; // @[rawFloatFromFN.scala 45:19]
  wire [22:0] multReg_t_rec_rawIn_fractIn = io_inData_1_bits_bits[22:0]; // @[rawFloatFromFN.scala 46:21]
  wire  multReg_t_rec_rawIn_isZeroExpIn = multReg_t_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  multReg_t_rec_rawIn_isZeroFractIn = multReg_t_rec_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_23 = multReg_t_rec_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_24 = multReg_t_rec_rawIn_fractIn[2] ? 5'h14 :
    _multReg_t_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_25 = multReg_t_rec_rawIn_fractIn[3] ? 5'h13 :
    _multReg_t_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_26 = multReg_t_rec_rawIn_fractIn[4] ? 5'h12 :
    _multReg_t_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_27 = multReg_t_rec_rawIn_fractIn[5] ? 5'h11 :
    _multReg_t_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_28 = multReg_t_rec_rawIn_fractIn[6] ? 5'h10 :
    _multReg_t_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_29 = multReg_t_rec_rawIn_fractIn[7] ? 5'hf :
    _multReg_t_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_30 = multReg_t_rec_rawIn_fractIn[8] ? 5'he :
    _multReg_t_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_31 = multReg_t_rec_rawIn_fractIn[9] ? 5'hd :
    _multReg_t_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_32 = multReg_t_rec_rawIn_fractIn[10] ? 5'hc :
    _multReg_t_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_33 = multReg_t_rec_rawIn_fractIn[11] ? 5'hb :
    _multReg_t_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_34 = multReg_t_rec_rawIn_fractIn[12] ? 5'ha :
    _multReg_t_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_35 = multReg_t_rec_rawIn_fractIn[13] ? 5'h9 :
    _multReg_t_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_36 = multReg_t_rec_rawIn_fractIn[14] ? 5'h8 :
    _multReg_t_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_37 = multReg_t_rec_rawIn_fractIn[15] ? 5'h7 :
    _multReg_t_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_38 = multReg_t_rec_rawIn_fractIn[16] ? 5'h6 :
    _multReg_t_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_39 = multReg_t_rec_rawIn_fractIn[17] ? 5'h5 :
    _multReg_t_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_40 = multReg_t_rec_rawIn_fractIn[18] ? 5'h4 :
    _multReg_t_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_41 = multReg_t_rec_rawIn_fractIn[19] ? 5'h3 :
    _multReg_t_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_42 = multReg_t_rec_rawIn_fractIn[20] ? 5'h2 :
    _multReg_t_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [4:0] _multReg_t_rec_rawIn_normDist_T_43 = multReg_t_rec_rawIn_fractIn[21] ? 5'h1 :
    _multReg_t_rec_rawIn_normDist_T_42; // @[Mux.scala 47:70]
  wire [4:0] multReg_t_rec_rawIn_normDist = multReg_t_rec_rawIn_fractIn[22] ? 5'h0 : _multReg_t_rec_rawIn_normDist_T_43; // @[Mux.scala 47:70]
  wire [53:0] _GEN_1 = {{31'd0}, multReg_t_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [53:0] _multReg_t_rec_rawIn_subnormFract_T = _GEN_1 << multReg_t_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [22:0] multReg_t_rec_rawIn_subnormFract = {_multReg_t_rec_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_18 = {{4'd0}, multReg_t_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _multReg_t_rec_rawIn_adjustedExp_T = _GEN_18 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _multReg_t_rec_rawIn_adjustedExp_T_1 = multReg_t_rec_rawIn_isZeroExpIn ? _multReg_t_rec_rawIn_adjustedExp_T
     : {{1'd0}, multReg_t_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _multReg_t_rec_rawIn_adjustedExp_T_2 = multReg_t_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_19 = {{6'd0}, _multReg_t_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _multReg_t_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_19; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_20 = {{1'd0}, _multReg_t_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] multReg_t_rec_rawIn_adjustedExp = _multReg_t_rec_rawIn_adjustedExp_T_1 + _GEN_20; // @[rawFloatFromFN.scala 57:9]
  wire  multReg_t_rec_rawIn_isZero = multReg_t_rec_rawIn_isZeroExpIn & multReg_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  multReg_t_rec_rawIn_isSpecial = multReg_t_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  multReg_t_rec_rawIn__isNaN = multReg_t_rec_rawIn_isSpecial & ~multReg_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] multReg_t_rec_rawIn__sExp = {1'b0,$signed(multReg_t_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _multReg_t_rec_rawIn_out_sig_T = ~multReg_t_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [22:0] _multReg_t_rec_rawIn_out_sig_T_2 = multReg_t_rec_rawIn_isZeroExpIn ? multReg_t_rec_rawIn_subnormFract :
    multReg_t_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [24:0] multReg_t_rec_rawIn__sig = {1'h0,_multReg_t_rec_rawIn_out_sig_T,_multReg_t_rec_rawIn_out_sig_T_2}; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _multReg_t_rec_T_1 = multReg_t_rec_rawIn_isZero ? 3'h0 : multReg_t_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_21 = {{2'd0}, multReg_t_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _multReg_t_rec_T_3 = _multReg_t_rec_T_1 | _GEN_21; // @[recFNFromFN.scala 48:76]
  wire [9:0] _multReg_t_rec_T_6 = {multReg_t_rec_rawIn_sign,_multReg_t_rec_T_3,multReg_t_rec_rawIn__sExp[5:0]}; // @[recFNFromFN.scala 49:45]
  wire  multReg_self_rec_rawIn_sign = io_inData_0_bits_bits[31]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] multReg_self_rec_rawIn_expIn = io_inData_0_bits_bits[30:23]; // @[rawFloatFromFN.scala 45:19]
  wire [22:0] multReg_self_rec_rawIn_fractIn = io_inData_0_bits_bits[22:0]; // @[rawFloatFromFN.scala 46:21]
  wire  multReg_self_rec_rawIn_isZeroExpIn = multReg_self_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  multReg_self_rec_rawIn_isZeroFractIn = multReg_self_rec_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_23 = multReg_self_rec_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_24 = multReg_self_rec_rawIn_fractIn[2] ? 5'h14 :
    _multReg_self_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_25 = multReg_self_rec_rawIn_fractIn[3] ? 5'h13 :
    _multReg_self_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_26 = multReg_self_rec_rawIn_fractIn[4] ? 5'h12 :
    _multReg_self_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_27 = multReg_self_rec_rawIn_fractIn[5] ? 5'h11 :
    _multReg_self_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_28 = multReg_self_rec_rawIn_fractIn[6] ? 5'h10 :
    _multReg_self_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_29 = multReg_self_rec_rawIn_fractIn[7] ? 5'hf :
    _multReg_self_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_30 = multReg_self_rec_rawIn_fractIn[8] ? 5'he :
    _multReg_self_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_31 = multReg_self_rec_rawIn_fractIn[9] ? 5'hd :
    _multReg_self_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_32 = multReg_self_rec_rawIn_fractIn[10] ? 5'hc :
    _multReg_self_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_33 = multReg_self_rec_rawIn_fractIn[11] ? 5'hb :
    _multReg_self_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_34 = multReg_self_rec_rawIn_fractIn[12] ? 5'ha :
    _multReg_self_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_35 = multReg_self_rec_rawIn_fractIn[13] ? 5'h9 :
    _multReg_self_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_36 = multReg_self_rec_rawIn_fractIn[14] ? 5'h8 :
    _multReg_self_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_37 = multReg_self_rec_rawIn_fractIn[15] ? 5'h7 :
    _multReg_self_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_38 = multReg_self_rec_rawIn_fractIn[16] ? 5'h6 :
    _multReg_self_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_39 = multReg_self_rec_rawIn_fractIn[17] ? 5'h5 :
    _multReg_self_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_40 = multReg_self_rec_rawIn_fractIn[18] ? 5'h4 :
    _multReg_self_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_41 = multReg_self_rec_rawIn_fractIn[19] ? 5'h3 :
    _multReg_self_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_42 = multReg_self_rec_rawIn_fractIn[20] ? 5'h2 :
    _multReg_self_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [4:0] _multReg_self_rec_rawIn_normDist_T_43 = multReg_self_rec_rawIn_fractIn[21] ? 5'h1 :
    _multReg_self_rec_rawIn_normDist_T_42; // @[Mux.scala 47:70]
  wire [4:0] multReg_self_rec_rawIn_normDist = multReg_self_rec_rawIn_fractIn[22] ? 5'h0 :
    _multReg_self_rec_rawIn_normDist_T_43; // @[Mux.scala 47:70]
  wire [53:0] _GEN_4 = {{31'd0}, multReg_self_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [53:0] _multReg_self_rec_rawIn_subnormFract_T = _GEN_4 << multReg_self_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [22:0] multReg_self_rec_rawIn_subnormFract = {_multReg_self_rec_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_22 = {{4'd0}, multReg_self_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _multReg_self_rec_rawIn_adjustedExp_T = _GEN_22 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _multReg_self_rec_rawIn_adjustedExp_T_1 = multReg_self_rec_rawIn_isZeroExpIn ?
    _multReg_self_rec_rawIn_adjustedExp_T : {{1'd0}, multReg_self_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _multReg_self_rec_rawIn_adjustedExp_T_2 = multReg_self_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_23 = {{6'd0}, _multReg_self_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _multReg_self_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_23; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_24 = {{1'd0}, _multReg_self_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] multReg_self_rec_rawIn_adjustedExp = _multReg_self_rec_rawIn_adjustedExp_T_1 + _GEN_24; // @[rawFloatFromFN.scala 57:9]
  wire  multReg_self_rec_rawIn_isZero = multReg_self_rec_rawIn_isZeroExpIn & multReg_self_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  multReg_self_rec_rawIn_isSpecial = multReg_self_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  multReg_self_rec_rawIn__isNaN = multReg_self_rec_rawIn_isSpecial & ~multReg_self_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] multReg_self_rec_rawIn__sExp = {1'b0,$signed(multReg_self_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _multReg_self_rec_rawIn_out_sig_T = ~multReg_self_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [22:0] _multReg_self_rec_rawIn_out_sig_T_2 = multReg_self_rec_rawIn_isZeroExpIn ?
    multReg_self_rec_rawIn_subnormFract : multReg_self_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [24:0] multReg_self_rec_rawIn__sig = {1'h0,_multReg_self_rec_rawIn_out_sig_T,_multReg_self_rec_rawIn_out_sig_T_2}
    ; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _multReg_self_rec_T_1 = multReg_self_rec_rawIn_isZero ? 3'h0 : multReg_self_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_25 = {{2'd0}, multReg_self_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _multReg_self_rec_T_3 = _multReg_self_rec_T_1 | _GEN_25; // @[recFNFromFN.scala 48:76]
  wire [9:0] _multReg_self_rec_T_6 = {multReg_self_rec_rawIn_sign,_multReg_self_rec_T_3,multReg_self_rec_rawIn__sExp[5:0
    ]}; // @[recFNFromFN.scala 49:45]
  wire [8:0] multReg_out_bits_rawIn_exp = multReg_muladder_io_out[31:23]; // @[rawFloatFromRecFN.scala 51:21]
  wire  multReg_out_bits_rawIn_isZero = multReg_out_bits_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  multReg_out_bits_rawIn_isSpecial = multReg_out_bits_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  multReg_out_bits_rawIn__isNaN = multReg_out_bits_rawIn_isSpecial & multReg_out_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  multReg_out_bits_rawIn__isInf = multReg_out_bits_rawIn_isSpecial & ~multReg_out_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  wire  multReg_out_bits_rawIn__sign = multReg_muladder_io_out[32]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] multReg_out_bits_rawIn__sExp = {1'b0,$signed(multReg_out_bits_rawIn_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _multReg_out_bits_rawIn_out_sig_T = ~multReg_out_bits_rawIn_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [24:0] multReg_out_bits_rawIn__sig = {1'h0,_multReg_out_bits_rawIn_out_sig_T,multReg_muladder_io_out[22:0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire  multReg_out_bits_isSubnormal = $signed(multReg_out_bits_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 51:38]
  wire [4:0] multReg_out_bits_denormShiftDist = 5'h1 - multReg_out_bits_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 52:35]
  wire [23:0] _multReg_out_bits_denormFract_T_1 = multReg_out_bits_rawIn__sig[24:1] >> multReg_out_bits_denormShiftDist; // @[fNFromRecFN.scala 53:42]
  wire [22:0] multReg_out_bits_denormFract = _multReg_out_bits_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 53:60]
  wire [7:0] _multReg_out_bits_expOut_T_2 = multReg_out_bits_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 58:45]
  wire [7:0] _multReg_out_bits_expOut_T_3 = multReg_out_bits_isSubnormal ? 8'h0 : _multReg_out_bits_expOut_T_2; // @[fNFromRecFN.scala 56:16]
  wire  _multReg_out_bits_expOut_T_4 = multReg_out_bits_rawIn__isNaN | multReg_out_bits_rawIn__isInf; // @[fNFromRecFN.scala 60:44]
  wire [7:0] _multReg_out_bits_expOut_T_6 = _multReg_out_bits_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] multReg_out_bits_expOut = _multReg_out_bits_expOut_T_3 | _multReg_out_bits_expOut_T_6; // @[fNFromRecFN.scala 60:15]
  wire [22:0] _multReg_out_bits_fractOut_T_1 = multReg_out_bits_rawIn__isInf ? 23'h0 : multReg_out_bits_rawIn__sig[22:0]
    ; // @[fNFromRecFN.scala 64:20]
  wire [22:0] multReg_out_bits_fractOut = multReg_out_bits_isSubnormal ? multReg_out_bits_denormFract :
    _multReg_out_bits_fractOut_T_1; // @[fNFromRecFN.scala 62:16]
  wire [31:0] multReg_out_bits = {multReg_out_bits_rawIn__sign,multReg_out_bits_expOut,multReg_out_bits_fractOut}; // @[Cat.scala 33:92]
  reg [1:0] state; // @[MAccDFE.scala 56:22]
  wire  _T_9 = state == 2'h2; // @[MAccDFE.scala 74:16]
  reg [31:0] count; // @[MAccDFE.scala 52:22]
  reg [31:0] accNum; // @[MAccDFE.scala 54:23]
  wire  multWire_ready = (state == 2'h2 | state == 2'h1) & count < accNum; // @[MAccDFE.scala 74:59]
  wire  _GEN_2 = multWire_ready ? 1'h0 : multValid; // @[MAccDFE.scala 41:29 42:15 44:15]
  wire  _GEN_3 = _T_2 | _GEN_2; // @[MAccDFE.scala 38:93 39:15]
  reg [31:0] result_0_bits; // @[MAccDFE.scala 50:25]
  reg [31:0] result_1_bits; // @[MAccDFE.scala 51:25]
  wire  _lastIter_T_1 = count == accNum; // @[MAccDFE.scala 72:52]
  wire  result_1_t_rec_rawIn_sign = result_0_bits[31]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] result_1_t_rec_rawIn_expIn = result_0_bits[30:23]; // @[rawFloatFromFN.scala 45:19]
  wire [22:0] result_1_t_rec_rawIn_fractIn = result_0_bits[22:0]; // @[rawFloatFromFN.scala 46:21]
  wire  result_1_t_rec_rawIn_isZeroExpIn = result_1_t_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  result_1_t_rec_rawIn_isZeroFractIn = result_1_t_rec_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_23 = result_1_t_rec_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_24 = result_1_t_rec_rawIn_fractIn[2] ? 5'h14 :
    _result_1_t_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_25 = result_1_t_rec_rawIn_fractIn[3] ? 5'h13 :
    _result_1_t_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_26 = result_1_t_rec_rawIn_fractIn[4] ? 5'h12 :
    _result_1_t_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_27 = result_1_t_rec_rawIn_fractIn[5] ? 5'h11 :
    _result_1_t_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_28 = result_1_t_rec_rawIn_fractIn[6] ? 5'h10 :
    _result_1_t_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_29 = result_1_t_rec_rawIn_fractIn[7] ? 5'hf :
    _result_1_t_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_30 = result_1_t_rec_rawIn_fractIn[8] ? 5'he :
    _result_1_t_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_31 = result_1_t_rec_rawIn_fractIn[9] ? 5'hd :
    _result_1_t_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_32 = result_1_t_rec_rawIn_fractIn[10] ? 5'hc :
    _result_1_t_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_33 = result_1_t_rec_rawIn_fractIn[11] ? 5'hb :
    _result_1_t_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_34 = result_1_t_rec_rawIn_fractIn[12] ? 5'ha :
    _result_1_t_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_35 = result_1_t_rec_rawIn_fractIn[13] ? 5'h9 :
    _result_1_t_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_36 = result_1_t_rec_rawIn_fractIn[14] ? 5'h8 :
    _result_1_t_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_37 = result_1_t_rec_rawIn_fractIn[15] ? 5'h7 :
    _result_1_t_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_38 = result_1_t_rec_rawIn_fractIn[16] ? 5'h6 :
    _result_1_t_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_39 = result_1_t_rec_rawIn_fractIn[17] ? 5'h5 :
    _result_1_t_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_40 = result_1_t_rec_rawIn_fractIn[18] ? 5'h4 :
    _result_1_t_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_41 = result_1_t_rec_rawIn_fractIn[19] ? 5'h3 :
    _result_1_t_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_42 = result_1_t_rec_rawIn_fractIn[20] ? 5'h2 :
    _result_1_t_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [4:0] _result_1_t_rec_rawIn_normDist_T_43 = result_1_t_rec_rawIn_fractIn[21] ? 5'h1 :
    _result_1_t_rec_rawIn_normDist_T_42; // @[Mux.scala 47:70]
  wire [4:0] result_1_t_rec_rawIn_normDist = result_1_t_rec_rawIn_fractIn[22] ? 5'h0 :
    _result_1_t_rec_rawIn_normDist_T_43; // @[Mux.scala 47:70]
  wire [53:0] _GEN_5 = {{31'd0}, result_1_t_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [53:0] _result_1_t_rec_rawIn_subnormFract_T = _GEN_5 << result_1_t_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [22:0] result_1_t_rec_rawIn_subnormFract = {_result_1_t_rec_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_26 = {{4'd0}, result_1_t_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _result_1_t_rec_rawIn_adjustedExp_T = _GEN_26 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _result_1_t_rec_rawIn_adjustedExp_T_1 = result_1_t_rec_rawIn_isZeroExpIn ?
    _result_1_t_rec_rawIn_adjustedExp_T : {{1'd0}, result_1_t_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _result_1_t_rec_rawIn_adjustedExp_T_2 = result_1_t_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_27 = {{6'd0}, _result_1_t_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _result_1_t_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_27; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_28 = {{1'd0}, _result_1_t_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] result_1_t_rec_rawIn_adjustedExp = _result_1_t_rec_rawIn_adjustedExp_T_1 + _GEN_28; // @[rawFloatFromFN.scala 57:9]
  wire  result_1_t_rec_rawIn_isZero = result_1_t_rec_rawIn_isZeroExpIn & result_1_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  result_1_t_rec_rawIn_isSpecial = result_1_t_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  result_1_t_rec_rawIn__isNaN = result_1_t_rec_rawIn_isSpecial & ~result_1_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] result_1_t_rec_rawIn__sExp = {1'b0,$signed(result_1_t_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _result_1_t_rec_rawIn_out_sig_T = ~result_1_t_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [22:0] _result_1_t_rec_rawIn_out_sig_T_2 = result_1_t_rec_rawIn_isZeroExpIn ? result_1_t_rec_rawIn_subnormFract
     : result_1_t_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [24:0] result_1_t_rec_rawIn__sig = {1'h0,_result_1_t_rec_rawIn_out_sig_T,_result_1_t_rec_rawIn_out_sig_T_2}; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _result_1_t_rec_T_1 = result_1_t_rec_rawIn_isZero ? 3'h0 : result_1_t_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_29 = {{2'd0}, result_1_t_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _result_1_t_rec_T_3 = _result_1_t_rec_T_1 | _GEN_29; // @[recFNFromFN.scala 48:76]
  wire [9:0] _result_1_t_rec_T_6 = {result_1_t_rec_rawIn_sign,_result_1_t_rec_T_3,result_1_t_rec_rawIn__sExp[5:0]}; // @[recFNFromFN.scala 49:45]
  wire  result_1_self_rec_rawIn_sign = multReg_bits[31]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] result_1_self_rec_rawIn_expIn = multReg_bits[30:23]; // @[rawFloatFromFN.scala 45:19]
  wire [22:0] result_1_self_rec_rawIn_fractIn = multReg_bits[22:0]; // @[rawFloatFromFN.scala 46:21]
  wire  result_1_self_rec_rawIn_isZeroExpIn = result_1_self_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  result_1_self_rec_rawIn_isZeroFractIn = result_1_self_rec_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_23 = result_1_self_rec_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_24 = result_1_self_rec_rawIn_fractIn[2] ? 5'h14 :
    _result_1_self_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_25 = result_1_self_rec_rawIn_fractIn[3] ? 5'h13 :
    _result_1_self_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_26 = result_1_self_rec_rawIn_fractIn[4] ? 5'h12 :
    _result_1_self_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_27 = result_1_self_rec_rawIn_fractIn[5] ? 5'h11 :
    _result_1_self_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_28 = result_1_self_rec_rawIn_fractIn[6] ? 5'h10 :
    _result_1_self_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_29 = result_1_self_rec_rawIn_fractIn[7] ? 5'hf :
    _result_1_self_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_30 = result_1_self_rec_rawIn_fractIn[8] ? 5'he :
    _result_1_self_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_31 = result_1_self_rec_rawIn_fractIn[9] ? 5'hd :
    _result_1_self_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_32 = result_1_self_rec_rawIn_fractIn[10] ? 5'hc :
    _result_1_self_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_33 = result_1_self_rec_rawIn_fractIn[11] ? 5'hb :
    _result_1_self_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_34 = result_1_self_rec_rawIn_fractIn[12] ? 5'ha :
    _result_1_self_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_35 = result_1_self_rec_rawIn_fractIn[13] ? 5'h9 :
    _result_1_self_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_36 = result_1_self_rec_rawIn_fractIn[14] ? 5'h8 :
    _result_1_self_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_37 = result_1_self_rec_rawIn_fractIn[15] ? 5'h7 :
    _result_1_self_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_38 = result_1_self_rec_rawIn_fractIn[16] ? 5'h6 :
    _result_1_self_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_39 = result_1_self_rec_rawIn_fractIn[17] ? 5'h5 :
    _result_1_self_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_40 = result_1_self_rec_rawIn_fractIn[18] ? 5'h4 :
    _result_1_self_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_41 = result_1_self_rec_rawIn_fractIn[19] ? 5'h3 :
    _result_1_self_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_42 = result_1_self_rec_rawIn_fractIn[20] ? 5'h2 :
    _result_1_self_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [4:0] _result_1_self_rec_rawIn_normDist_T_43 = result_1_self_rec_rawIn_fractIn[21] ? 5'h1 :
    _result_1_self_rec_rawIn_normDist_T_42; // @[Mux.scala 47:70]
  wire [4:0] result_1_self_rec_rawIn_normDist = result_1_self_rec_rawIn_fractIn[22] ? 5'h0 :
    _result_1_self_rec_rawIn_normDist_T_43; // @[Mux.scala 47:70]
  wire [53:0] _GEN_16 = {{31'd0}, result_1_self_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [53:0] _result_1_self_rec_rawIn_subnormFract_T = _GEN_16 << result_1_self_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [22:0] result_1_self_rec_rawIn_subnormFract = {_result_1_self_rec_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_30 = {{4'd0}, result_1_self_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _result_1_self_rec_rawIn_adjustedExp_T = _GEN_30 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _result_1_self_rec_rawIn_adjustedExp_T_1 = result_1_self_rec_rawIn_isZeroExpIn ?
    _result_1_self_rec_rawIn_adjustedExp_T : {{1'd0}, result_1_self_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _result_1_self_rec_rawIn_adjustedExp_T_2 = result_1_self_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_31 = {{6'd0}, _result_1_self_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _result_1_self_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_31; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_32 = {{1'd0}, _result_1_self_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] result_1_self_rec_rawIn_adjustedExp = _result_1_self_rec_rawIn_adjustedExp_T_1 + _GEN_32; // @[rawFloatFromFN.scala 57:9]
  wire  result_1_self_rec_rawIn_isZero = result_1_self_rec_rawIn_isZeroExpIn & result_1_self_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  result_1_self_rec_rawIn_isSpecial = result_1_self_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  result_1_self_rec_rawIn__isNaN = result_1_self_rec_rawIn_isSpecial & ~result_1_self_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] result_1_self_rec_rawIn__sExp = {1'b0,$signed(result_1_self_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _result_1_self_rec_rawIn_out_sig_T = ~result_1_self_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [22:0] _result_1_self_rec_rawIn_out_sig_T_2 = result_1_self_rec_rawIn_isZeroExpIn ?
    result_1_self_rec_rawIn_subnormFract : result_1_self_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [24:0] result_1_self_rec_rawIn__sig = {1'h0,_result_1_self_rec_rawIn_out_sig_T,
    _result_1_self_rec_rawIn_out_sig_T_2}; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _result_1_self_rec_T_1 = result_1_self_rec_rawIn_isZero ? 3'h0 : result_1_self_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_33 = {{2'd0}, result_1_self_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _result_1_self_rec_T_3 = _result_1_self_rec_T_1 | _GEN_33; // @[recFNFromFN.scala 48:76]
  wire [9:0] _result_1_self_rec_T_6 = {result_1_self_rec_rawIn_sign,_result_1_self_rec_T_3,result_1_self_rec_rawIn__sExp
    [5:0]}; // @[recFNFromFN.scala 49:45]
  wire [8:0] result_1_result_bits_rawIn_exp = result_1_muladder_io_out[31:23]; // @[rawFloatFromRecFN.scala 51:21]
  wire  result_1_result_bits_rawIn_isZero = result_1_result_bits_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  result_1_result_bits_rawIn_isSpecial = result_1_result_bits_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  result_1_result_bits_rawIn__isNaN = result_1_result_bits_rawIn_isSpecial & result_1_result_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  result_1_result_bits_rawIn__isInf = result_1_result_bits_rawIn_isSpecial & ~result_1_result_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  wire  result_1_result_bits_rawIn__sign = result_1_muladder_io_out[32]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] result_1_result_bits_rawIn__sExp = {1'b0,$signed(result_1_result_bits_rawIn_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _result_1_result_bits_rawIn_out_sig_T = ~result_1_result_bits_rawIn_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [24:0] result_1_result_bits_rawIn__sig = {1'h0,_result_1_result_bits_rawIn_out_sig_T,result_1_muladder_io_out[22:
    0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire  result_1_result_bits_isSubnormal = $signed(result_1_result_bits_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 51:38]
  wire [4:0] result_1_result_bits_denormShiftDist = 5'h1 - result_1_result_bits_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 52:35]
  wire [23:0] _result_1_result_bits_denormFract_T_1 = result_1_result_bits_rawIn__sig[24:1] >>
    result_1_result_bits_denormShiftDist; // @[fNFromRecFN.scala 53:42]
  wire [22:0] result_1_result_bits_denormFract = _result_1_result_bits_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 53:60]
  wire [7:0] _result_1_result_bits_expOut_T_2 = result_1_result_bits_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 58:45]
  wire [7:0] _result_1_result_bits_expOut_T_3 = result_1_result_bits_isSubnormal ? 8'h0 :
    _result_1_result_bits_expOut_T_2; // @[fNFromRecFN.scala 56:16]
  wire  _result_1_result_bits_expOut_T_4 = result_1_result_bits_rawIn__isNaN | result_1_result_bits_rawIn__isInf; // @[fNFromRecFN.scala 60:44]
  wire [7:0] _result_1_result_bits_expOut_T_6 = _result_1_result_bits_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] result_1_result_bits_expOut = _result_1_result_bits_expOut_T_3 | _result_1_result_bits_expOut_T_6; // @[fNFromRecFN.scala 60:15]
  wire [22:0] _result_1_result_bits_fractOut_T_1 = result_1_result_bits_rawIn__isInf ? 23'h0 :
    result_1_result_bits_rawIn__sig[22:0]; // @[fNFromRecFN.scala 64:20]
  wire [22:0] result_1_result_bits_fractOut = result_1_result_bits_isSubnormal ? result_1_result_bits_denormFract :
    _result_1_result_bits_fractOut_T_1; // @[fNFromRecFN.scala 62:16]
  wire [31:0] result_1_result_bits = {result_1_result_bits_rawIn__sign,result_1_result_bits_expOut,
    result_1_result_bits_fractOut}; // @[Cat.scala 33:92]
  wire [31:0] _count_T_1 = count + 32'h1; // @[MAccDFE.scala 91:20]
  wire  io_outData_0_bits_t_rec_rawIn_sign = result_1_bits[31]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] io_outData_0_bits_t_rec_rawIn_expIn = result_1_bits[30:23]; // @[rawFloatFromFN.scala 45:19]
  wire [22:0] io_outData_0_bits_t_rec_rawIn_fractIn = result_1_bits[22:0]; // @[rawFloatFromFN.scala 46:21]
  wire  io_outData_0_bits_t_rec_rawIn_isZeroExpIn = io_outData_0_bits_t_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  io_outData_0_bits_t_rec_rawIn_isZeroFractIn = io_outData_0_bits_t_rec_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_23 = io_outData_0_bits_t_rec_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_24 = io_outData_0_bits_t_rec_rawIn_fractIn[2] ? 5'h14 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_25 = io_outData_0_bits_t_rec_rawIn_fractIn[3] ? 5'h13 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_26 = io_outData_0_bits_t_rec_rawIn_fractIn[4] ? 5'h12 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_27 = io_outData_0_bits_t_rec_rawIn_fractIn[5] ? 5'h11 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_28 = io_outData_0_bits_t_rec_rawIn_fractIn[6] ? 5'h10 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_29 = io_outData_0_bits_t_rec_rawIn_fractIn[7] ? 5'hf :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_30 = io_outData_0_bits_t_rec_rawIn_fractIn[8] ? 5'he :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_31 = io_outData_0_bits_t_rec_rawIn_fractIn[9] ? 5'hd :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_32 = io_outData_0_bits_t_rec_rawIn_fractIn[10] ? 5'hc :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_33 = io_outData_0_bits_t_rec_rawIn_fractIn[11] ? 5'hb :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_34 = io_outData_0_bits_t_rec_rawIn_fractIn[12] ? 5'ha :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_35 = io_outData_0_bits_t_rec_rawIn_fractIn[13] ? 5'h9 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_36 = io_outData_0_bits_t_rec_rawIn_fractIn[14] ? 5'h8 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_37 = io_outData_0_bits_t_rec_rawIn_fractIn[15] ? 5'h7 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_38 = io_outData_0_bits_t_rec_rawIn_fractIn[16] ? 5'h6 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_39 = io_outData_0_bits_t_rec_rawIn_fractIn[17] ? 5'h5 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_40 = io_outData_0_bits_t_rec_rawIn_fractIn[18] ? 5'h4 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_41 = io_outData_0_bits_t_rec_rawIn_fractIn[19] ? 5'h3 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_42 = io_outData_0_bits_t_rec_rawIn_fractIn[20] ? 5'h2 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [4:0] _io_outData_0_bits_t_rec_rawIn_normDist_T_43 = io_outData_0_bits_t_rec_rawIn_fractIn[21] ? 5'h1 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_42; // @[Mux.scala 47:70]
  wire [4:0] io_outData_0_bits_t_rec_rawIn_normDist = io_outData_0_bits_t_rec_rawIn_fractIn[22] ? 5'h0 :
    _io_outData_0_bits_t_rec_rawIn_normDist_T_43; // @[Mux.scala 47:70]
  wire [53:0] _GEN_17 = {{31'd0}, io_outData_0_bits_t_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [53:0] _io_outData_0_bits_t_rec_rawIn_subnormFract_T = _GEN_17 << io_outData_0_bits_t_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [22:0] io_outData_0_bits_t_rec_rawIn_subnormFract = {_io_outData_0_bits_t_rec_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_34 = {{4'd0}, io_outData_0_bits_t_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _io_outData_0_bits_t_rec_rawIn_adjustedExp_T = _GEN_34 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _io_outData_0_bits_t_rec_rawIn_adjustedExp_T_1 = io_outData_0_bits_t_rec_rawIn_isZeroExpIn ?
    _io_outData_0_bits_t_rec_rawIn_adjustedExp_T : {{1'd0}, io_outData_0_bits_t_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _io_outData_0_bits_t_rec_rawIn_adjustedExp_T_2 = io_outData_0_bits_t_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_35 = {{6'd0}, _io_outData_0_bits_t_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _io_outData_0_bits_t_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_35; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_36 = {{1'd0}, _io_outData_0_bits_t_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] io_outData_0_bits_t_rec_rawIn_adjustedExp = _io_outData_0_bits_t_rec_rawIn_adjustedExp_T_1 + _GEN_36; // @[rawFloatFromFN.scala 57:9]
  wire  io_outData_0_bits_t_rec_rawIn_isZero = io_outData_0_bits_t_rec_rawIn_isZeroExpIn &
    io_outData_0_bits_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  io_outData_0_bits_t_rec_rawIn_isSpecial = io_outData_0_bits_t_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  io_outData_0_bits_t_rec_rawIn__isNaN = io_outData_0_bits_t_rec_rawIn_isSpecial & ~
    io_outData_0_bits_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] io_outData_0_bits_t_rec_rawIn__sExp = {1'b0,$signed(io_outData_0_bits_t_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _io_outData_0_bits_t_rec_rawIn_out_sig_T = ~io_outData_0_bits_t_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [22:0] _io_outData_0_bits_t_rec_rawIn_out_sig_T_2 = io_outData_0_bits_t_rec_rawIn_isZeroExpIn ?
    io_outData_0_bits_t_rec_rawIn_subnormFract : io_outData_0_bits_t_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [24:0] io_outData_0_bits_t_rec_rawIn__sig = {1'h0,_io_outData_0_bits_t_rec_rawIn_out_sig_T,
    _io_outData_0_bits_t_rec_rawIn_out_sig_T_2}; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _io_outData_0_bits_t_rec_T_1 = io_outData_0_bits_t_rec_rawIn_isZero ? 3'h0 :
    io_outData_0_bits_t_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_37 = {{2'd0}, io_outData_0_bits_t_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _io_outData_0_bits_t_rec_T_3 = _io_outData_0_bits_t_rec_T_1 | _GEN_37; // @[recFNFromFN.scala 48:76]
  wire [9:0] _io_outData_0_bits_t_rec_T_6 = {io_outData_0_bits_t_rec_rawIn_sign,_io_outData_0_bits_t_rec_T_3,
    io_outData_0_bits_t_rec_rawIn__sExp[5:0]}; // @[recFNFromFN.scala 49:45]
  wire [8:0] io_outData_0_bits_result_bits_rawIn_exp = io_outData_0_bits_muladder_io_out[31:23]; // @[rawFloatFromRecFN.scala 51:21]
  wire  io_outData_0_bits_result_bits_rawIn_isZero = io_outData_0_bits_result_bits_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  io_outData_0_bits_result_bits_rawIn_isSpecial = io_outData_0_bits_result_bits_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  io_outData_0_bits_result_bits_rawIn__isNaN = io_outData_0_bits_result_bits_rawIn_isSpecial &
    io_outData_0_bits_result_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  io_outData_0_bits_result_bits_rawIn__isInf = io_outData_0_bits_result_bits_rawIn_isSpecial & ~
    io_outData_0_bits_result_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  wire  io_outData_0_bits_result_bits_rawIn__sign = io_outData_0_bits_muladder_io_out[32]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] io_outData_0_bits_result_bits_rawIn__sExp = {1'b0,$signed(io_outData_0_bits_result_bits_rawIn_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _io_outData_0_bits_result_bits_rawIn_out_sig_T = ~io_outData_0_bits_result_bits_rawIn_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [24:0] io_outData_0_bits_result_bits_rawIn__sig = {1'h0,_io_outData_0_bits_result_bits_rawIn_out_sig_T,
    io_outData_0_bits_muladder_io_out[22:0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire  io_outData_0_bits_result_bits_isSubnormal = $signed(io_outData_0_bits_result_bits_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 51:38]
  wire [4:0] io_outData_0_bits_result_bits_denormShiftDist = 5'h1 - io_outData_0_bits_result_bits_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 52:35]
  wire [23:0] _io_outData_0_bits_result_bits_denormFract_T_1 = io_outData_0_bits_result_bits_rawIn__sig[24:1] >>
    io_outData_0_bits_result_bits_denormShiftDist; // @[fNFromRecFN.scala 53:42]
  wire [22:0] io_outData_0_bits_result_bits_denormFract = _io_outData_0_bits_result_bits_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 53:60]
  wire [7:0] _io_outData_0_bits_result_bits_expOut_T_2 = io_outData_0_bits_result_bits_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 58:45]
  wire [7:0] _io_outData_0_bits_result_bits_expOut_T_3 = io_outData_0_bits_result_bits_isSubnormal ? 8'h0 :
    _io_outData_0_bits_result_bits_expOut_T_2; // @[fNFromRecFN.scala 56:16]
  wire  _io_outData_0_bits_result_bits_expOut_T_4 = io_outData_0_bits_result_bits_rawIn__isNaN |
    io_outData_0_bits_result_bits_rawIn__isInf; // @[fNFromRecFN.scala 60:44]
  wire [7:0] _io_outData_0_bits_result_bits_expOut_T_6 = _io_outData_0_bits_result_bits_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] io_outData_0_bits_result_bits_expOut = _io_outData_0_bits_result_bits_expOut_T_3 |
    _io_outData_0_bits_result_bits_expOut_T_6; // @[fNFromRecFN.scala 60:15]
  wire [22:0] _io_outData_0_bits_result_bits_fractOut_T_1 = io_outData_0_bits_result_bits_rawIn__isInf ? 23'h0 :
    io_outData_0_bits_result_bits_rawIn__sig[22:0]; // @[fNFromRecFN.scala 64:20]
  wire [22:0] io_outData_0_bits_result_bits_fractOut = io_outData_0_bits_result_bits_isSubnormal ?
    io_outData_0_bits_result_bits_denormFract : _io_outData_0_bits_result_bits_fractOut_T_1; // @[fNFromRecFN.scala 62:16]
  wire [31:0] io_outData_0_bits_result_bits = {io_outData_0_bits_result_bits_rawIn__sign,
    io_outData_0_bits_result_bits_expOut,io_outData_0_bits_result_bits_fractOut}; // @[Cat.scala 33:92]
  RecFNToRecFN multReg_t_resizer ( // @[Arithmetic.scala 220:32]
    .io_in(multReg_t_resizer_io_in),
    .io_out(multReg_t_resizer_io_out)
  );
  MulAddRecFN multReg_muladder ( // @[Arithmetic.scala 226:30]
    .io_a(multReg_muladder_io_a),
    .io_b(multReg_muladder_io_b),
    .io_c(multReg_muladder_io_c),
    .io_out(multReg_muladder_io_out)
  );
  Queue_15 accQueue ( // @[MAccDFE.scala 53:24]
    .clock(accQueue_clock),
    .reset(accQueue_reset),
    .io_enq_ready(accQueue_io_enq_ready),
    .io_enq_valid(accQueue_io_enq_valid),
    .io_enq_bits(accQueue_io_enq_bits),
    .io_deq_ready(accQueue_io_deq_ready),
    .io_deq_valid(accQueue_io_deq_valid),
    .io_deq_bits(accQueue_io_deq_bits)
  );
  INToRecFN result_1_in_to_rec_fn ( // @[Arithmetic.scala 286:34]
    .io_out(result_1_in_to_rec_fn_io_out)
  );
  RecFNToRecFN result_1_t_resizer ( // @[Arithmetic.scala 295:31]
    .io_in(result_1_t_resizer_io_in),
    .io_out(result_1_t_resizer_io_out)
  );
  MulAddRecFN result_1_muladder ( // @[Arithmetic.scala 302:30]
    .io_a(result_1_muladder_io_a),
    .io_b(result_1_muladder_io_b),
    .io_c(result_1_muladder_io_c),
    .io_out(result_1_muladder_io_out)
  );
  INToRecFN io_outData_0_bits_in_to_rec_fn ( // @[Arithmetic.scala 286:34]
    .io_out(io_outData_0_bits_in_to_rec_fn_io_out)
  );
  RecFNToRecFN io_outData_0_bits_t_resizer ( // @[Arithmetic.scala 295:31]
    .io_in(io_outData_0_bits_t_resizer_io_in),
    .io_out(io_outData_0_bits_t_resizer_io_out)
  );
  MulAddRecFN io_outData_0_bits_muladder ( // @[Arithmetic.scala 302:30]
    .io_a(io_outData_0_bits_muladder_io_a),
    .io_b(io_outData_0_bits_muladder_io_b),
    .io_c(io_outData_0_bits_muladder_io_c),
    .io_out(io_outData_0_bits_muladder_io_out)
  );
  assign io_inData_0_ready = multWire_ready | ~multValid; // @[MAccDFE.scala 30:23]
  assign io_inData_1_ready = multWire_ready | ~multValid; // @[MAccDFE.scala 30:23]
  assign io_outData_0_valid = _lastIter_T_1 & state != 2'h0; // @[MAccDFE.scala 113:27]
  assign io_outData_0_bits_bits = _lastIter_T_1 & state != 2'h0 ? io_outData_0_bits_result_bits : 32'h0; // @[MAccDFE.scala 113:51 115:24 118:24]
  assign ctrl_io_resetCounter_ready = accQueue_io_enq_ready; // @[MAccDFE.scala 60:19]
  assign ctrl_io_idle = state == 2'h0 & ~accQueue_io_deq_valid & accNum == count; // @[MAccDFE.scala 58:65]
  assign multReg_t_resizer_io_in = {_multReg_t_rec_T_6,multReg_t_rec_rawIn__sig[22:0]}; // @[recFNFromFN.scala 50:41]
  assign multReg_muladder_io_a = {_multReg_self_rec_T_6,multReg_self_rec_rawIn__sig[22:0]}; // @[recFNFromFN.scala 50:41]
  assign multReg_muladder_io_b = multReg_t_resizer_io_out; // @[Arithmetic.scala 233:23]
  assign multReg_muladder_io_c = 33'h0; // @[Arithmetic.scala 234:23]
  assign accQueue_clock = clock;
  assign accQueue_reset = reset;
  assign accQueue_io_enq_valid = ctrl_io_resetCounter_valid; // @[MAccDFE.scala 60:19]
  assign accQueue_io_enq_bits = ctrl_io_resetCounter_bits; // @[MAccDFE.scala 60:19]
  assign accQueue_io_deq_ready = state == 2'h0; // @[MAccDFE.scala 65:14]
  assign result_1_t_resizer_io_in = {_result_1_t_rec_T_6,result_1_t_rec_rawIn__sig[22:0]}; // @[recFNFromFN.scala 50:41]
  assign result_1_muladder_io_a = result_1_t_resizer_io_out; // @[Arithmetic.scala 308:23]
  assign result_1_muladder_io_b = result_1_in_to_rec_fn_io_out; // @[Arithmetic.scala 309:23]
  assign result_1_muladder_io_c = {_result_1_self_rec_T_6,result_1_self_rec_rawIn__sig[22:0]}; // @[recFNFromFN.scala 50:41]
  assign io_outData_0_bits_t_resizer_io_in = {_io_outData_0_bits_t_rec_T_6,io_outData_0_bits_t_rec_rawIn__sig[22:0]}; // @[recFNFromFN.scala 50:41]
  assign io_outData_0_bits_muladder_io_a = io_outData_0_bits_t_resizer_io_out; // @[Arithmetic.scala 308:23]
  assign io_outData_0_bits_muladder_io_b = io_outData_0_bits_in_to_rec_fn_io_out; // @[Arithmetic.scala 309:23]
  assign io_outData_0_bits_muladder_io_c = {_result_1_t_rec_T_6,result_1_t_rec_rawIn__sig[22:0]}; // @[recFNFromFN.scala 50:41]
  always @(posedge clock) begin
    if (reset) begin // @[MAccDFE.scala 21:24]
      multReg_bits <= 32'h0; // @[MAccDFE.scala 21:24]
    end else if (io_inData_0_ready & io_inData_1_ready & io_inData_0_valid & io_inData_1_valid) begin // @[MAccDFE.scala 24:93]
      multReg_bits <= multReg_out_bits; // @[MAccDFE.scala 25:13]
    end
    if (reset) begin // @[MAccDFE.scala 22:26]
      multValid <= 1'h0; // @[MAccDFE.scala 22:26]
    end else begin
      multValid <= _GEN_3;
    end
    if (reset) begin // @[MAccDFE.scala 56:22]
      state <= 2'h0; // @[MAccDFE.scala 56:22]
    end else if (io_outData_0_valid & io_outData_0_ready | _T_9 & accNum == 32'h0) begin // @[MAccDFE.scala 109:101]
      state <= 2'h0; // @[MAccDFE.scala 110:11]
    end else if (accQueue_io_deq_valid & accQueue_io_deq_ready) begin // @[MAccDFE.scala 100:56]
      state <= 2'h2; // @[MAccDFE.scala 105:11]
    end else if (multValid & multWire_ready) begin // @[MAccDFE.scala 87:83]
      state <= 2'h1; // @[MAccDFE.scala 92:11]
    end
    if (reset) begin // @[MAccDFE.scala 52:22]
      count <= 32'h0; // @[MAccDFE.scala 52:22]
    end else if (accQueue_io_deq_valid & accQueue_io_deq_ready) begin // @[MAccDFE.scala 100:56]
      count <= 32'h0; // @[MAccDFE.scala 102:11]
    end else if (multValid & multWire_ready) begin // @[MAccDFE.scala 87:83]
      count <= _count_T_1; // @[MAccDFE.scala 91:11]
    end
    if (reset) begin // @[MAccDFE.scala 54:23]
      accNum <= 32'h0; // @[MAccDFE.scala 54:23]
    end else if (accQueue_io_deq_valid & accQueue_io_deq_ready) begin // @[MAccDFE.scala 100:56]
      accNum <= accQueue_io_deq_bits; // @[MAccDFE.scala 101:12]
    end
    if (reset) begin // @[MAccDFE.scala 50:25]
      result_0_bits <= 32'h0; // @[MAccDFE.scala 50:25]
    end else if (accQueue_io_deq_valid & accQueue_io_deq_ready) begin // @[MAccDFE.scala 100:56]
      result_0_bits <= 32'h0; // @[MAccDFE.scala 103:14]
    end else if (multValid & multWire_ready) begin // @[MAccDFE.scala 87:83]
      result_0_bits <= result_1_bits; // @[MAccDFE.scala 90:14]
    end
    if (reset) begin // @[MAccDFE.scala 51:25]
      result_1_bits <= 32'h0; // @[MAccDFE.scala 51:25]
    end else if (accQueue_io_deq_valid & accQueue_io_deq_ready) begin // @[MAccDFE.scala 100:56]
      result_1_bits <= 32'h0; // @[MAccDFE.scala 104:14]
    end else if (multValid & multWire_ready) begin // @[MAccDFE.scala 87:83]
      result_1_bits <= result_1_result_bits; // @[MAccDFE.scala 89:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  multReg_bits = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  multValid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  count = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  accNum = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  result_0_bits = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  result_1_bits = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_16(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:1]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SpMVPE(
  input         clock,
  input         reset,
  output        io_idle,
  input         df_io_memQueuesIO_outgoingReq_0_ready,
  output        df_io_memQueuesIO_outgoingReq_0_valid,
  output [14:0] df_io_memQueuesIO_outgoingReq_0_bits_addr,
  output [31:0] df_io_memQueuesIO_outgoingReq_0_bits_dataIn,
  input         df_io_memQueuesIO_outgoingReq_1_ready,
  output        df_io_memQueuesIO_outgoingReq_1_valid,
  output [14:0] df_io_memQueuesIO_outgoingReq_1_bits_addr,
  input         df_io_memQueuesIO_outgoingReq_2_ready,
  output        df_io_memQueuesIO_outgoingReq_2_valid,
  output [14:0] df_io_memQueuesIO_outgoingReq_2_bits_addr,
  input         df_io_memQueuesIO_outgoingReq_3_ready,
  output        df_io_memQueuesIO_outgoingReq_3_valid,
  output [14:0] df_io_memQueuesIO_outgoingReq_3_bits_addr,
  input         df_io_memQueuesIO_outgoingReq_4_ready,
  output        df_io_memQueuesIO_outgoingReq_4_valid,
  output [14:0] df_io_memQueuesIO_outgoingReq_4_bits_addr,
  input         df_io_memQueuesIO_inReadData_0_valid,
  input  [31:0] df_io_memQueuesIO_inReadData_0_bits,
  input         df_io_memQueuesIO_inReadData_1_valid,
  input  [31:0] df_io_memQueuesIO_inReadData_1_bits,
  input         df_io_memQueuesIO_inReadData_2_valid,
  input  [31:0] df_io_memQueuesIO_inReadData_2_bits,
  input         df_io_memQueuesIO_inReadData_3_valid,
  input  [31:0] df_io_memQueuesIO_inReadData_3_bits,
  output        df_io_memQueuesIO_readQueuesEnqReady_0,
  output        df_io_memQueuesIO_readQueuesEnqReady_1,
  output        df_io_memQueuesIO_readQueuesEnqReady_2,
  output        df_io_memQueuesIO_readQueuesEnqReady_3,
  input  [14:0] addr_gen_ctrl_io_in_A,
  input  [14:0] addr_gen_ctrl_io_in_col_idx,
  input  [14:0] addr_gen_ctrl_io_in_row_ptr,
  input  [14:0] addr_gen_ctrl_io_in_y_addr,
  input  [14:0] addr_gen_ctrl_io_in_nrows,
  input  [14:0] addr_gen_ctrl_io_in_row_start,
  input  [14:0] addr_gen_ctrl_io_in_xlen_pow2,
  input         addr_gen_ctrl_io_reset_setup
);
  wire  memReadQueues_0_clock; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_0_reset; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_0_io_enq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_0_io_enq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_0_io_enq_bits; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_0_io_deq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_0_io_deq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_0_io_deq_bits; // @[DataflowPE.scala 63:32]
  wire [10:0] memReadQueues_0_io_count; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_1_clock; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_1_reset; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_1_io_enq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_1_io_enq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_1_io_enq_bits; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_1_io_deq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_1_io_deq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_1_io_deq_bits; // @[DataflowPE.scala 63:32]
  wire [10:0] memReadQueues_1_io_count; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_2_clock; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_2_reset; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_2_io_enq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_2_io_enq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_2_io_enq_bits; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_2_io_deq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_2_io_deq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_2_io_deq_bits; // @[DataflowPE.scala 63:32]
  wire [10:0] memReadQueues_2_io_count; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_3_clock; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_3_reset; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_3_io_enq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_3_io_enq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_3_io_enq_bits; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_3_io_deq_ready; // @[DataflowPE.scala 63:32]
  wire  memReadQueues_3_io_deq_valid; // @[DataflowPE.scala 63:32]
  wire [31:0] memReadQueues_3_io_deq_bits; // @[DataflowPE.scala 63:32]
  wire [10:0] memReadQueues_3_io_count; // @[DataflowPE.scala 63:32]
  wire  pe_addr_gen_clock; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_reset; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_0_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_0_valid; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_mem_io_addressRequests_0_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_1_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_1_valid; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_mem_io_addressRequests_1_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_2_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_2_valid; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_mem_io_addressRequests_2_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_3_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_addressRequests_3_valid; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_mem_io_addressRequests_3_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_0_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_0_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_mem_io_dataResponses_0_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_1_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_1_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_mem_io_dataResponses_1_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_2_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_2_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_mem_io_dataResponses_2_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_3_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_dataResponses_3_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_mem_io_dataResponses_3_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_writeRequests_0_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_writeRequests_0_valid; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_mem_io_writeRequests_0_bits_address; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_mem_io_writeRequests_0_bits_data; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_mem_io_generatingRequests; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_a_vals_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_a_vals_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_ctrl_io_a_vals_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_x_vals_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_x_vals_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_ctrl_io_x_vals_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_y_vals_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_y_vals_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_ctrl_io_y_vals_bits; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_row_elem_left_ready; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_ctrl_io_row_elem_left_valid; // @[SpMVPE.scala 21:27]
  wire [31:0] pe_addr_gen_ctrl_io_row_elem_left_bits; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_A; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_col_idx; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_row_ptr; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_y_addr; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_nrows; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_row_start; // @[SpMVPE.scala 21:27]
  wire [14:0] pe_addr_gen_pe_ctrl_io_in_xlen_pow2; // @[SpMVPE.scala 21:27]
  wire  pe_addr_gen_pe_ctrl_io_reset_setup; // @[SpMVPE.scala 21:27]
  wire  pe_dfe_clock; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_reset; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_io_inData_0_ready; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_io_inData_0_valid; // @[SpMVPE.scala 23:22]
  wire [31:0] pe_dfe_io_inData_0_bits_bits; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_io_inData_1_ready; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_io_inData_1_valid; // @[SpMVPE.scala 23:22]
  wire [31:0] pe_dfe_io_inData_1_bits_bits; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_io_outData_0_ready; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_io_outData_0_valid; // @[SpMVPE.scala 23:22]
  wire [31:0] pe_dfe_io_outData_0_bits_bits; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_ctrl_io_resetCounter_ready; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_ctrl_io_resetCounter_valid; // @[SpMVPE.scala 23:22]
  wire [31:0] pe_dfe_ctrl_io_resetCounter_bits; // @[SpMVPE.scala 23:22]
  wire  pe_dfe_ctrl_io_idle; // @[SpMVPE.scala 23:22]
  wire  inQueue_0_clock; // @[SpMVAddressGenerator.scala 302:31]
  wire  inQueue_0_reset; // @[SpMVAddressGenerator.scala 302:31]
  wire  inQueue_0_io_enq_ready; // @[SpMVAddressGenerator.scala 302:31]
  wire  inQueue_0_io_enq_valid; // @[SpMVAddressGenerator.scala 302:31]
  wire [31:0] inQueue_0_io_enq_bits; // @[SpMVAddressGenerator.scala 302:31]
  wire  inQueue_0_io_deq_ready; // @[SpMVAddressGenerator.scala 302:31]
  wire  inQueue_0_io_deq_valid; // @[SpMVAddressGenerator.scala 302:31]
  wire [31:0] inQueue_0_io_deq_bits; // @[SpMVAddressGenerator.scala 302:31]
  wire  inQueue_1_clock; // @[SpMVAddressGenerator.scala 303:31]
  wire  inQueue_1_reset; // @[SpMVAddressGenerator.scala 303:31]
  wire  inQueue_1_io_enq_ready; // @[SpMVAddressGenerator.scala 303:31]
  wire  inQueue_1_io_enq_valid; // @[SpMVAddressGenerator.scala 303:31]
  wire [31:0] inQueue_1_io_enq_bits; // @[SpMVAddressGenerator.scala 303:31]
  wire  inQueue_1_io_deq_ready; // @[SpMVAddressGenerator.scala 303:31]
  wire  inQueue_1_io_deq_valid; // @[SpMVAddressGenerator.scala 303:31]
  wire [31:0] inQueue_1_io_deq_bits; // @[SpMVAddressGenerator.scala 303:31]
  wire  outQueue_clock; // @[SpMVAddressGenerator.scala 304:30]
  wire  outQueue_reset; // @[SpMVAddressGenerator.scala 304:30]
  wire  outQueue_io_enq_ready; // @[SpMVAddressGenerator.scala 304:30]
  wire  outQueue_io_enq_valid; // @[SpMVAddressGenerator.scala 304:30]
  wire [31:0] outQueue_io_enq_bits; // @[SpMVAddressGenerator.scala 304:30]
  wire  outQueue_io_deq_ready; // @[SpMVAddressGenerator.scala 304:30]
  wire  outQueue_io_deq_valid; // @[SpMVAddressGenerator.scala 304:30]
  wire [31:0] outQueue_io_deq_bits; // @[SpMVAddressGenerator.scala 304:30]
  wire [10:0] _df_io_memQueuesIO_readQueuesEnqReady_0_T_1 = 11'h400 - 11'h1; // @[DataflowPE.scala 69:85]
  Queue_11 memReadQueues_0 ( // @[DataflowPE.scala 63:32]
    .clock(memReadQueues_0_clock),
    .reset(memReadQueues_0_reset),
    .io_enq_ready(memReadQueues_0_io_enq_ready),
    .io_enq_valid(memReadQueues_0_io_enq_valid),
    .io_enq_bits(memReadQueues_0_io_enq_bits),
    .io_deq_ready(memReadQueues_0_io_deq_ready),
    .io_deq_valid(memReadQueues_0_io_deq_valid),
    .io_deq_bits(memReadQueues_0_io_deq_bits),
    .io_count(memReadQueues_0_io_count)
  );
  Queue_11 memReadQueues_1 ( // @[DataflowPE.scala 63:32]
    .clock(memReadQueues_1_clock),
    .reset(memReadQueues_1_reset),
    .io_enq_ready(memReadQueues_1_io_enq_ready),
    .io_enq_valid(memReadQueues_1_io_enq_valid),
    .io_enq_bits(memReadQueues_1_io_enq_bits),
    .io_deq_ready(memReadQueues_1_io_deq_ready),
    .io_deq_valid(memReadQueues_1_io_deq_valid),
    .io_deq_bits(memReadQueues_1_io_deq_bits),
    .io_count(memReadQueues_1_io_count)
  );
  Queue_11 memReadQueues_2 ( // @[DataflowPE.scala 63:32]
    .clock(memReadQueues_2_clock),
    .reset(memReadQueues_2_reset),
    .io_enq_ready(memReadQueues_2_io_enq_ready),
    .io_enq_valid(memReadQueues_2_io_enq_valid),
    .io_enq_bits(memReadQueues_2_io_enq_bits),
    .io_deq_ready(memReadQueues_2_io_deq_ready),
    .io_deq_valid(memReadQueues_2_io_deq_valid),
    .io_deq_bits(memReadQueues_2_io_deq_bits),
    .io_count(memReadQueues_2_io_count)
  );
  Queue_11 memReadQueues_3 ( // @[DataflowPE.scala 63:32]
    .clock(memReadQueues_3_clock),
    .reset(memReadQueues_3_reset),
    .io_enq_ready(memReadQueues_3_io_enq_ready),
    .io_enq_valid(memReadQueues_3_io_enq_valid),
    .io_enq_bits(memReadQueues_3_io_enq_bits),
    .io_deq_ready(memReadQueues_3_io_deq_ready),
    .io_deq_valid(memReadQueues_3_io_deq_valid),
    .io_deq_bits(memReadQueues_3_io_deq_bits),
    .io_count(memReadQueues_3_io_count)
  );
  SpMVAddressGenerator pe_addr_gen ( // @[SpMVPE.scala 21:27]
    .clock(pe_addr_gen_clock),
    .reset(pe_addr_gen_reset),
    .mem_io_addressRequests_0_ready(pe_addr_gen_mem_io_addressRequests_0_ready),
    .mem_io_addressRequests_0_valid(pe_addr_gen_mem_io_addressRequests_0_valid),
    .mem_io_addressRequests_0_bits(pe_addr_gen_mem_io_addressRequests_0_bits),
    .mem_io_addressRequests_1_ready(pe_addr_gen_mem_io_addressRequests_1_ready),
    .mem_io_addressRequests_1_valid(pe_addr_gen_mem_io_addressRequests_1_valid),
    .mem_io_addressRequests_1_bits(pe_addr_gen_mem_io_addressRequests_1_bits),
    .mem_io_addressRequests_2_ready(pe_addr_gen_mem_io_addressRequests_2_ready),
    .mem_io_addressRequests_2_valid(pe_addr_gen_mem_io_addressRequests_2_valid),
    .mem_io_addressRequests_2_bits(pe_addr_gen_mem_io_addressRequests_2_bits),
    .mem_io_addressRequests_3_ready(pe_addr_gen_mem_io_addressRequests_3_ready),
    .mem_io_addressRequests_3_valid(pe_addr_gen_mem_io_addressRequests_3_valid),
    .mem_io_addressRequests_3_bits(pe_addr_gen_mem_io_addressRequests_3_bits),
    .mem_io_dataResponses_0_ready(pe_addr_gen_mem_io_dataResponses_0_ready),
    .mem_io_dataResponses_0_valid(pe_addr_gen_mem_io_dataResponses_0_valid),
    .mem_io_dataResponses_0_bits(pe_addr_gen_mem_io_dataResponses_0_bits),
    .mem_io_dataResponses_1_ready(pe_addr_gen_mem_io_dataResponses_1_ready),
    .mem_io_dataResponses_1_valid(pe_addr_gen_mem_io_dataResponses_1_valid),
    .mem_io_dataResponses_1_bits(pe_addr_gen_mem_io_dataResponses_1_bits),
    .mem_io_dataResponses_2_ready(pe_addr_gen_mem_io_dataResponses_2_ready),
    .mem_io_dataResponses_2_valid(pe_addr_gen_mem_io_dataResponses_2_valid),
    .mem_io_dataResponses_2_bits(pe_addr_gen_mem_io_dataResponses_2_bits),
    .mem_io_dataResponses_3_ready(pe_addr_gen_mem_io_dataResponses_3_ready),
    .mem_io_dataResponses_3_valid(pe_addr_gen_mem_io_dataResponses_3_valid),
    .mem_io_dataResponses_3_bits(pe_addr_gen_mem_io_dataResponses_3_bits),
    .mem_io_writeRequests_0_ready(pe_addr_gen_mem_io_writeRequests_0_ready),
    .mem_io_writeRequests_0_valid(pe_addr_gen_mem_io_writeRequests_0_valid),
    .mem_io_writeRequests_0_bits_address(pe_addr_gen_mem_io_writeRequests_0_bits_address),
    .mem_io_writeRequests_0_bits_data(pe_addr_gen_mem_io_writeRequests_0_bits_data),
    .mem_io_generatingRequests(pe_addr_gen_mem_io_generatingRequests),
    .ctrl_io_a_vals_ready(pe_addr_gen_ctrl_io_a_vals_ready),
    .ctrl_io_a_vals_valid(pe_addr_gen_ctrl_io_a_vals_valid),
    .ctrl_io_a_vals_bits(pe_addr_gen_ctrl_io_a_vals_bits),
    .ctrl_io_x_vals_ready(pe_addr_gen_ctrl_io_x_vals_ready),
    .ctrl_io_x_vals_valid(pe_addr_gen_ctrl_io_x_vals_valid),
    .ctrl_io_x_vals_bits(pe_addr_gen_ctrl_io_x_vals_bits),
    .ctrl_io_y_vals_ready(pe_addr_gen_ctrl_io_y_vals_ready),
    .ctrl_io_y_vals_valid(pe_addr_gen_ctrl_io_y_vals_valid),
    .ctrl_io_y_vals_bits(pe_addr_gen_ctrl_io_y_vals_bits),
    .ctrl_io_row_elem_left_ready(pe_addr_gen_ctrl_io_row_elem_left_ready),
    .ctrl_io_row_elem_left_valid(pe_addr_gen_ctrl_io_row_elem_left_valid),
    .ctrl_io_row_elem_left_bits(pe_addr_gen_ctrl_io_row_elem_left_bits),
    .pe_ctrl_io_in_A(pe_addr_gen_pe_ctrl_io_in_A),
    .pe_ctrl_io_in_col_idx(pe_addr_gen_pe_ctrl_io_in_col_idx),
    .pe_ctrl_io_in_row_ptr(pe_addr_gen_pe_ctrl_io_in_row_ptr),
    .pe_ctrl_io_in_y_addr(pe_addr_gen_pe_ctrl_io_in_y_addr),
    .pe_ctrl_io_in_nrows(pe_addr_gen_pe_ctrl_io_in_nrows),
    .pe_ctrl_io_in_row_start(pe_addr_gen_pe_ctrl_io_in_row_start),
    .pe_ctrl_io_in_xlen_pow2(pe_addr_gen_pe_ctrl_io_in_xlen_pow2),
    .pe_ctrl_io_reset_setup(pe_addr_gen_pe_ctrl_io_reset_setup)
  );
  FloatMultAccEngine pe_dfe ( // @[SpMVPE.scala 23:22]
    .clock(pe_dfe_clock),
    .reset(pe_dfe_reset),
    .io_inData_0_ready(pe_dfe_io_inData_0_ready),
    .io_inData_0_valid(pe_dfe_io_inData_0_valid),
    .io_inData_0_bits_bits(pe_dfe_io_inData_0_bits_bits),
    .io_inData_1_ready(pe_dfe_io_inData_1_ready),
    .io_inData_1_valid(pe_dfe_io_inData_1_valid),
    .io_inData_1_bits_bits(pe_dfe_io_inData_1_bits_bits),
    .io_outData_0_ready(pe_dfe_io_outData_0_ready),
    .io_outData_0_valid(pe_dfe_io_outData_0_valid),
    .io_outData_0_bits_bits(pe_dfe_io_outData_0_bits_bits),
    .ctrl_io_resetCounter_ready(pe_dfe_ctrl_io_resetCounter_ready),
    .ctrl_io_resetCounter_valid(pe_dfe_ctrl_io_resetCounter_valid),
    .ctrl_io_resetCounter_bits(pe_dfe_ctrl_io_resetCounter_bits),
    .ctrl_io_idle(pe_dfe_ctrl_io_idle)
  );
  Queue_16 inQueue_0 ( // @[SpMVAddressGenerator.scala 302:31]
    .clock(inQueue_0_clock),
    .reset(inQueue_0_reset),
    .io_enq_ready(inQueue_0_io_enq_ready),
    .io_enq_valid(inQueue_0_io_enq_valid),
    .io_enq_bits(inQueue_0_io_enq_bits),
    .io_deq_ready(inQueue_0_io_deq_ready),
    .io_deq_valid(inQueue_0_io_deq_valid),
    .io_deq_bits(inQueue_0_io_deq_bits)
  );
  Queue_16 inQueue_1 ( // @[SpMVAddressGenerator.scala 303:31]
    .clock(inQueue_1_clock),
    .reset(inQueue_1_reset),
    .io_enq_ready(inQueue_1_io_enq_ready),
    .io_enq_valid(inQueue_1_io_enq_valid),
    .io_enq_bits(inQueue_1_io_enq_bits),
    .io_deq_ready(inQueue_1_io_deq_ready),
    .io_deq_valid(inQueue_1_io_deq_valid),
    .io_deq_bits(inQueue_1_io_deq_bits)
  );
  Queue_16 outQueue ( // @[SpMVAddressGenerator.scala 304:30]
    .clock(outQueue_clock),
    .reset(outQueue_reset),
    .io_enq_ready(outQueue_io_enq_ready),
    .io_enq_valid(outQueue_io_enq_valid),
    .io_enq_bits(outQueue_io_enq_bits),
    .io_deq_ready(outQueue_io_deq_ready),
    .io_deq_valid(outQueue_io_deq_valid),
    .io_deq_bits(outQueue_io_deq_bits)
  );
  assign io_idle = ~pe_addr_gen_mem_io_generatingRequests & pe_dfe_ctrl_io_idle; // @[SpMVPE.scala 31:53]
  assign df_io_memQueuesIO_outgoingReq_0_valid = pe_addr_gen_mem_io_writeRequests_0_valid; // @[DataflowPE.scala 79:52]
  assign df_io_memQueuesIO_outgoingReq_0_bits_addr = pe_addr_gen_mem_io_writeRequests_0_bits_address; // @[DataflowPE.scala 77:56]
  assign df_io_memQueuesIO_outgoingReq_0_bits_dataIn = pe_addr_gen_mem_io_writeRequests_0_bits_data; // @[DataflowPE.scala 78:58]
  assign df_io_memQueuesIO_outgoingReq_1_valid = pe_addr_gen_mem_io_addressRequests_0_valid; // @[DataflowPE.scala 79:52]
  assign df_io_memQueuesIO_outgoingReq_1_bits_addr = pe_addr_gen_mem_io_addressRequests_0_bits; // @[DataflowPE.scala 77:56]
  assign df_io_memQueuesIO_outgoingReq_2_valid = pe_addr_gen_mem_io_addressRequests_1_valid; // @[DataflowPE.scala 79:52]
  assign df_io_memQueuesIO_outgoingReq_2_bits_addr = pe_addr_gen_mem_io_addressRequests_1_bits; // @[DataflowPE.scala 77:56]
  assign df_io_memQueuesIO_outgoingReq_3_valid = pe_addr_gen_mem_io_addressRequests_2_valid; // @[DataflowPE.scala 79:52]
  assign df_io_memQueuesIO_outgoingReq_3_bits_addr = pe_addr_gen_mem_io_addressRequests_2_bits; // @[DataflowPE.scala 77:56]
  assign df_io_memQueuesIO_outgoingReq_4_valid = pe_addr_gen_mem_io_addressRequests_3_valid; // @[DataflowPE.scala 79:52]
  assign df_io_memQueuesIO_outgoingReq_4_bits_addr = pe_addr_gen_mem_io_addressRequests_3_bits; // @[DataflowPE.scala 77:56]
  assign df_io_memQueuesIO_readQueuesEnqReady_0 = memReadQueues_0_io_count < _df_io_memQueuesIO_readQueuesEnqReady_0_T_1
    ; // @[DataflowPE.scala 69:64]
  assign df_io_memQueuesIO_readQueuesEnqReady_1 = memReadQueues_1_io_count < _df_io_memQueuesIO_readQueuesEnqReady_0_T_1
    ; // @[DataflowPE.scala 69:64]
  assign df_io_memQueuesIO_readQueuesEnqReady_2 = memReadQueues_2_io_count < _df_io_memQueuesIO_readQueuesEnqReady_0_T_1
    ; // @[DataflowPE.scala 69:64]
  assign df_io_memQueuesIO_readQueuesEnqReady_3 = memReadQueues_3_io_count < _df_io_memQueuesIO_readQueuesEnqReady_0_T_1
    ; // @[DataflowPE.scala 69:64]
  assign memReadQueues_0_clock = clock;
  assign memReadQueues_0_reset = reset;
  assign memReadQueues_0_io_enq_valid = df_io_memQueuesIO_inReadData_0_valid; // @[DataflowPE.scala 68:25]
  assign memReadQueues_0_io_enq_bits = df_io_memQueuesIO_inReadData_0_bits; // @[DataflowPE.scala 67:24]
  assign memReadQueues_0_io_deq_ready = pe_addr_gen_mem_io_dataResponses_0_ready; // @[DataflowPE.scala 85:43]
  assign memReadQueues_1_clock = clock;
  assign memReadQueues_1_reset = reset;
  assign memReadQueues_1_io_enq_valid = df_io_memQueuesIO_inReadData_1_valid; // @[DataflowPE.scala 68:25]
  assign memReadQueues_1_io_enq_bits = df_io_memQueuesIO_inReadData_1_bits; // @[DataflowPE.scala 67:24]
  assign memReadQueues_1_io_deq_ready = pe_addr_gen_mem_io_dataResponses_1_ready; // @[DataflowPE.scala 85:43]
  assign memReadQueues_2_clock = clock;
  assign memReadQueues_2_reset = reset;
  assign memReadQueues_2_io_enq_valid = df_io_memQueuesIO_inReadData_2_valid; // @[DataflowPE.scala 68:25]
  assign memReadQueues_2_io_enq_bits = df_io_memQueuesIO_inReadData_2_bits; // @[DataflowPE.scala 67:24]
  assign memReadQueues_2_io_deq_ready = pe_addr_gen_mem_io_dataResponses_2_ready; // @[DataflowPE.scala 85:43]
  assign memReadQueues_3_clock = clock;
  assign memReadQueues_3_reset = reset;
  assign memReadQueues_3_io_enq_valid = df_io_memQueuesIO_inReadData_3_valid; // @[DataflowPE.scala 68:25]
  assign memReadQueues_3_io_enq_bits = df_io_memQueuesIO_inReadData_3_bits; // @[DataflowPE.scala 67:24]
  assign memReadQueues_3_io_deq_ready = pe_addr_gen_mem_io_dataResponses_3_ready; // @[DataflowPE.scala 85:43]
  assign pe_addr_gen_clock = clock;
  assign pe_addr_gen_reset = reset;
  assign pe_addr_gen_mem_io_addressRequests_0_ready = df_io_memQueuesIO_outgoingReq_1_ready; // @[DataflowPE.scala 80:11]
  assign pe_addr_gen_mem_io_addressRequests_1_ready = df_io_memQueuesIO_outgoingReq_2_ready; // @[DataflowPE.scala 80:11]
  assign pe_addr_gen_mem_io_addressRequests_2_ready = df_io_memQueuesIO_outgoingReq_3_ready; // @[DataflowPE.scala 80:11]
  assign pe_addr_gen_mem_io_addressRequests_3_ready = df_io_memQueuesIO_outgoingReq_4_ready; // @[DataflowPE.scala 80:11]
  assign pe_addr_gen_mem_io_dataResponses_0_valid = memReadQueues_0_io_deq_valid; // @[DataflowPE.scala 84:11]
  assign pe_addr_gen_mem_io_dataResponses_0_bits = memReadQueues_0_io_deq_bits; // @[DataflowPE.scala 83:10]
  assign pe_addr_gen_mem_io_dataResponses_1_valid = memReadQueues_1_io_deq_valid; // @[DataflowPE.scala 84:11]
  assign pe_addr_gen_mem_io_dataResponses_1_bits = memReadQueues_1_io_deq_bits; // @[DataflowPE.scala 83:10]
  assign pe_addr_gen_mem_io_dataResponses_2_valid = memReadQueues_2_io_deq_valid; // @[DataflowPE.scala 84:11]
  assign pe_addr_gen_mem_io_dataResponses_2_bits = memReadQueues_2_io_deq_bits; // @[DataflowPE.scala 83:10]
  assign pe_addr_gen_mem_io_dataResponses_3_valid = memReadQueues_3_io_deq_valid; // @[DataflowPE.scala 84:11]
  assign pe_addr_gen_mem_io_dataResponses_3_bits = memReadQueues_3_io_deq_bits; // @[DataflowPE.scala 83:10]
  assign pe_addr_gen_mem_io_writeRequests_0_ready = df_io_memQueuesIO_outgoingReq_0_ready; // @[DataflowPE.scala 80:11]
  assign pe_addr_gen_ctrl_io_a_vals_ready = inQueue_1_io_enq_ready; // @[SpMVAddressGenerator.scala 322:42]
  assign pe_addr_gen_ctrl_io_x_vals_ready = inQueue_0_io_enq_ready; // @[SpMVAddressGenerator.scala 313:42]
  assign pe_addr_gen_ctrl_io_y_vals_valid = outQueue_io_deq_valid; // @[SpMVAddressGenerator.scala 330:42]
  assign pe_addr_gen_ctrl_io_y_vals_bits = outQueue_io_deq_bits; // @[SpMVAddressGenerator.scala 329:41]
  assign pe_addr_gen_ctrl_io_row_elem_left_ready = pe_dfe_ctrl_io_resetCounter_ready; // @[SpMVAddressGenerator.scala 336:49]
  assign pe_addr_gen_pe_ctrl_io_in_A = addr_gen_ctrl_io_in_A; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_in_col_idx = addr_gen_ctrl_io_in_col_idx; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_in_row_ptr = addr_gen_ctrl_io_in_row_ptr; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_in_y_addr = addr_gen_ctrl_io_in_y_addr; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_in_nrows = addr_gen_ctrl_io_in_nrows; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_in_row_start = addr_gen_ctrl_io_in_row_start; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_in_xlen_pow2 = addr_gen_ctrl_io_in_xlen_pow2; // @[DataflowPE.scala 144:22]
  assign pe_addr_gen_pe_ctrl_io_reset_setup = addr_gen_ctrl_io_reset_setup; // @[DataflowPE.scala 144:22]
  assign pe_dfe_clock = clock;
  assign pe_dfe_reset = reset;
  assign pe_dfe_io_inData_0_valid = inQueue_0_io_deq_valid; // @[SpMVAddressGenerator.scala 308:35]
  assign pe_dfe_io_inData_0_bits_bits = inQueue_0_io_deq_bits; // @[SpMVAddressGenerator.scala 307:39]
  assign pe_dfe_io_inData_1_valid = inQueue_1_io_deq_valid; // @[SpMVAddressGenerator.scala 317:35]
  assign pe_dfe_io_inData_1_bits_bits = inQueue_1_io_deq_bits; // @[SpMVAddressGenerator.scala 316:39]
  assign pe_dfe_io_outData_0_ready = outQueue_io_enq_ready; // @[SpMVAddressGenerator.scala 327:36]
  assign pe_dfe_ctrl_io_resetCounter_valid = pe_addr_gen_ctrl_io_row_elem_left_valid; // @[SpMVAddressGenerator.scala 335:43]
  assign pe_dfe_ctrl_io_resetCounter_bits = pe_addr_gen_ctrl_io_row_elem_left_bits; // @[SpMVAddressGenerator.scala 334:42]
  assign inQueue_0_clock = clock;
  assign inQueue_0_reset = reset;
  assign inQueue_0_io_enq_valid = pe_addr_gen_ctrl_io_x_vals_valid; // @[SpMVAddressGenerator.scala 312:32]
  assign inQueue_0_io_enq_bits = pe_addr_gen_ctrl_io_x_vals_bits; // @[SpMVAddressGenerator.scala 311:31]
  assign inQueue_0_io_deq_ready = pe_dfe_io_inData_0_ready; // @[SpMVAddressGenerator.scala 309:32]
  assign inQueue_1_clock = clock;
  assign inQueue_1_reset = reset;
  assign inQueue_1_io_enq_valid = pe_addr_gen_ctrl_io_a_vals_valid; // @[SpMVAddressGenerator.scala 321:32]
  assign inQueue_1_io_enq_bits = pe_addr_gen_ctrl_io_a_vals_bits; // @[SpMVAddressGenerator.scala 320:31]
  assign inQueue_1_io_deq_ready = pe_dfe_io_inData_1_ready; // @[SpMVAddressGenerator.scala 318:32]
  assign outQueue_clock = clock;
  assign outQueue_reset = reset;
  assign outQueue_io_enq_valid = pe_dfe_io_outData_0_valid; // @[SpMVAddressGenerator.scala 326:31]
  assign outQueue_io_enq_bits = pe_dfe_io_outData_0_bits_bits; // @[SpMVAddressGenerator.scala 325:30]
  assign outQueue_io_deq_ready = pe_addr_gen_ctrl_io_y_vals_ready; // @[SpMVAddressGenerator.scala 331:31]
endmodule
module Queue_27(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [6:0]  io_enq_bits_inst_funct,
  input  [6:0]  io_enq_bits_inst_opcode,
  input  [31:0] io_enq_bits_rs1,
  input  [31:0] io_enq_bits_rs2,
  input         io_deq_ready,
  output        io_deq_valid,
  output [6:0]  io_deq_bits_inst_funct,
  output [6:0]  io_deq_bits_inst_opcode,
  output [31:0] io_deq_bits_rs1,
  output [31:0] io_deq_bits_rs2
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] ram_inst_funct [0:1]; // @[Decoupled.scala 275:95]
  wire  ram_inst_funct_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_inst_funct_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [6:0] ram_inst_funct_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_inst_funct_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_inst_funct_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_inst_funct_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_inst_funct_MPORT_en; // @[Decoupled.scala 275:95]
  reg [6:0] ram_inst_opcode [0:1]; // @[Decoupled.scala 275:95]
  wire  ram_inst_opcode_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_inst_opcode_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [6:0] ram_inst_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_inst_opcode_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_inst_opcode_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_inst_opcode_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_inst_opcode_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_rs1 [0:1]; // @[Decoupled.scala 275:95]
  wire  ram_rs1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_rs1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_rs1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_rs1_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_rs1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_rs1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_rs1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_rs2 [0:1]; // @[Decoupled.scala 275:95]
  wire  ram_rs2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_rs2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_rs2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_rs2_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_rs2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_rs2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_rs2_MPORT_en; // @[Decoupled.scala 275:95]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_inst_funct_io_deq_bits_MPORT_en = 1'h1;
  assign ram_inst_funct_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_inst_funct_io_deq_bits_MPORT_data = ram_inst_funct[ram_inst_funct_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_inst_funct_MPORT_data = io_enq_bits_inst_funct;
  assign ram_inst_funct_MPORT_addr = enq_ptr_value;
  assign ram_inst_funct_MPORT_mask = 1'h1;
  assign ram_inst_funct_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_inst_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_inst_opcode_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_inst_opcode_io_deq_bits_MPORT_data = ram_inst_opcode[ram_inst_opcode_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_inst_opcode_MPORT_data = io_enq_bits_inst_opcode;
  assign ram_inst_opcode_MPORT_addr = enq_ptr_value;
  assign ram_inst_opcode_MPORT_mask = 1'h1;
  assign ram_inst_opcode_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_rs1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rs1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rs1_io_deq_bits_MPORT_data = ram_rs1[ram_rs1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_rs1_MPORT_data = io_enq_bits_rs1;
  assign ram_rs1_MPORT_addr = enq_ptr_value;
  assign ram_rs1_MPORT_mask = 1'h1;
  assign ram_rs1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_rs2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rs2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rs2_io_deq_bits_MPORT_data = ram_rs2[ram_rs2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_rs2_MPORT_data = io_enq_bits_rs2;
  assign ram_rs2_MPORT_addr = enq_ptr_value;
  assign ram_rs2_MPORT_mask = 1'h1;
  assign ram_rs2_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_inst_funct = ram_inst_funct_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_inst_opcode = ram_inst_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_rs1 = ram_rs1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_rs2 = ram_rs2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_inst_funct_MPORT_en & ram_inst_funct_MPORT_mask) begin
      ram_inst_funct[ram_inst_funct_MPORT_addr] <= ram_inst_funct_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_inst_opcode_MPORT_en & ram_inst_opcode_MPORT_mask) begin
      ram_inst_opcode[ram_inst_opcode_MPORT_addr] <= ram_inst_opcode_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_rs1_MPORT_en & ram_rs1_MPORT_mask) begin
      ram_rs1[ram_rs1_MPORT_addr] <= ram_rs1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_rs2_MPORT_en & ram_rs2_MPORT_mask) begin
      ram_rs2[ram_rs2_MPORT_addr] <= ram_rs2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_inst_funct[initvar] = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_inst_opcode[initvar] = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_rs1[initvar] = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_rs2[initvar] = _RAND_3[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  enq_ptr_value = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  deq_ptr_value = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  maybe_full = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_28(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_resp_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_resp_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_resp_data [0:1]; // @[Decoupled.scala 275:95]
  wire  ram_resp_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_resp_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_resp_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_resp_data_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_resp_data_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_resp_data_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_resp_data_MPORT_en; // @[Decoupled.scala 275:95]
  reg  enq_ptr_value; // @[Counter.scala 61:40]
  reg  deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_resp_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_data_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_resp_data_io_deq_bits_MPORT_data = ram_resp_data[ram_resp_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_resp_data_MPORT_data = io_enq_bits_resp_data;
  assign ram_resp_data_MPORT_addr = enq_ptr_value;
  assign ram_resp_data_MPORT_mask = 1'h1;
  assign ram_resp_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_resp_data = ram_resp_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_resp_data_MPORT_en & ram_resp_data_MPORT_mask) begin
      ram_resp_data[ram_resp_data_MPORT_addr] <= ram_resp_data_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_resp_data[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SpMVController(
  input         clock,
  input         reset,
  output        io_rocc_cmd_cmd_rdy,
  input         io_rocc_cmd_cmd_valid,
  input  [6:0]  io_rocc_cmd_cmd_inst_funct,
  input  [6:0]  io_rocc_cmd_cmd_inst_opcode,
  input  [31:0] io_rocc_cmd_cmd_rs1,
  input  [31:0] io_rocc_cmd_cmd_rs2,
  output [31:0] io_rocc_cmd_resp_data,
  input         io_rocc_cmd_resp_rdy,
  output        io_rocc_cmd_resp_valid,
  output        io_rocc_cmd_busy,
  output [15:0] pe_regs_0_in_A,
  output [15:0] pe_regs_0_in_col_idx,
  output [15:0] pe_regs_0_in_row_ptr,
  output [15:0] pe_regs_0_in_y_addr,
  output [15:0] pe_regs_0_in_nrows,
  output [15:0] pe_regs_0_in_row_start,
  output [15:0] pe_regs_0_in_xlen_pow2,
  output        pe_regs_0_reset_setup,
  output [15:0] pe_regs_1_in_A,
  output [15:0] pe_regs_1_in_col_idx,
  output [15:0] pe_regs_1_in_row_ptr,
  output [15:0] pe_regs_1_in_y_addr,
  output [15:0] pe_regs_1_in_nrows,
  output [15:0] pe_regs_1_in_row_start,
  output [15:0] pe_regs_1_in_xlen_pow2,
  output        pe_regs_1_reset_setup,
  input         pe_ctrl_0_idle,
  input         pe_ctrl_1_idle,
  input         mem_io_request_ready,
  output        mem_io_request_valid,
  output        mem_io_request_bits_write,
  output [14:0] mem_io_request_bits_addr,
  output [31:0] mem_io_request_bits_dataIn,
  output        mem_io_response_ready,
  input         mem_io_response_valid,
  input  [31:0] mem_io_response_bits,
  input         mem_io_busy
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [14:0] config_reg [0:15]; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_A_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_A_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_A_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_col_idx_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_col_idx_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_col_idx_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_x_addr_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_x_addr_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_x_addr_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_row_ptr_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_row_ptr_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_row_ptr_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_nrows_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_nrows_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_nrows_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_xlen_pow2_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_xlen_pow2_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_xlen_pow2_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_y_addr_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_y_addr_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_y_addr_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_0_in_row_start_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_0_in_row_start_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_0_in_row_start_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_A_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_A_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_A_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_col_idx_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_col_idx_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_col_idx_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_x_addr_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_x_addr_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_x_addr_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_row_ptr_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_row_ptr_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_row_ptr_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_nrows_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_nrows_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_nrows_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_xlen_pow2_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_xlen_pow2_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_xlen_pow2_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_y_addr_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_y_addr_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_y_addr_MPORT_data; // @[SpMVController.scala 123:23]
  wire  config_reg_pe_regs_1_in_row_start_MPORT_en; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_pe_regs_1_in_row_start_MPORT_addr; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_pe_regs_1_in_row_start_MPORT_data; // @[SpMVController.scala 123:23]
  wire [14:0] config_reg_MPORT_data; // @[SpMVController.scala 123:23]
  wire [3:0] config_reg_MPORT_addr; // @[SpMVController.scala 123:23]
  wire  config_reg_MPORT_mask; // @[SpMVController.scala 123:23]
  wire  config_reg_MPORT_en; // @[SpMVController.scala 123:23]
  wire  cmd_queue_clock; // @[SpMVController.scala 125:25]
  wire  cmd_queue_reset; // @[SpMVController.scala 125:25]
  wire  cmd_queue_io_enq_ready; // @[SpMVController.scala 125:25]
  wire  cmd_queue_io_enq_valid; // @[SpMVController.scala 125:25]
  wire [6:0] cmd_queue_io_enq_bits_inst_funct; // @[SpMVController.scala 125:25]
  wire [6:0] cmd_queue_io_enq_bits_inst_opcode; // @[SpMVController.scala 125:25]
  wire [31:0] cmd_queue_io_enq_bits_rs1; // @[SpMVController.scala 125:25]
  wire [31:0] cmd_queue_io_enq_bits_rs2; // @[SpMVController.scala 125:25]
  wire  cmd_queue_io_deq_ready; // @[SpMVController.scala 125:25]
  wire  cmd_queue_io_deq_valid; // @[SpMVController.scala 125:25]
  wire [6:0] cmd_queue_io_deq_bits_inst_funct; // @[SpMVController.scala 125:25]
  wire [6:0] cmd_queue_io_deq_bits_inst_opcode; // @[SpMVController.scala 125:25]
  wire [31:0] cmd_queue_io_deq_bits_rs1; // @[SpMVController.scala 125:25]
  wire [31:0] cmd_queue_io_deq_bits_rs2; // @[SpMVController.scala 125:25]
  wire  resp_queue_clock; // @[SpMVController.scala 126:26]
  wire  resp_queue_reset; // @[SpMVController.scala 126:26]
  wire  resp_queue_io_enq_ready; // @[SpMVController.scala 126:26]
  wire  resp_queue_io_enq_valid; // @[SpMVController.scala 126:26]
  wire [31:0] resp_queue_io_enq_bits_resp_data; // @[SpMVController.scala 126:26]
  wire  resp_queue_io_deq_ready; // @[SpMVController.scala 126:26]
  wire  resp_queue_io_deq_valid; // @[SpMVController.scala 126:26]
  wire [31:0] resp_queue_io_deq_bits_resp_data; // @[SpMVController.scala 126:26]
  reg  reset_setup_reg; // @[SpMVController.scala 127:28]
  reg  exe_inflight_reg; // @[SpMVController.scala 128:33]
  reg [12:0] last_opcode; // @[SpMVController.scala 129:28]
  reg [63:0] iteration_count; // @[SpMVController.scala 130:32]
  wire [63:0] _iteration_count_T_1 = iteration_count + 64'h1; // @[SpMVController.scala 134:40]
  wire  pe_busy = ~(pe_ctrl_0_idle & pe_ctrl_1_idle) | mem_io_busy; // @[SpMVController.scala 143:55]
  wire  _T = ~exe_inflight_reg; // @[SpMVController.scala 149:34]
  reg  REG; // @[SpMVController.scala 156:27]
  wire  _GEN_2 = ~pe_busy & REG ? 1'h0 : exe_inflight_reg; // @[SpMVController.scala 156:46 157:22 128:33]
  wire  _T_6 = io_rocc_cmd_cmd_inst_opcode != 7'h5b; // @[SpMVController.scala 172:36]
  wire  _T_7 = io_rocc_cmd_cmd_inst_opcode != 7'h2b & _T_6; // @[SpMVController.scala 171:66]
  wire  cmd_fire = cmd_queue_io_deq_ready & cmd_queue_io_deq_valid; // @[SpMVController.scala 179:41]
  wire  _T_9 = cmd_queue_io_deq_bits_inst_opcode == 7'h7b; // @[SpMVController.scala 181:43]
  wire  _GEN_16 = cmd_queue_io_deq_bits_inst_opcode == 7'h7b & cmd_fire | _GEN_2; // @[SpMVController.scala 181:81 183:22]
  reg [31:0] resp_reg; // @[SpMVController.scala 189:21]
  reg  resp_no_mem_valid; // @[SpMVController.scala 191:30]
  wire  _T_11 = cmd_queue_io_deq_bits_inst_opcode == 7'hb; // @[SpMVController.scala 195:54]
  wire [34:0] _T_13 = {cmd_queue_io_deq_bits_rs2, 3'h0}; // @[SpMVController.scala 196:84]
  wire [34:0] _GEN_55 = {{28'd0}, cmd_queue_io_deq_bits_inst_funct}; // @[SpMVController.scala 196:55]
  wire [34:0] _T_14 = _GEN_55 | _T_13; // @[SpMVController.scala 196:55]
  wire  _T_17 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b; // @[SpMVController.scala 209:23]
  wire  _T_19 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h5b; // @[SpMVController.scala 219:23]
  wire  _T_26 = ~cmd_fire & last_opcode == 13'h7b & _T; // @[SpMVController.scala 241:66]
  wire [63:0] _GEN_19 = ~cmd_fire & last_opcode == 13'h7b & _T ? iteration_count : 64'h2; // @[SpMVController.scala 241:88 247:14 258:14]
  wire [12:0] _GEN_21 = ~cmd_fire & last_opcode == 13'h7b & _T ? 13'h0 : last_opcode; // @[SpMVController.scala 241:88 249:17 260:17]
  wire [63:0] _GEN_23 = cmd_fire & _T_9 ? 64'hb : _GEN_19; // @[SpMVController.scala 230:88 236:14]
  wire  _GEN_24 = cmd_fire & _T_9 ? 1'h0 : _T_26; // @[SpMVController.scala 230:88 237:23]
  wire [12:0] _GEN_25 = cmd_fire & _T_9 ? 13'h7b : _GEN_21; // @[SpMVController.scala 230:88 238:17]
  wire [31:0] _GEN_27 = cmd_queue_io_deq_bits_rs1; // @[SpMVController.scala 219:92 222:30]
  wire [63:0] _GEN_30 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h5b ? 64'ha : _GEN_23; // @[SpMVController.scala 219:92 226:14]
  wire  _GEN_31 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h5b ? 1'h0 : _GEN_24; // @[SpMVController.scala 219:92 227:23]
  wire [31:0] _GEN_34 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b ? cmd_queue_io_deq_bits_rs1 : _GEN_27; // @[SpMVController.scala 209:92 211:30]
  wire  _GEN_36 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b | _T_19; // @[SpMVController.scala 209:92 213:26]
  wire [63:0] _GEN_37 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b ? 64'h3 : _GEN_30; // @[SpMVController.scala 209:92 215:14]
  wire  _GEN_38 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b | _GEN_31; // @[SpMVController.scala 209:92 216:23]
  wire [63:0] _GEN_49 = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'hb ? 64'h4 : _GEN_37; // @[SpMVController.scala 195:81 204:14]
  wire  _T_27 = mem_io_response_valid & mem_io_response_ready; // @[SpMVController.scala 264:30]
  Queue_27 cmd_queue ( // @[SpMVController.scala 125:25]
    .clock(cmd_queue_clock),
    .reset(cmd_queue_reset),
    .io_enq_ready(cmd_queue_io_enq_ready),
    .io_enq_valid(cmd_queue_io_enq_valid),
    .io_enq_bits_inst_funct(cmd_queue_io_enq_bits_inst_funct),
    .io_enq_bits_inst_opcode(cmd_queue_io_enq_bits_inst_opcode),
    .io_enq_bits_rs1(cmd_queue_io_enq_bits_rs1),
    .io_enq_bits_rs2(cmd_queue_io_enq_bits_rs2),
    .io_deq_ready(cmd_queue_io_deq_ready),
    .io_deq_valid(cmd_queue_io_deq_valid),
    .io_deq_bits_inst_funct(cmd_queue_io_deq_bits_inst_funct),
    .io_deq_bits_inst_opcode(cmd_queue_io_deq_bits_inst_opcode),
    .io_deq_bits_rs1(cmd_queue_io_deq_bits_rs1),
    .io_deq_bits_rs2(cmd_queue_io_deq_bits_rs2)
  );
  Queue_28 resp_queue ( // @[SpMVController.scala 126:26]
    .clock(resp_queue_clock),
    .reset(resp_queue_reset),
    .io_enq_ready(resp_queue_io_enq_ready),
    .io_enq_valid(resp_queue_io_enq_valid),
    .io_enq_bits_resp_data(resp_queue_io_enq_bits_resp_data),
    .io_deq_ready(resp_queue_io_deq_ready),
    .io_deq_valid(resp_queue_io_deq_valid),
    .io_deq_bits_resp_data(resp_queue_io_deq_bits_resp_data)
  );
  assign config_reg_pe_regs_0_in_A_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_A_MPORT_addr = 4'h0;
  assign config_reg_pe_regs_0_in_A_MPORT_data = config_reg[config_reg_pe_regs_0_in_A_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_col_idx_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_col_idx_MPORT_addr = 4'h1;
  assign config_reg_pe_regs_0_in_col_idx_MPORT_data = config_reg[config_reg_pe_regs_0_in_col_idx_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_x_addr_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_x_addr_MPORT_addr = 4'h2;
  assign config_reg_pe_regs_0_in_x_addr_MPORT_data = config_reg[config_reg_pe_regs_0_in_x_addr_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_row_ptr_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_row_ptr_MPORT_addr = 4'h3;
  assign config_reg_pe_regs_0_in_row_ptr_MPORT_data = config_reg[config_reg_pe_regs_0_in_row_ptr_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_nrows_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_nrows_MPORT_addr = 4'h4;
  assign config_reg_pe_regs_0_in_nrows_MPORT_data = config_reg[config_reg_pe_regs_0_in_nrows_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_xlen_pow2_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_xlen_pow2_MPORT_addr = 4'h5;
  assign config_reg_pe_regs_0_in_xlen_pow2_MPORT_data = config_reg[config_reg_pe_regs_0_in_xlen_pow2_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_y_addr_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_y_addr_MPORT_addr = 4'h6;
  assign config_reg_pe_regs_0_in_y_addr_MPORT_data = config_reg[config_reg_pe_regs_0_in_y_addr_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_0_in_row_start_MPORT_en = 1'h1;
  assign config_reg_pe_regs_0_in_row_start_MPORT_addr = 4'h7;
  assign config_reg_pe_regs_0_in_row_start_MPORT_data = config_reg[config_reg_pe_regs_0_in_row_start_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_A_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_A_MPORT_addr = 4'h8;
  assign config_reg_pe_regs_1_in_A_MPORT_data = config_reg[config_reg_pe_regs_1_in_A_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_col_idx_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_col_idx_MPORT_addr = 4'h9;
  assign config_reg_pe_regs_1_in_col_idx_MPORT_data = config_reg[config_reg_pe_regs_1_in_col_idx_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_x_addr_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_x_addr_MPORT_addr = 4'ha;
  assign config_reg_pe_regs_1_in_x_addr_MPORT_data = config_reg[config_reg_pe_regs_1_in_x_addr_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_row_ptr_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_row_ptr_MPORT_addr = 4'hb;
  assign config_reg_pe_regs_1_in_row_ptr_MPORT_data = config_reg[config_reg_pe_regs_1_in_row_ptr_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_nrows_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_nrows_MPORT_addr = 4'hc;
  assign config_reg_pe_regs_1_in_nrows_MPORT_data = config_reg[config_reg_pe_regs_1_in_nrows_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_xlen_pow2_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_xlen_pow2_MPORT_addr = 4'hd;
  assign config_reg_pe_regs_1_in_xlen_pow2_MPORT_data = config_reg[config_reg_pe_regs_1_in_xlen_pow2_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_y_addr_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_y_addr_MPORT_addr = 4'he;
  assign config_reg_pe_regs_1_in_y_addr_MPORT_data = config_reg[config_reg_pe_regs_1_in_y_addr_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_pe_regs_1_in_row_start_MPORT_en = 1'h1;
  assign config_reg_pe_regs_1_in_row_start_MPORT_addr = 4'hf;
  assign config_reg_pe_regs_1_in_row_start_MPORT_data = config_reg[config_reg_pe_regs_1_in_row_start_MPORT_addr]; // @[SpMVController.scala 123:23]
  assign config_reg_MPORT_data = _GEN_27[14:0];
  assign config_reg_MPORT_addr = _T_14[3:0];
  assign config_reg_MPORT_mask = 1'h1;
  assign config_reg_MPORT_en = cmd_fire & _T_11;
  assign io_rocc_cmd_cmd_rdy = cmd_queue_io_enq_ready & ~exe_inflight_reg; // @[SpMVController.scala 149:31]
  assign io_rocc_cmd_resp_data = resp_queue_io_deq_bits_resp_data; // @[SpMVController.scala 288:25]
  assign io_rocc_cmd_resp_valid = resp_queue_io_deq_valid; // @[SpMVController.scala 289:26]
  assign io_rocc_cmd_busy = pe_busy | exe_inflight_reg; // @[SpMVController.scala 144:31]
  assign pe_regs_0_in_A = {{1'd0}, config_reg_pe_regs_0_in_A_MPORT_data}; // @[SpMVController.scala 294:21]
  assign pe_regs_0_in_col_idx = {{1'd0}, config_reg_pe_regs_0_in_col_idx_MPORT_data}; // @[SpMVController.scala 295:27]
  assign pe_regs_0_in_row_ptr = {{1'd0}, config_reg_pe_regs_0_in_row_ptr_MPORT_data}; // @[SpMVController.scala 297:27]
  assign pe_regs_0_in_y_addr = {{1'd0}, config_reg_pe_regs_0_in_y_addr_MPORT_data}; // @[SpMVController.scala 300:26]
  assign pe_regs_0_in_nrows = {{1'd0}, config_reg_pe_regs_0_in_nrows_MPORT_data}; // @[SpMVController.scala 298:25]
  assign pe_regs_0_in_row_start = {{1'd0}, config_reg_pe_regs_0_in_row_start_MPORT_data}; // @[SpMVController.scala 301:29]
  assign pe_regs_0_in_xlen_pow2 = {{1'd0}, config_reg_pe_regs_0_in_xlen_pow2_MPORT_data}; // @[SpMVController.scala 299:29]
  assign pe_regs_0_reset_setup = reset_setup_reg; // @[SpMVController.scala 138:30]
  assign pe_regs_1_in_A = {{1'd0}, config_reg_pe_regs_1_in_A_MPORT_data}; // @[SpMVController.scala 294:21]
  assign pe_regs_1_in_col_idx = {{1'd0}, config_reg_pe_regs_1_in_col_idx_MPORT_data}; // @[SpMVController.scala 295:27]
  assign pe_regs_1_in_row_ptr = {{1'd0}, config_reg_pe_regs_1_in_row_ptr_MPORT_data}; // @[SpMVController.scala 297:27]
  assign pe_regs_1_in_y_addr = {{1'd0}, config_reg_pe_regs_1_in_y_addr_MPORT_data}; // @[SpMVController.scala 300:26]
  assign pe_regs_1_in_nrows = {{1'd0}, config_reg_pe_regs_1_in_nrows_MPORT_data}; // @[SpMVController.scala 298:25]
  assign pe_regs_1_in_row_start = {{1'd0}, config_reg_pe_regs_1_in_row_start_MPORT_data}; // @[SpMVController.scala 301:29]
  assign pe_regs_1_in_xlen_pow2 = {{1'd0}, config_reg_pe_regs_1_in_xlen_pow2_MPORT_data}; // @[SpMVController.scala 299:29]
  assign pe_regs_1_reset_setup = reset_setup_reg; // @[SpMVController.scala 138:30]
  assign mem_io_request_valid = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'hb ? 1'h0 : _GEN_36; // @[SpMVController.scala 195:81 201:26]
  assign mem_io_request_bits_write = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'hb ? 1'h0 : _T_17; // @[SpMVController.scala 195:81 198:31]
  assign mem_io_request_bits_addr = _GEN_34[14:0];
  assign mem_io_request_bits_dataIn = cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b ? cmd_queue_io_deq_bits_rs2
     : 32'h0; // @[SpMVController.scala 209:92 212:32]
  assign mem_io_response_ready = 1'h1; // @[SpMVController.scala 276:25]
  assign cmd_queue_clock = clock;
  assign cmd_queue_reset = reset;
  assign cmd_queue_io_enq_valid = io_rocc_cmd_cmd_rdy & io_rocc_cmd_cmd_valid; // @[SpMVController.scala 160:28]
  assign cmd_queue_io_enq_bits_inst_funct = io_rocc_cmd_cmd_inst_funct; // @[SpMVController.scala 160:54 161:26]
  assign cmd_queue_io_enq_bits_inst_opcode = io_rocc_cmd_cmd_inst_opcode; // @[SpMVController.scala 160:54 161:26]
  assign cmd_queue_io_enq_bits_rs1 = io_rocc_cmd_cmd_rs1; // @[SpMVController.scala 160:54 162:31]
  assign cmd_queue_io_enq_bits_rs2 = io_rocc_cmd_cmd_rs2; // @[SpMVController.scala 160:54 163:31]
  assign cmd_queue_io_deq_ready = _T_7 | mem_io_request_ready; // @[SpMVController.scala 172:66]
  assign resp_queue_clock = clock;
  assign resp_queue_reset = reset;
  assign resp_queue_io_enq_valid = (resp_no_mem_valid | _T_27) & resp_queue_io_enq_ready; // @[SpMVController.scala 279:80]
  assign resp_queue_io_enq_bits_resp_data = mem_io_response_valid & mem_io_response_ready ? mem_io_response_bits :
    resp_reg; // @[SpMVController.scala 264:56 265:14 267:14]
  assign resp_queue_io_deq_ready = io_rocc_cmd_resp_rdy; // @[SpMVController.scala 290:27]
  always @(posedge clock) begin
    if (config_reg_MPORT_en & config_reg_MPORT_mask) begin
      config_reg[config_reg_MPORT_addr] <= config_reg_MPORT_data; // @[SpMVController.scala 123:23]
    end
    reset_setup_reg <= cmd_queue_io_deq_bits_inst_opcode == 7'h7b & cmd_fire; // @[SpMVController.scala 181:69]
    if (reset) begin // @[SpMVController.scala 128:33]
      exe_inflight_reg <= 1'h0; // @[SpMVController.scala 128:33]
    end else begin
      exe_inflight_reg <= _GEN_16;
    end
    if (reset) begin // @[SpMVController.scala 129:28]
      last_opcode <= 13'h0; // @[SpMVController.scala 129:28]
    end else if (cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'hb) begin // @[SpMVController.scala 195:81]
      last_opcode <= 13'hb; // @[SpMVController.scala 206:17]
    end else if (cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h2b) begin // @[SpMVController.scala 209:92]
      last_opcode <= 13'h2b; // @[SpMVController.scala 217:17]
    end else if (cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'h5b) begin // @[SpMVController.scala 219:92]
      last_opcode <= 13'h5b; // @[SpMVController.scala 228:17]
    end else begin
      last_opcode <= _GEN_25;
    end
    if (reset) begin // @[SpMVController.scala 130:32]
      iteration_count <= 64'h0; // @[SpMVController.scala 130:32]
    end else if (cmd_queue_io_deq_bits_inst_opcode == 7'h7b & cmd_fire) begin // @[SpMVController.scala 181:81]
      iteration_count <= 64'h0; // @[SpMVController.scala 184:21]
    end else if (exe_inflight_reg) begin // @[SpMVController.scala 133:25]
      iteration_count <= _iteration_count_T_1; // @[SpMVController.scala 134:21]
    end
    REG <= exe_inflight_reg; // @[SpMVController.scala 156:27]
    resp_reg <= _GEN_49[31:0];
    resp_no_mem_valid <= cmd_fire & cmd_queue_io_deq_bits_inst_opcode == 7'hb | _GEN_38; // @[SpMVController.scala 195:81 205:23]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    config_reg[initvar] = _RAND_0[14:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reset_setup_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  exe_inflight_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  last_opcode = _RAND_3[12:0];
  _RAND_4 = {2{`RANDOM}};
  iteration_count = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  resp_reg = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  resp_no_mem_valid = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SpMVTemplate(
  input         clock,
  input         reset,
  output        ctrl_io_rocc_cmd_cmd_rdy,
  input         ctrl_io_rocc_cmd_cmd_valid,
  input  [6:0]  ctrl_io_rocc_cmd_cmd_inst_funct,
  input  [4:0]  ctrl_io_rocc_cmd_cmd_inst_rs2,
  input  [4:0]  ctrl_io_rocc_cmd_cmd_inst_rs1,
  input         ctrl_io_rocc_cmd_cmd_inst_xd,
  input         ctrl_io_rocc_cmd_cmd_inst_xs1,
  input         ctrl_io_rocc_cmd_cmd_inst_xs2,
  input  [4:0]  ctrl_io_rocc_cmd_cmd_inst_rd,
  input  [6:0]  ctrl_io_rocc_cmd_cmd_inst_opcode,
  input  [31:0] ctrl_io_rocc_cmd_cmd_rs1,
  input  [31:0] ctrl_io_rocc_cmd_cmd_rs2,
  output [31:0] ctrl_io_rocc_cmd_resp_data,
  input         ctrl_io_rocc_cmd_resp_rdy,
  output        ctrl_io_rocc_cmd_resp_valid,
  output        ctrl_io_rocc_cmd_busy,
  output        ctrl_io_rocc_cmd_interrupt
);
  wire  mem_0_clock; // @[SpMVTemplate.scala 44:13]
  wire  mem_0_io_enable_1; // @[SpMVTemplate.scala 44:13]
  wire  mem_0_io_write_1; // @[SpMVTemplate.scala 44:13]
  wire [13:0] mem_0_io_addr_1; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_0_io_dataIn_1; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_0_io_dataOut_1; // @[SpMVTemplate.scala 44:13]
  wire  mem_0_io_enable_2; // @[SpMVTemplate.scala 44:13]
  wire  mem_0_io_write_2; // @[SpMVTemplate.scala 44:13]
  wire [13:0] mem_0_io_addr_2; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_0_io_dataIn_2; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_0_io_dataOut_2; // @[SpMVTemplate.scala 44:13]
  wire  mem_1_clock; // @[SpMVTemplate.scala 44:13]
  wire  mem_1_io_enable_1; // @[SpMVTemplate.scala 44:13]
  wire  mem_1_io_write_1; // @[SpMVTemplate.scala 44:13]
  wire [13:0] mem_1_io_addr_1; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_1_io_dataIn_1; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_1_io_dataOut_1; // @[SpMVTemplate.scala 44:13]
  wire  mem_1_io_enable_2; // @[SpMVTemplate.scala 44:13]
  wire  mem_1_io_write_2; // @[SpMVTemplate.scala 44:13]
  wire [13:0] mem_1_io_addr_2; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_1_io_dataIn_2; // @[SpMVTemplate.scala 44:13]
  wire [35:0] mem_1_io_dataOut_2; // @[SpMVTemplate.scala 44:13]
  wire  me_interface_clock; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_reset; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_0_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_0_valid; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_0_bits_write; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_0_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_inReq_0_bits_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_1_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_1_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_1_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_inReq_1_bits_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_2_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_2_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_2_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_inReq_2_bits_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_3_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_3_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_3_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_4_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_4_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_4_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_5_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_5_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_5_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_6_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_6_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_6_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_7_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_7_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_7_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_8_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_8_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_8_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_9_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_9_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_9_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_10_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_inReq_10_valid; // @[SpMVTemplate.scala 47:28]
  wire [14:0] me_interface_io_inReq_10_bits_addr; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_0_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_0_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_3_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_3_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_3_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_4_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_4_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_4_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_5_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_5_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_5_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_6_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_6_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_6_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_7_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_7_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_7_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_8_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_8_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_8_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_9_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_9_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_9_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_10_ready; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_outData_10_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_outData_10_bits; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_1_0_write; // @[SpMVTemplate.scala 47:28]
  wire [13:0] me_interface_io_portOut_1_0_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_1_0_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_1_0_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_1_0_dataOut; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_1_1_write; // @[SpMVTemplate.scala 47:28]
  wire [13:0] me_interface_io_portOut_1_1_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_1_1_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_1_1_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_1_1_dataOut; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_2_0_write; // @[SpMVTemplate.scala 47:28]
  wire [13:0] me_interface_io_portOut_2_0_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_2_0_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_2_0_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_2_0_dataOut; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_2_1_write; // @[SpMVTemplate.scala 47:28]
  wire [13:0] me_interface_io_portOut_2_1_addr; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_2_1_dataIn; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_portOut_2_1_valid; // @[SpMVTemplate.scala 47:28]
  wire [31:0] me_interface_io_portOut_2_1_dataOut; // @[SpMVTemplate.scala 47:28]
  wire  me_interface_io_busy; // @[SpMVTemplate.scala 47:28]
  wire  df_pe_0_clock; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_reset; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_io_idle; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_0_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_0_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_df_io_memQueuesIO_outgoingReq_0_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_0_df_io_memQueuesIO_outgoingReq_0_bits_dataIn; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_1_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_1_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_df_io_memQueuesIO_outgoingReq_1_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_2_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_2_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_df_io_memQueuesIO_outgoingReq_2_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_3_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_3_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_df_io_memQueuesIO_outgoingReq_3_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_4_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_outgoingReq_4_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_df_io_memQueuesIO_outgoingReq_4_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_inReadData_0_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_0_df_io_memQueuesIO_inReadData_0_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_inReadData_1_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_0_df_io_memQueuesIO_inReadData_1_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_inReadData_2_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_0_df_io_memQueuesIO_inReadData_2_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_inReadData_3_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_0_df_io_memQueuesIO_inReadData_3_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_0; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_1; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_2; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_3; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_A; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_col_idx; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_row_ptr; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_y_addr; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_nrows; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_row_start; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_0_addr_gen_ctrl_io_in_xlen_pow2; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_0_addr_gen_ctrl_io_reset_setup; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_clock; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_reset; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_io_idle; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_0_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_0_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_df_io_memQueuesIO_outgoingReq_0_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_1_df_io_memQueuesIO_outgoingReq_0_bits_dataIn; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_1_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_1_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_df_io_memQueuesIO_outgoingReq_1_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_2_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_2_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_df_io_memQueuesIO_outgoingReq_2_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_3_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_3_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_df_io_memQueuesIO_outgoingReq_3_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_4_ready; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_outgoingReq_4_valid; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_df_io_memQueuesIO_outgoingReq_4_bits_addr; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_inReadData_0_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_1_df_io_memQueuesIO_inReadData_0_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_inReadData_1_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_1_df_io_memQueuesIO_inReadData_1_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_inReadData_2_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_1_df_io_memQueuesIO_inReadData_2_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_inReadData_3_valid; // @[SpMVTemplate.scala 60:11]
  wire [31:0] df_pe_1_df_io_memQueuesIO_inReadData_3_bits; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_0; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_1; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_2; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_3; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_A; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_col_idx; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_row_ptr; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_y_addr; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_nrows; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_row_start; // @[SpMVTemplate.scala 60:11]
  wire [14:0] df_pe_1_addr_gen_ctrl_io_in_xlen_pow2; // @[SpMVTemplate.scala 60:11]
  wire  df_pe_1_addr_gen_ctrl_io_reset_setup; // @[SpMVTemplate.scala 60:11]
  wire  controller_clock; // @[SpMVTemplate.scala 86:26]
  wire  controller_reset; // @[SpMVTemplate.scala 86:26]
  wire  controller_io_rocc_cmd_cmd_rdy; // @[SpMVTemplate.scala 86:26]
  wire  controller_io_rocc_cmd_cmd_valid; // @[SpMVTemplate.scala 86:26]
  wire [6:0] controller_io_rocc_cmd_cmd_inst_funct; // @[SpMVTemplate.scala 86:26]
  wire [6:0] controller_io_rocc_cmd_cmd_inst_opcode; // @[SpMVTemplate.scala 86:26]
  wire [31:0] controller_io_rocc_cmd_cmd_rs1; // @[SpMVTemplate.scala 86:26]
  wire [31:0] controller_io_rocc_cmd_cmd_rs2; // @[SpMVTemplate.scala 86:26]
  wire [31:0] controller_io_rocc_cmd_resp_data; // @[SpMVTemplate.scala 86:26]
  wire  controller_io_rocc_cmd_resp_rdy; // @[SpMVTemplate.scala 86:26]
  wire  controller_io_rocc_cmd_resp_valid; // @[SpMVTemplate.scala 86:26]
  wire  controller_io_rocc_cmd_busy; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_A; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_col_idx; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_row_ptr; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_y_addr; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_nrows; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_row_start; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_0_in_xlen_pow2; // @[SpMVTemplate.scala 86:26]
  wire  controller_pe_regs_0_reset_setup; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_A; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_col_idx; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_row_ptr; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_y_addr; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_nrows; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_row_start; // @[SpMVTemplate.scala 86:26]
  wire [15:0] controller_pe_regs_1_in_xlen_pow2; // @[SpMVTemplate.scala 86:26]
  wire  controller_pe_regs_1_reset_setup; // @[SpMVTemplate.scala 86:26]
  wire  controller_pe_ctrl_0_idle; // @[SpMVTemplate.scala 86:26]
  wire  controller_pe_ctrl_1_idle; // @[SpMVTemplate.scala 86:26]
  wire  controller_mem_io_request_ready; // @[SpMVTemplate.scala 86:26]
  wire  controller_mem_io_request_valid; // @[SpMVTemplate.scala 86:26]
  wire  controller_mem_io_request_bits_write; // @[SpMVTemplate.scala 86:26]
  wire [14:0] controller_mem_io_request_bits_addr; // @[SpMVTemplate.scala 86:26]
  wire [31:0] controller_mem_io_request_bits_dataIn; // @[SpMVTemplate.scala 86:26]
  wire  controller_mem_io_response_ready; // @[SpMVTemplate.scala 86:26]
  wire  controller_mem_io_response_valid; // @[SpMVTemplate.scala 86:26]
  wire [31:0] controller_mem_io_response_bits; // @[SpMVTemplate.scala 86:26]
  wire  controller_mem_io_busy; // @[SpMVTemplate.scala 86:26]
  BRAMLikeMem1 mem_0 ( // @[SpMVTemplate.scala 44:13]
    .clock(mem_0_clock),
    .io_enable_1(mem_0_io_enable_1),
    .io_write_1(mem_0_io_write_1),
    .io_addr_1(mem_0_io_addr_1),
    .io_dataIn_1(mem_0_io_dataIn_1),
    .io_dataOut_1(mem_0_io_dataOut_1),
    .io_enable_2(mem_0_io_enable_2),
    .io_write_2(mem_0_io_write_2),
    .io_addr_2(mem_0_io_addr_2),
    .io_dataIn_2(mem_0_io_dataIn_2),
    .io_dataOut_2(mem_0_io_dataOut_2)
  );
  BRAMLikeMem1 mem_1 ( // @[SpMVTemplate.scala 44:13]
    .clock(mem_1_clock),
    .io_enable_1(mem_1_io_enable_1),
    .io_write_1(mem_1_io_write_1),
    .io_addr_1(mem_1_io_addr_1),
    .io_dataIn_1(mem_1_io_dataIn_1),
    .io_dataOut_1(mem_1_io_dataOut_1),
    .io_enable_2(mem_1_io_enable_2),
    .io_write_2(mem_1_io_write_2),
    .io_addr_2(mem_1_io_addr_2),
    .io_dataIn_2(mem_1_io_dataIn_2),
    .io_dataOut_2(mem_1_io_dataOut_2)
  );
  NtoMMemInterface me_interface ( // @[SpMVTemplate.scala 47:28]
    .clock(me_interface_clock),
    .reset(me_interface_reset),
    .io_inReq_0_ready(me_interface_io_inReq_0_ready),
    .io_inReq_0_valid(me_interface_io_inReq_0_valid),
    .io_inReq_0_bits_write(me_interface_io_inReq_0_bits_write),
    .io_inReq_0_bits_addr(me_interface_io_inReq_0_bits_addr),
    .io_inReq_0_bits_dataIn(me_interface_io_inReq_0_bits_dataIn),
    .io_inReq_1_ready(me_interface_io_inReq_1_ready),
    .io_inReq_1_valid(me_interface_io_inReq_1_valid),
    .io_inReq_1_bits_addr(me_interface_io_inReq_1_bits_addr),
    .io_inReq_1_bits_dataIn(me_interface_io_inReq_1_bits_dataIn),
    .io_inReq_2_ready(me_interface_io_inReq_2_ready),
    .io_inReq_2_valid(me_interface_io_inReq_2_valid),
    .io_inReq_2_bits_addr(me_interface_io_inReq_2_bits_addr),
    .io_inReq_2_bits_dataIn(me_interface_io_inReq_2_bits_dataIn),
    .io_inReq_3_ready(me_interface_io_inReq_3_ready),
    .io_inReq_3_valid(me_interface_io_inReq_3_valid),
    .io_inReq_3_bits_addr(me_interface_io_inReq_3_bits_addr),
    .io_inReq_4_ready(me_interface_io_inReq_4_ready),
    .io_inReq_4_valid(me_interface_io_inReq_4_valid),
    .io_inReq_4_bits_addr(me_interface_io_inReq_4_bits_addr),
    .io_inReq_5_ready(me_interface_io_inReq_5_ready),
    .io_inReq_5_valid(me_interface_io_inReq_5_valid),
    .io_inReq_5_bits_addr(me_interface_io_inReq_5_bits_addr),
    .io_inReq_6_ready(me_interface_io_inReq_6_ready),
    .io_inReq_6_valid(me_interface_io_inReq_6_valid),
    .io_inReq_6_bits_addr(me_interface_io_inReq_6_bits_addr),
    .io_inReq_7_ready(me_interface_io_inReq_7_ready),
    .io_inReq_7_valid(me_interface_io_inReq_7_valid),
    .io_inReq_7_bits_addr(me_interface_io_inReq_7_bits_addr),
    .io_inReq_8_ready(me_interface_io_inReq_8_ready),
    .io_inReq_8_valid(me_interface_io_inReq_8_valid),
    .io_inReq_8_bits_addr(me_interface_io_inReq_8_bits_addr),
    .io_inReq_9_ready(me_interface_io_inReq_9_ready),
    .io_inReq_9_valid(me_interface_io_inReq_9_valid),
    .io_inReq_9_bits_addr(me_interface_io_inReq_9_bits_addr),
    .io_inReq_10_ready(me_interface_io_inReq_10_ready),
    .io_inReq_10_valid(me_interface_io_inReq_10_valid),
    .io_inReq_10_bits_addr(me_interface_io_inReq_10_bits_addr),
    .io_outData_0_valid(me_interface_io_outData_0_valid),
    .io_outData_0_bits(me_interface_io_outData_0_bits),
    .io_outData_3_ready(me_interface_io_outData_3_ready),
    .io_outData_3_valid(me_interface_io_outData_3_valid),
    .io_outData_3_bits(me_interface_io_outData_3_bits),
    .io_outData_4_ready(me_interface_io_outData_4_ready),
    .io_outData_4_valid(me_interface_io_outData_4_valid),
    .io_outData_4_bits(me_interface_io_outData_4_bits),
    .io_outData_5_ready(me_interface_io_outData_5_ready),
    .io_outData_5_valid(me_interface_io_outData_5_valid),
    .io_outData_5_bits(me_interface_io_outData_5_bits),
    .io_outData_6_ready(me_interface_io_outData_6_ready),
    .io_outData_6_valid(me_interface_io_outData_6_valid),
    .io_outData_6_bits(me_interface_io_outData_6_bits),
    .io_outData_7_ready(me_interface_io_outData_7_ready),
    .io_outData_7_valid(me_interface_io_outData_7_valid),
    .io_outData_7_bits(me_interface_io_outData_7_bits),
    .io_outData_8_ready(me_interface_io_outData_8_ready),
    .io_outData_8_valid(me_interface_io_outData_8_valid),
    .io_outData_8_bits(me_interface_io_outData_8_bits),
    .io_outData_9_ready(me_interface_io_outData_9_ready),
    .io_outData_9_valid(me_interface_io_outData_9_valid),
    .io_outData_9_bits(me_interface_io_outData_9_bits),
    .io_outData_10_ready(me_interface_io_outData_10_ready),
    .io_outData_10_valid(me_interface_io_outData_10_valid),
    .io_outData_10_bits(me_interface_io_outData_10_bits),
    .io_portOut_1_0_write(me_interface_io_portOut_1_0_write),
    .io_portOut_1_0_addr(me_interface_io_portOut_1_0_addr),
    .io_portOut_1_0_dataIn(me_interface_io_portOut_1_0_dataIn),
    .io_portOut_1_0_valid(me_interface_io_portOut_1_0_valid),
    .io_portOut_1_0_dataOut(me_interface_io_portOut_1_0_dataOut),
    .io_portOut_1_1_write(me_interface_io_portOut_1_1_write),
    .io_portOut_1_1_addr(me_interface_io_portOut_1_1_addr),
    .io_portOut_1_1_dataIn(me_interface_io_portOut_1_1_dataIn),
    .io_portOut_1_1_valid(me_interface_io_portOut_1_1_valid),
    .io_portOut_1_1_dataOut(me_interface_io_portOut_1_1_dataOut),
    .io_portOut_2_0_write(me_interface_io_portOut_2_0_write),
    .io_portOut_2_0_addr(me_interface_io_portOut_2_0_addr),
    .io_portOut_2_0_dataIn(me_interface_io_portOut_2_0_dataIn),
    .io_portOut_2_0_valid(me_interface_io_portOut_2_0_valid),
    .io_portOut_2_0_dataOut(me_interface_io_portOut_2_0_dataOut),
    .io_portOut_2_1_write(me_interface_io_portOut_2_1_write),
    .io_portOut_2_1_addr(me_interface_io_portOut_2_1_addr),
    .io_portOut_2_1_dataIn(me_interface_io_portOut_2_1_dataIn),
    .io_portOut_2_1_valid(me_interface_io_portOut_2_1_valid),
    .io_portOut_2_1_dataOut(me_interface_io_portOut_2_1_dataOut),
    .io_busy(me_interface_io_busy)
  );
  SpMVPE df_pe_0 ( // @[SpMVTemplate.scala 60:11]
    .clock(df_pe_0_clock),
    .reset(df_pe_0_reset),
    .io_idle(df_pe_0_io_idle),
    .df_io_memQueuesIO_outgoingReq_0_ready(df_pe_0_df_io_memQueuesIO_outgoingReq_0_ready),
    .df_io_memQueuesIO_outgoingReq_0_valid(df_pe_0_df_io_memQueuesIO_outgoingReq_0_valid),
    .df_io_memQueuesIO_outgoingReq_0_bits_addr(df_pe_0_df_io_memQueuesIO_outgoingReq_0_bits_addr),
    .df_io_memQueuesIO_outgoingReq_0_bits_dataIn(df_pe_0_df_io_memQueuesIO_outgoingReq_0_bits_dataIn),
    .df_io_memQueuesIO_outgoingReq_1_ready(df_pe_0_df_io_memQueuesIO_outgoingReq_1_ready),
    .df_io_memQueuesIO_outgoingReq_1_valid(df_pe_0_df_io_memQueuesIO_outgoingReq_1_valid),
    .df_io_memQueuesIO_outgoingReq_1_bits_addr(df_pe_0_df_io_memQueuesIO_outgoingReq_1_bits_addr),
    .df_io_memQueuesIO_outgoingReq_2_ready(df_pe_0_df_io_memQueuesIO_outgoingReq_2_ready),
    .df_io_memQueuesIO_outgoingReq_2_valid(df_pe_0_df_io_memQueuesIO_outgoingReq_2_valid),
    .df_io_memQueuesIO_outgoingReq_2_bits_addr(df_pe_0_df_io_memQueuesIO_outgoingReq_2_bits_addr),
    .df_io_memQueuesIO_outgoingReq_3_ready(df_pe_0_df_io_memQueuesIO_outgoingReq_3_ready),
    .df_io_memQueuesIO_outgoingReq_3_valid(df_pe_0_df_io_memQueuesIO_outgoingReq_3_valid),
    .df_io_memQueuesIO_outgoingReq_3_bits_addr(df_pe_0_df_io_memQueuesIO_outgoingReq_3_bits_addr),
    .df_io_memQueuesIO_outgoingReq_4_ready(df_pe_0_df_io_memQueuesIO_outgoingReq_4_ready),
    .df_io_memQueuesIO_outgoingReq_4_valid(df_pe_0_df_io_memQueuesIO_outgoingReq_4_valid),
    .df_io_memQueuesIO_outgoingReq_4_bits_addr(df_pe_0_df_io_memQueuesIO_outgoingReq_4_bits_addr),
    .df_io_memQueuesIO_inReadData_0_valid(df_pe_0_df_io_memQueuesIO_inReadData_0_valid),
    .df_io_memQueuesIO_inReadData_0_bits(df_pe_0_df_io_memQueuesIO_inReadData_0_bits),
    .df_io_memQueuesIO_inReadData_1_valid(df_pe_0_df_io_memQueuesIO_inReadData_1_valid),
    .df_io_memQueuesIO_inReadData_1_bits(df_pe_0_df_io_memQueuesIO_inReadData_1_bits),
    .df_io_memQueuesIO_inReadData_2_valid(df_pe_0_df_io_memQueuesIO_inReadData_2_valid),
    .df_io_memQueuesIO_inReadData_2_bits(df_pe_0_df_io_memQueuesIO_inReadData_2_bits),
    .df_io_memQueuesIO_inReadData_3_valid(df_pe_0_df_io_memQueuesIO_inReadData_3_valid),
    .df_io_memQueuesIO_inReadData_3_bits(df_pe_0_df_io_memQueuesIO_inReadData_3_bits),
    .df_io_memQueuesIO_readQueuesEnqReady_0(df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_0),
    .df_io_memQueuesIO_readQueuesEnqReady_1(df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_1),
    .df_io_memQueuesIO_readQueuesEnqReady_2(df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_2),
    .df_io_memQueuesIO_readQueuesEnqReady_3(df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_3),
    .addr_gen_ctrl_io_in_A(df_pe_0_addr_gen_ctrl_io_in_A),
    .addr_gen_ctrl_io_in_col_idx(df_pe_0_addr_gen_ctrl_io_in_col_idx),
    .addr_gen_ctrl_io_in_row_ptr(df_pe_0_addr_gen_ctrl_io_in_row_ptr),
    .addr_gen_ctrl_io_in_y_addr(df_pe_0_addr_gen_ctrl_io_in_y_addr),
    .addr_gen_ctrl_io_in_nrows(df_pe_0_addr_gen_ctrl_io_in_nrows),
    .addr_gen_ctrl_io_in_row_start(df_pe_0_addr_gen_ctrl_io_in_row_start),
    .addr_gen_ctrl_io_in_xlen_pow2(df_pe_0_addr_gen_ctrl_io_in_xlen_pow2),
    .addr_gen_ctrl_io_reset_setup(df_pe_0_addr_gen_ctrl_io_reset_setup)
  );
  SpMVPE df_pe_1 ( // @[SpMVTemplate.scala 60:11]
    .clock(df_pe_1_clock),
    .reset(df_pe_1_reset),
    .io_idle(df_pe_1_io_idle),
    .df_io_memQueuesIO_outgoingReq_0_ready(df_pe_1_df_io_memQueuesIO_outgoingReq_0_ready),
    .df_io_memQueuesIO_outgoingReq_0_valid(df_pe_1_df_io_memQueuesIO_outgoingReq_0_valid),
    .df_io_memQueuesIO_outgoingReq_0_bits_addr(df_pe_1_df_io_memQueuesIO_outgoingReq_0_bits_addr),
    .df_io_memQueuesIO_outgoingReq_0_bits_dataIn(df_pe_1_df_io_memQueuesIO_outgoingReq_0_bits_dataIn),
    .df_io_memQueuesIO_outgoingReq_1_ready(df_pe_1_df_io_memQueuesIO_outgoingReq_1_ready),
    .df_io_memQueuesIO_outgoingReq_1_valid(df_pe_1_df_io_memQueuesIO_outgoingReq_1_valid),
    .df_io_memQueuesIO_outgoingReq_1_bits_addr(df_pe_1_df_io_memQueuesIO_outgoingReq_1_bits_addr),
    .df_io_memQueuesIO_outgoingReq_2_ready(df_pe_1_df_io_memQueuesIO_outgoingReq_2_ready),
    .df_io_memQueuesIO_outgoingReq_2_valid(df_pe_1_df_io_memQueuesIO_outgoingReq_2_valid),
    .df_io_memQueuesIO_outgoingReq_2_bits_addr(df_pe_1_df_io_memQueuesIO_outgoingReq_2_bits_addr),
    .df_io_memQueuesIO_outgoingReq_3_ready(df_pe_1_df_io_memQueuesIO_outgoingReq_3_ready),
    .df_io_memQueuesIO_outgoingReq_3_valid(df_pe_1_df_io_memQueuesIO_outgoingReq_3_valid),
    .df_io_memQueuesIO_outgoingReq_3_bits_addr(df_pe_1_df_io_memQueuesIO_outgoingReq_3_bits_addr),
    .df_io_memQueuesIO_outgoingReq_4_ready(df_pe_1_df_io_memQueuesIO_outgoingReq_4_ready),
    .df_io_memQueuesIO_outgoingReq_4_valid(df_pe_1_df_io_memQueuesIO_outgoingReq_4_valid),
    .df_io_memQueuesIO_outgoingReq_4_bits_addr(df_pe_1_df_io_memQueuesIO_outgoingReq_4_bits_addr),
    .df_io_memQueuesIO_inReadData_0_valid(df_pe_1_df_io_memQueuesIO_inReadData_0_valid),
    .df_io_memQueuesIO_inReadData_0_bits(df_pe_1_df_io_memQueuesIO_inReadData_0_bits),
    .df_io_memQueuesIO_inReadData_1_valid(df_pe_1_df_io_memQueuesIO_inReadData_1_valid),
    .df_io_memQueuesIO_inReadData_1_bits(df_pe_1_df_io_memQueuesIO_inReadData_1_bits),
    .df_io_memQueuesIO_inReadData_2_valid(df_pe_1_df_io_memQueuesIO_inReadData_2_valid),
    .df_io_memQueuesIO_inReadData_2_bits(df_pe_1_df_io_memQueuesIO_inReadData_2_bits),
    .df_io_memQueuesIO_inReadData_3_valid(df_pe_1_df_io_memQueuesIO_inReadData_3_valid),
    .df_io_memQueuesIO_inReadData_3_bits(df_pe_1_df_io_memQueuesIO_inReadData_3_bits),
    .df_io_memQueuesIO_readQueuesEnqReady_0(df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_0),
    .df_io_memQueuesIO_readQueuesEnqReady_1(df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_1),
    .df_io_memQueuesIO_readQueuesEnqReady_2(df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_2),
    .df_io_memQueuesIO_readQueuesEnqReady_3(df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_3),
    .addr_gen_ctrl_io_in_A(df_pe_1_addr_gen_ctrl_io_in_A),
    .addr_gen_ctrl_io_in_col_idx(df_pe_1_addr_gen_ctrl_io_in_col_idx),
    .addr_gen_ctrl_io_in_row_ptr(df_pe_1_addr_gen_ctrl_io_in_row_ptr),
    .addr_gen_ctrl_io_in_y_addr(df_pe_1_addr_gen_ctrl_io_in_y_addr),
    .addr_gen_ctrl_io_in_nrows(df_pe_1_addr_gen_ctrl_io_in_nrows),
    .addr_gen_ctrl_io_in_row_start(df_pe_1_addr_gen_ctrl_io_in_row_start),
    .addr_gen_ctrl_io_in_xlen_pow2(df_pe_1_addr_gen_ctrl_io_in_xlen_pow2),
    .addr_gen_ctrl_io_reset_setup(df_pe_1_addr_gen_ctrl_io_reset_setup)
  );
  SpMVController controller ( // @[SpMVTemplate.scala 86:26]
    .clock(controller_clock),
    .reset(controller_reset),
    .io_rocc_cmd_cmd_rdy(controller_io_rocc_cmd_cmd_rdy),
    .io_rocc_cmd_cmd_valid(controller_io_rocc_cmd_cmd_valid),
    .io_rocc_cmd_cmd_inst_funct(controller_io_rocc_cmd_cmd_inst_funct),
    .io_rocc_cmd_cmd_inst_opcode(controller_io_rocc_cmd_cmd_inst_opcode),
    .io_rocc_cmd_cmd_rs1(controller_io_rocc_cmd_cmd_rs1),
    .io_rocc_cmd_cmd_rs2(controller_io_rocc_cmd_cmd_rs2),
    .io_rocc_cmd_resp_data(controller_io_rocc_cmd_resp_data),
    .io_rocc_cmd_resp_rdy(controller_io_rocc_cmd_resp_rdy),
    .io_rocc_cmd_resp_valid(controller_io_rocc_cmd_resp_valid),
    .io_rocc_cmd_busy(controller_io_rocc_cmd_busy),
    .pe_regs_0_in_A(controller_pe_regs_0_in_A),
    .pe_regs_0_in_col_idx(controller_pe_regs_0_in_col_idx),
    .pe_regs_0_in_row_ptr(controller_pe_regs_0_in_row_ptr),
    .pe_regs_0_in_y_addr(controller_pe_regs_0_in_y_addr),
    .pe_regs_0_in_nrows(controller_pe_regs_0_in_nrows),
    .pe_regs_0_in_row_start(controller_pe_regs_0_in_row_start),
    .pe_regs_0_in_xlen_pow2(controller_pe_regs_0_in_xlen_pow2),
    .pe_regs_0_reset_setup(controller_pe_regs_0_reset_setup),
    .pe_regs_1_in_A(controller_pe_regs_1_in_A),
    .pe_regs_1_in_col_idx(controller_pe_regs_1_in_col_idx),
    .pe_regs_1_in_row_ptr(controller_pe_regs_1_in_row_ptr),
    .pe_regs_1_in_y_addr(controller_pe_regs_1_in_y_addr),
    .pe_regs_1_in_nrows(controller_pe_regs_1_in_nrows),
    .pe_regs_1_in_row_start(controller_pe_regs_1_in_row_start),
    .pe_regs_1_in_xlen_pow2(controller_pe_regs_1_in_xlen_pow2),
    .pe_regs_1_reset_setup(controller_pe_regs_1_reset_setup),
    .pe_ctrl_0_idle(controller_pe_ctrl_0_idle),
    .pe_ctrl_1_idle(controller_pe_ctrl_1_idle),
    .mem_io_request_ready(controller_mem_io_request_ready),
    .mem_io_request_valid(controller_mem_io_request_valid),
    .mem_io_request_bits_write(controller_mem_io_request_bits_write),
    .mem_io_request_bits_addr(controller_mem_io_request_bits_addr),
    .mem_io_request_bits_dataIn(controller_mem_io_request_bits_dataIn),
    .mem_io_response_ready(controller_mem_io_response_ready),
    .mem_io_response_valid(controller_mem_io_response_valid),
    .mem_io_response_bits(controller_mem_io_response_bits),
    .mem_io_busy(controller_mem_io_busy)
  );
  assign ctrl_io_rocc_cmd_cmd_rdy = controller_io_rocc_cmd_cmd_rdy; // @[SpMVTemplate.scala 101:17]
  assign ctrl_io_rocc_cmd_resp_data = controller_io_rocc_cmd_resp_data; // @[SpMVTemplate.scala 101:17]
  assign ctrl_io_rocc_cmd_resp_valid = controller_io_rocc_cmd_resp_valid; // @[SpMVTemplate.scala 101:17]
  assign ctrl_io_rocc_cmd_busy = controller_io_rocc_cmd_busy; // @[SpMVTemplate.scala 101:17]
  assign ctrl_io_rocc_cmd_interrupt = 1'h0; // @[SpMVTemplate.scala 101:17]
  assign mem_0_clock = clock;
  assign mem_0_io_enable_1 = me_interface_io_portOut_1_0_valid; // @[MEInterface.scala 209:27]
  assign mem_0_io_write_1 = me_interface_io_portOut_1_0_write; // @[MEInterface.scala 206:26]
  assign mem_0_io_addr_1 = me_interface_io_portOut_1_0_addr; // @[MEInterface.scala 207:25]
  assign mem_0_io_dataIn_1 = {{4'd0}, me_interface_io_portOut_1_0_dataIn}; // @[MEInterface.scala 208:27]
  assign mem_0_io_enable_2 = me_interface_io_portOut_2_0_valid; // @[MEInterface.scala 214:27]
  assign mem_0_io_write_2 = me_interface_io_portOut_2_0_write; // @[MEInterface.scala 211:26]
  assign mem_0_io_addr_2 = me_interface_io_portOut_2_0_addr; // @[MEInterface.scala 212:25]
  assign mem_0_io_dataIn_2 = {{4'd0}, me_interface_io_portOut_2_0_dataIn}; // @[MEInterface.scala 213:27]
  assign mem_1_clock = clock;
  assign mem_1_io_enable_1 = me_interface_io_portOut_1_1_valid; // @[MEInterface.scala 209:27]
  assign mem_1_io_write_1 = me_interface_io_portOut_1_1_write; // @[MEInterface.scala 206:26]
  assign mem_1_io_addr_1 = me_interface_io_portOut_1_1_addr; // @[MEInterface.scala 207:25]
  assign mem_1_io_dataIn_1 = {{4'd0}, me_interface_io_portOut_1_1_dataIn}; // @[MEInterface.scala 208:27]
  assign mem_1_io_enable_2 = me_interface_io_portOut_2_1_valid; // @[MEInterface.scala 214:27]
  assign mem_1_io_write_2 = me_interface_io_portOut_2_1_write; // @[MEInterface.scala 211:26]
  assign mem_1_io_addr_2 = me_interface_io_portOut_2_1_addr; // @[MEInterface.scala 212:25]
  assign mem_1_io_dataIn_2 = {{4'd0}, me_interface_io_portOut_2_1_dataIn}; // @[MEInterface.scala 213:27]
  assign me_interface_clock = clock;
  assign me_interface_reset = reset;
  assign me_interface_io_inReq_0_valid = controller_mem_io_request_valid; // @[SpMVTemplate.scala 91:29]
  assign me_interface_io_inReq_0_bits_write = controller_mem_io_request_bits_write; // @[SpMVTemplate.scala 91:29]
  assign me_interface_io_inReq_0_bits_addr = controller_mem_io_request_bits_addr; // @[SpMVTemplate.scala 91:29]
  assign me_interface_io_inReq_0_bits_dataIn = controller_mem_io_request_bits_dataIn; // @[SpMVTemplate.scala 91:29]
  assign me_interface_io_inReq_1_valid = df_pe_0_df_io_memQueuesIO_outgoingReq_0_valid; // @[TemplateTraits.scala 67:69]
  assign me_interface_io_inReq_1_bits_addr = df_pe_0_df_io_memQueuesIO_outgoingReq_0_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_1_bits_dataIn = df_pe_0_df_io_memQueuesIO_outgoingReq_0_bits_dataIn; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_2_valid = df_pe_1_df_io_memQueuesIO_outgoingReq_0_valid; // @[TemplateTraits.scala 67:69]
  assign me_interface_io_inReq_2_bits_addr = df_pe_1_df_io_memQueuesIO_outgoingReq_0_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_2_bits_dataIn = df_pe_1_df_io_memQueuesIO_outgoingReq_0_bits_dataIn; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_3_valid = df_pe_0_df_io_memQueuesIO_outgoingReq_1_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_3_bits_addr = df_pe_0_df_io_memQueuesIO_outgoingReq_1_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_4_valid = df_pe_1_df_io_memQueuesIO_outgoingReq_1_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_4_bits_addr = df_pe_1_df_io_memQueuesIO_outgoingReq_1_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_5_valid = df_pe_0_df_io_memQueuesIO_outgoingReq_2_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_5_bits_addr = df_pe_0_df_io_memQueuesIO_outgoingReq_2_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_6_valid = df_pe_1_df_io_memQueuesIO_outgoingReq_2_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_6_bits_addr = df_pe_1_df_io_memQueuesIO_outgoingReq_2_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_7_valid = df_pe_0_df_io_memQueuesIO_outgoingReq_3_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_7_bits_addr = df_pe_0_df_io_memQueuesIO_outgoingReq_3_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_8_valid = df_pe_1_df_io_memQueuesIO_outgoingReq_3_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_8_bits_addr = df_pe_1_df_io_memQueuesIO_outgoingReq_3_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_9_valid = df_pe_0_df_io_memQueuesIO_outgoingReq_4_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_9_bits_addr = df_pe_0_df_io_memQueuesIO_outgoingReq_4_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_inReq_10_valid = df_pe_1_df_io_memQueuesIO_outgoingReq_4_valid; // @[TemplateTraits.scala 64:69]
  assign me_interface_io_inReq_10_bits_addr = df_pe_1_df_io_memQueuesIO_outgoingReq_4_bits_addr; // @[TemplateTraits.scala 70:66]
  assign me_interface_io_outData_3_ready = df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_0; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_4_ready = df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_0; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_5_ready = df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_1; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_6_ready = df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_1; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_7_ready = df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_2; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_8_ready = df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_2; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_9_ready = df_pe_0_df_io_memQueuesIO_readQueuesEnqReady_3; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_outData_10_ready = df_pe_1_df_io_memQueuesIO_readQueuesEnqReady_3; // @[TemplateTraits.scala 63:71]
  assign me_interface_io_portOut_1_0_dataOut = mem_0_io_dataOut_1[31:0]; // @[MEInterface.scala 210:31]
  assign me_interface_io_portOut_1_1_dataOut = mem_1_io_dataOut_1[31:0]; // @[MEInterface.scala 210:31]
  assign me_interface_io_portOut_2_0_dataOut = mem_0_io_dataOut_2[31:0]; // @[MEInterface.scala 215:31]
  assign me_interface_io_portOut_2_1_dataOut = mem_1_io_dataOut_2[31:0]; // @[MEInterface.scala 215:31]
  assign df_pe_0_clock = clock;
  assign df_pe_0_reset = reset;
  assign df_pe_0_df_io_memQueuesIO_outgoingReq_0_ready = me_interface_io_inReq_1_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_0_df_io_memQueuesIO_outgoingReq_1_ready = me_interface_io_inReq_3_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_0_df_io_memQueuesIO_outgoingReq_2_ready = me_interface_io_inReq_5_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_0_df_io_memQueuesIO_outgoingReq_3_ready = me_interface_io_inReq_7_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_0_df_io_memQueuesIO_outgoingReq_4_ready = me_interface_io_inReq_9_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_0_df_io_memQueuesIO_inReadData_0_valid = me_interface_io_outData_3_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_0_df_io_memQueuesIO_inReadData_0_bits = me_interface_io_outData_3_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_0_df_io_memQueuesIO_inReadData_1_valid = me_interface_io_outData_5_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_0_df_io_memQueuesIO_inReadData_1_bits = me_interface_io_outData_5_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_0_df_io_memQueuesIO_inReadData_2_valid = me_interface_io_outData_7_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_0_df_io_memQueuesIO_inReadData_2_bits = me_interface_io_outData_7_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_0_df_io_memQueuesIO_inReadData_3_valid = me_interface_io_outData_9_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_0_df_io_memQueuesIO_inReadData_3_bits = me_interface_io_outData_9_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_0_addr_gen_ctrl_io_in_A = controller_pe_regs_0_in_A[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_in_col_idx = controller_pe_regs_0_in_col_idx[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_in_row_ptr = controller_pe_regs_0_in_row_ptr[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_in_y_addr = controller_pe_regs_0_in_y_addr[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_in_nrows = controller_pe_regs_0_in_nrows[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_in_row_start = controller_pe_regs_0_in_row_start[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_in_xlen_pow2 = controller_pe_regs_0_in_xlen_pow2[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_0_addr_gen_ctrl_io_reset_setup = controller_pe_regs_0_reset_setup; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_clock = clock;
  assign df_pe_1_reset = reset;
  assign df_pe_1_df_io_memQueuesIO_outgoingReq_0_ready = me_interface_io_inReq_2_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_1_df_io_memQueuesIO_outgoingReq_1_ready = me_interface_io_inReq_4_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_1_df_io_memQueuesIO_outgoingReq_2_ready = me_interface_io_inReq_6_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_1_df_io_memQueuesIO_outgoingReq_3_ready = me_interface_io_inReq_8_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_1_df_io_memQueuesIO_outgoingReq_4_ready = me_interface_io_inReq_10_ready; // @[TemplateTraits.scala 71:58]
  assign df_pe_1_df_io_memQueuesIO_inReadData_0_valid = me_interface_io_outData_4_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_1_df_io_memQueuesIO_inReadData_0_bits = me_interface_io_outData_4_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_1_df_io_memQueuesIO_inReadData_1_valid = me_interface_io_outData_6_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_1_df_io_memQueuesIO_inReadData_1_bits = me_interface_io_outData_6_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_1_df_io_memQueuesIO_inReadData_2_valid = me_interface_io_outData_8_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_1_df_io_memQueuesIO_inReadData_2_bits = me_interface_io_outData_8_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_1_df_io_memQueuesIO_inReadData_3_valid = me_interface_io_outData_10_valid; // @[TemplateTraits.scala 61:64]
  assign df_pe_1_df_io_memQueuesIO_inReadData_3_bits = me_interface_io_outData_10_bits; // @[TemplateTraits.scala 62:63]
  assign df_pe_1_addr_gen_ctrl_io_in_A = controller_pe_regs_1_in_A[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_in_col_idx = controller_pe_regs_1_in_col_idx[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_in_row_ptr = controller_pe_regs_1_in_row_ptr[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_in_y_addr = controller_pe_regs_1_in_y_addr[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_in_nrows = controller_pe_regs_1_in_nrows[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_in_row_start = controller_pe_regs_1_in_row_start[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_in_xlen_pow2 = controller_pe_regs_1_in_xlen_pow2[14:0]; // @[SpMVTemplate.scala 96:31]
  assign df_pe_1_addr_gen_ctrl_io_reset_setup = controller_pe_regs_1_reset_setup; // @[SpMVTemplate.scala 96:31]
  assign controller_clock = clock;
  assign controller_reset = reset;
  assign controller_io_rocc_cmd_cmd_valid = ctrl_io_rocc_cmd_cmd_valid; // @[SpMVTemplate.scala 101:17]
  assign controller_io_rocc_cmd_cmd_inst_funct = ctrl_io_rocc_cmd_cmd_inst_funct; // @[SpMVTemplate.scala 101:17]
  assign controller_io_rocc_cmd_cmd_inst_opcode = ctrl_io_rocc_cmd_cmd_inst_opcode; // @[SpMVTemplate.scala 101:17]
  assign controller_io_rocc_cmd_cmd_rs1 = ctrl_io_rocc_cmd_cmd_rs1; // @[SpMVTemplate.scala 101:17]
  assign controller_io_rocc_cmd_cmd_rs2 = ctrl_io_rocc_cmd_cmd_rs2; // @[SpMVTemplate.scala 101:17]
  assign controller_io_rocc_cmd_resp_rdy = ctrl_io_rocc_cmd_resp_rdy; // @[SpMVTemplate.scala 101:17]
  assign controller_pe_ctrl_0_idle = df_pe_0_io_idle; // @[SpMVTemplate.scala 97:27]
  assign controller_pe_ctrl_1_idle = df_pe_1_io_idle; // @[SpMVTemplate.scala 97:27]
  assign controller_mem_io_request_ready = me_interface_io_inReq_0_ready; // @[SpMVTemplate.scala 91:29]
  assign controller_mem_io_response_valid = me_interface_io_outData_0_valid; // @[SpMVTemplate.scala 92:30]
  assign controller_mem_io_response_bits = me_interface_io_outData_0_bits; // @[SpMVTemplate.scala 92:30]
  assign controller_mem_io_busy = me_interface_io_busy; // @[SpMVTemplate.scala 93:26]
endmodule
