from z3 import *
from math import *
for bits in range(int(ceil(log(37)/log(2))+4),  int(ceil(log(37)/log(2))-1), -1):
	st_st1, st_st2, st_st4, st_st3, st_st1_n, st_st5, st_st6, st_st2_n, st_st7, st_st5_n, st_st8, st_st9, st_st6_n, st_st10, st_10, st_st7_n, st_st11, st_st12, st_st13, st_st9_n, st_st14, st_st15, st_st10_n, st_st16, st_st11_n, st_st12_n, st_st13_n, st_st14_n, st_st17, st_st15_n, st_st16_n, st_st17_n, st_st18, st_st18_n, st_st19, st_st19_n, st_st20 = BitVecs('st_st1 st_st2 st_st4 st_st3 st_st1_n st_st5 st_st6 st_st2_n st_st7 st_st5_n st_st8 st_st9 st_st6_n st_st10 st_10 st_st7_n st_st11 st_st12 st_st13 st_st9_n st_st14 st_st15 st_st10_n st_st16 st_st11_n st_st12_n st_st13_n st_st14_n st_st17 st_st15_n st_st16_n st_st17_n st_st18 st_st18_n st_st19 st_st19_n st_st20',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_st1,st_st2,st_st4,st_st3,st_st1_n,st_st5,st_st6,st_st2_n,st_st7,st_st5_n,st_st8,st_st9,st_st6_n,st_st10,st_10,st_st7_n,st_st11,st_st12,st_st13,st_st9_n,st_st14,st_st15,st_st10_n,st_st16,st_st11_n,st_st12_n,st_st13_n,st_st14_n,st_st17,st_st15_n,st_st16_n,st_st17_n,st_st18,st_st18_n,st_st19,st_st19_n,st_st20))

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
