from z3 import *
from math import *
for bits in range(int(ceil(log(52)/log(2))+4),  int(ceil(log(52)/log(2))-1), -1):
	st_1, st_2, st_3, st_4, st_5, st_6, st_7, st_8, st_9, st_10, st_11, st_12, st_13, st_14, st_15, st_16, st_17, st_18, st_19, st_20, st_21, st_22, st_23, st_24, st_25, st_26, st_27, st_28, st_29, st_30, st_31, st_32, st_33, st_34, st_35, st_36, st_37, st_38, st_39, st_40, st_41, st_42, st_43, st_44, st_45, st_46, st_47, st_48, st_49, st_50, st_51, st_0 = BitVecs('st_1 st_2 st_3 st_4 st_5 st_6 st_7 st_8 st_9 st_10 st_11 st_12 st_13 st_14 st_15 st_16 st_17 st_18 st_19 st_20 st_21 st_22 st_23 st_24 st_25 st_26 st_27 st_28 st_29 st_30 st_31 st_32 st_33 st_34 st_35 st_36 st_37 st_38 st_39 st_40 st_41 st_42 st_43 st_44 st_45 st_46 st_47 st_48 st_49 st_50 st_51 st_0',bits)

	s = Solver();
	s.set("timeout", 30000)
	s.add(Distinct(st_1,st_2,st_3,st_4,st_5,st_6,st_7,st_8,st_9,st_10,st_11,st_12,st_13,st_14,st_15,st_16,st_17,st_18,st_19,st_20,st_21,st_22,st_23,st_24,st_25,st_26,st_27,st_28,st_29,st_30,st_31,st_32,st_33,st_34,st_35,st_36,st_37,st_38,st_39,st_40,st_41,st_42,st_43,st_44,st_45,st_46,st_47,st_48,st_49,st_50,st_51,st_0))

	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_2)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_1 ^ st_2))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_1 ^ st_1))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_2)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_2 ^ st_3))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_4)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_3 ^ st_4))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_3 ^ st_3))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_4)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_4 ^ st_5))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_6)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_5 ^ st_6))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_5 ^ st_5))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_6)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_7)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_6 ^ st_7))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_7)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_7 ^ st_8))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_7)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_7)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_7 ^ st_7))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_9)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8 ^ st_9))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_4)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8 ^ st_4))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_9)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_10)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_9 ^ st_10))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_10)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_10 ^ st_11))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_10)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_10)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_10 ^ st_10))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_11 ^ st_12))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_12 ^ st_13))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_12 ^ st_12))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_13 ^ st_14))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_9)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_13 ^ st_9))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_15)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_14 ^ st_15))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_15)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_15 ^ st_16))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_15)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_15)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_15 ^ st_15))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_17)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16 ^ st_17))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_17)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_18)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_17 ^ st_18))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_17)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_17)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_17 ^ st_17))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_18)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_18 ^ st_19))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_18)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_18 ^ st_14))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_20)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_19 ^ st_20))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_20)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_21)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_20 ^ st_21))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_20)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_20)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_20 ^ st_20))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_21)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_21 ^ st_22))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_23)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_22 ^ st_23))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_22 ^ st_22))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_23)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_24)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_23 ^ st_24))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_24)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_24 ^ st_25))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_24)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_24)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_24 ^ st_24))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_25 ^ st_26))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_27)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_26 ^ st_27))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_26 ^ st_26))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_27)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_27 ^ st_28))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_27)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_23)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_27 ^ st_23))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_29)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_28 ^ st_29))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_29)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_29 ^ st_30))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_29)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_29)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_29 ^ st_29))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_30 ^ st_31))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_32)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_31 ^ st_32))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_31 ^ st_31))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_32)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_33)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_32 ^ st_33))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_33)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_33 ^ st_34))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_33)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_33)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_33 ^ st_33))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_35)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_34 ^ st_35))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_35)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_36)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_35 ^ st_36))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_35)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_35)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_35 ^ st_35))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_36)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_37)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_36 ^ st_37))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_37)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_37 ^ st_38))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_37)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_37)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_37 ^ st_37))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_38 ^ st_39))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_39 ^ st_40))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_39 ^ st_39))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_41)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_40 ^ st_41))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_41)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_41 ^ st_42))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_41)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_41)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_41 ^ st_41))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_42 ^ st_43))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_42 ^ st_34))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_44)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_43 ^ st_44))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_44)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_45)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_44 ^ st_45))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_44)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_44)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_44 ^ st_44))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_45)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_45 ^ st_46))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_47)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_46 ^ st_47))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_46 ^ st_46))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_47)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_47 ^ st_48))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_48 ^ st_49))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_48 ^ st_48))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_49 ^ st_50))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_51)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_50 ^ st_51))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_50 ^ st_50))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_51)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_0)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_51 ^ st_0))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_0)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
        if(s.check() == sat):
          print "Sat, %d," %(bits),
          m = s.model()
          for d in m.decls():
              print "%s," % (d.name()),
          print " "
          print "ASSIGN, %d," %(bits),
          for d in m.decls():
              print "%s," % (m[d]),
        else:
           print "NotSat, %d," %(bits),
           print " "
        print " "
        sys.stdout.flush()
