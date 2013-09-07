from z3 import *
from math import *
for bits in range(int(ceil(log(106)/log(2))+4),  int(ceil(log(106)/log(2))-1), -1):
	st_1, st_2, st_1_n, st_3, st_4, st_3_n, st_5, st_6, st_5_n, st_7, st_8, st_9, st_8_n, st_10, st_11, st_12, st_11_n, st_13, st_14, st_15, st_14_n, st_16, st_17, st_16_n, st_18, st_19, st_20, st_19_n, st_21, st_22, st_23, st_22_n, st_24, st_25, st_26, st_25_n, st_27, st_26_n, st_28, st_29, st_28_n, st_30, st_31, st_30_n, st_32, st_31_n, st_33, st_34, st_35, st_34_n, st_36, st_37, st_38, st_39, st_38_n, st_40, st_41, st_40_n, st_42, st_43, st_42_n, st_44, st_43_n, st_45, st_46, st_47, st_46_n, st_48, st_49, st_48_n, st_50, st_49_n, st_51, st_50_n, st_52, st_53, st_54, st_55, st_54_n, st_56, st_57, st_56_n, st_58, st_59, st_58_n, st_60, st_59_n, st_61, st_60_n, st_62, st_63, st_62_n, st_64, st_63_n, st_65, st_64_n, st_66, st_67, st_68, st_69, st_68_n, st_70, st_71, st_70_n, st_0, st_71_n = BitVecs('st_1 st_2 st_1_n st_3 st_4 st_3_n st_5 st_6 st_5_n st_7 st_8 st_9 st_8_n st_10 st_11 st_12 st_11_n st_13 st_14 st_15 st_14_n st_16 st_17 st_16_n st_18 st_19 st_20 st_19_n st_21 st_22 st_23 st_22_n st_24 st_25 st_26 st_25_n st_27 st_26_n st_28 st_29 st_28_n st_30 st_31 st_30_n st_32 st_31_n st_33 st_34 st_35 st_34_n st_36 st_37 st_38 st_39 st_38_n st_40 st_41 st_40_n st_42 st_43 st_42_n st_44 st_43_n st_45 st_46 st_47 st_46_n st_48 st_49 st_48_n st_50 st_49_n st_51 st_50_n st_52 st_53 st_54 st_55 st_54_n st_56 st_57 st_56_n st_58 st_59 st_58_n st_60 st_59_n st_61 st_60_n st_62 st_63 st_62_n st_64 st_63_n st_65 st_64_n st_66 st_67 st_68 st_69 st_68_n st_70 st_71 st_70_n st_0 st_71_n',bits)

	s = Solver();
	s.set("timeout", 30000)
	s.add(Distinct(st_1,st_2,st_1_n,st_3,st_4,st_3_n,st_5,st_6,st_5_n,st_7,st_8,st_9,st_8_n,st_10,st_11,st_12,st_11_n,st_13,st_14,st_15,st_14_n,st_16,st_17,st_16_n,st_18,st_19,st_20,st_19_n,st_21,st_22,st_23,st_22_n,st_24,st_25,st_26,st_25_n,st_27,st_26_n,st_28,st_29,st_28_n,st_30,st_31,st_30_n,st_32,st_31_n,st_33,st_34,st_35,st_34_n,st_36,st_37,st_38,st_39,st_38_n,st_40,st_41,st_40_n,st_42,st_43,st_42_n,st_44,st_43_n,st_45,st_46,st_47,st_46_n,st_48,st_49,st_48_n,st_50,st_49_n,st_51,st_50_n,st_52,st_53,st_54,st_55,st_54_n,st_56,st_57,st_56_n,st_58,st_59,st_58_n,st_60,st_59_n,st_61,st_60_n,st_62,st_63,st_62_n,st_64,st_63_n,st_65,st_64_n,st_66,st_67,st_68,st_69,st_68_n,st_70,st_71,st_70_n,st_0,st_71_n))

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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_1 ^ st_1_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_2)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_1_n ^ st_2))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_1)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_1_n ^ st_1))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_3 ^ st_3_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_4)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_3_n ^ st_4))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_3)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_3_n ^ st_3))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_5 ^ st_5_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_6)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_5_n ^ st_6))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_5)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_5_n ^ st_5))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_9)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8 ^ st_9))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8 ^ st_8_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_9)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8_n ^ st_9))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_8)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8_n ^ st_8))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_11 ^ st_12))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_11 ^ st_11_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_11_n ^ st_12))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_11)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_11_n ^ st_11))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_13 ^ st_14))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_14 ^ st_14_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_15)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_14_n ^ st_15))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_14_n ^ st_14))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_17)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16 ^ st_17))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16 ^ st_16_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_17)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16_n ^ st_17))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16_n ^ st_16))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_18)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_18 ^ st_19))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_19 ^ st_19_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_20)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_19_n ^ st_20))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_19)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_19_n ^ st_19))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_22 ^ st_22_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_23)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_22_n ^ st_23))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_22)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_22_n ^ st_22))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_25 ^ st_26))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_25 ^ st_25_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_25_n ^ st_26))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_25)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_25_n ^ st_25))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_26 ^ st_26_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_27)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_26_n ^ st_27))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_26)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_26_n ^ st_26))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_29)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_27 ^ st_29))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_28 ^ st_28_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_29)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_28_n ^ st_29))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_28)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_28_n ^ st_28))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_30 ^ st_31))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_30 ^ st_30_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_30_n ^ st_31))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_30)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_30_n ^ st_30))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_31 ^ st_31_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_32)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_31_n ^ st_32))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_31)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_31_n ^ st_31))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_32)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_32 ^ st_34))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_35)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_34 ^ st_35))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_34 ^ st_34_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_35)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_34_n ^ st_35))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_34)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_34_n ^ st_34))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_27)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_35 ^ st_27))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_36)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_27)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_36 ^ st_27))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_38 ^ st_39))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_38 ^ st_38_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_38_n ^ st_39))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_38)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_38_n ^ st_38))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_41)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_39 ^ st_41))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_40 ^ st_40_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_41)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_40_n ^ st_41))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_40)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_40_n ^ st_40))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_42 ^ st_43))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_42 ^ st_42_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_42_n ^ st_43))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_42)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_42_n ^ st_42))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_43 ^ st_43_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_44)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_43_n ^ st_44))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_43)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_43_n ^ st_43))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_44 ^ st_46))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_46 ^ st_46_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_47)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_46_n ^ st_47))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_46)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_46_n ^ st_46))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_48 ^ st_48_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_48_n ^ st_49))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_48)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_48_n ^ st_48))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_49 ^ st_49_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_49_n ^ st_50))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_49)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_49_n ^ st_49))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_50 ^ st_50_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_51)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_50_n ^ st_51))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_50)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_50_n ^ st_50))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_51)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_52)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_51 ^ st_52))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_51)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_51 ^ st_39))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_52)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_53)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_52 ^ st_53))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_52)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_39)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_52 ^ st_39))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_53)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_53 ^ st_54))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_55)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_54 ^ st_55))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_54 ^ st_54_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_55)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_54_n ^ st_55))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_54)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_54_n ^ st_54))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_55)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_55 ^ st_56))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_55)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_57)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_55 ^ st_57))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_57)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_56 ^ st_57))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_56 ^ st_56_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_57)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_56_n ^ st_57))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_56)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_56_n ^ st_56))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_57)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_57 ^ st_58))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_58 ^ st_59))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_58 ^ st_58_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_58_n ^ st_59))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_58)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_58_n ^ st_58))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_59 ^ st_60))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_59 ^ st_59_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_59_n ^ st_60))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_59)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_59_n ^ st_59))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_61)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_60 ^ st_61))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_60 ^ st_60_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_61)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_60_n ^ st_61))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_60)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_60_n ^ st_60))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_61)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_61 ^ st_62))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_62 ^ st_63))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_62 ^ st_62_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_62_n ^ st_63))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_62)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_62_n ^ st_62))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_63 ^ st_64))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_63 ^ st_63_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_63_n ^ st_64))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_63)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_63_n ^ st_63))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_65)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_64 ^ st_65))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_64 ^ st_64_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_65)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_64_n ^ st_65))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_64)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_64_n ^ st_64))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_65)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_66)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_65 ^ st_66))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_65)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_55)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_65 ^ st_55))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_66)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_67)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_66 ^ st_67))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_66)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_55)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_66 ^ st_55))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_67)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_67 ^ st_68))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_69)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_68 ^ st_69))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_68 ^ st_68_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_69)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_68_n ^ st_69))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_68)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_68_n ^ st_68))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_69)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_69 ^ st_70))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_70 ^ st_71))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_70 ^ st_70_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_70_n ^ st_71))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_70)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_70_n ^ st_70))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_0)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_71 ^ st_0))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71_n)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_71 ^ st_71_n))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_0)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_71_n ^ st_0))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71_n)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_71)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_71_n ^ st_71))) for i in range(bits) ]) ==
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
