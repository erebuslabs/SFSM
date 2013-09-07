from z3 import *
from math import *
for bits in range(int(ceil(log(23)/log(2))+4),  int(ceil(log(23)/log(2))-1), -1):
	st_st11, st_st11_n, st_st10, st_st4, st_st10_n, st_st12, st_st7, st_st6, st_st1, st_st0, st_st0_n, st_st8, st_st9, st_st9_n, st_st3, st_st2, st_st2_n, st_st4_n, st_st5, st_st5_n, st_st13, st_st14, st_st15 = BitVecs('st_st11 st_st11_n st_st10 st_st4 st_st10_n st_st12 st_st7 st_st6 st_st1 st_st0 st_st0_n st_st8 st_st9 st_st9_n st_st3 st_st2 st_st2_n st_st4_n st_st5 st_st5_n st_st13 st_st14 st_st15',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_st11,st_st11_n,st_st10,st_st4,st_st10_n,st_st12,st_st7,st_st6,st_st1,st_st0,st_st0_n,st_st8,st_st9,st_st9_n,st_st3,st_st2,st_st2_n,st_st4_n,st_st5,st_st5_n,st_st13,st_st14,st_st15))

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