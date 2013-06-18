from z3 import *
from math import *
for bits in range(int(ceil(log(62)/log(2))+4),  int(ceil(log(62)/log(2))-1), -1):
	st_st0, st_st0_n, st_st5, st_st1, st_st1_n, st_st2, st_st4, st_st3, st_st2_n, st_st3_n, st_st4_n, st_st5_n, st_st31, st_st25, st_st19, st_st6, st_st29, st_st23, st_st17, st_st13, st_st27, st_st21, st_st15, st_st12, st_st10, st_st7, st_st8, st_st7_n, st_st8_n, st_st9, st_st11, st_st10_n, st_st11_n, st_st12_n, st_st13_n, st_st14, st_st14_n, st_st15_n, st_st16, st_st16_n, st_st17_n, st_st18, st_st18_n, st_st19_n, st_st20, st_st20_n, st_st21_n, st_st22, st_st22_n, st_st23_n, st_st24, st_st24_n, st_st25_n, st_st26, st_st26_n, st_st27_n, st_st28, st_st28_n, st_st29_n, st_st30, st_st30_n, st_st31_n = BitVecs('st_st0 st_st0_n st_st5 st_st1 st_st1_n st_st2 st_st4 st_st3 st_st2_n st_st3_n st_st4_n st_st5_n st_st31 st_st25 st_st19 st_st6 st_st29 st_st23 st_st17 st_st13 st_st27 st_st21 st_st15 st_st12 st_st10 st_st7 st_st8 st_st7_n st_st8_n st_st9 st_st11 st_st10_n st_st11_n st_st12_n st_st13_n st_st14 st_st14_n st_st15_n st_st16 st_st16_n st_st17_n st_st18 st_st18_n st_st19_n st_st20 st_st20_n st_st21_n st_st22 st_st22_n st_st23_n st_st24 st_st24_n st_st25_n st_st26 st_st26_n st_st27_n st_st28 st_st28_n st_st29_n st_st30 st_st30_n st_st31_n',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_st0,st_st0_n,st_st5,st_st1,st_st1_n,st_st2,st_st4,st_st3,st_st2_n,st_st3_n,st_st4_n,st_st5_n,st_st31,st_st25,st_st19,st_st6,st_st29,st_st23,st_st17,st_st13,st_st27,st_st21,st_st15,st_st12,st_st10,st_st7,st_st8,st_st7_n,st_st8_n,st_st9,st_st11,st_st10_n,st_st11_n,st_st12_n,st_st13_n,st_st14,st_st14_n,st_st15_n,st_st16,st_st16_n,st_st17_n,st_st18,st_st18_n,st_st19_n,st_st20,st_st20_n,st_st21_n,st_st22,st_st22_n,st_st23_n,st_st24,st_st24_n,st_st25_n,st_st26,st_st26_n,st_st27_n,st_st28,st_st28_n,st_st29_n,st_st30,st_st30_n,st_st31_n))

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
           sys.exit()
        print " "
        sys.stdout.flush()
