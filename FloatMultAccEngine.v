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
module Queue(
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
  Queue accQueue ( // @[MAccDFE.scala 53:24]
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
