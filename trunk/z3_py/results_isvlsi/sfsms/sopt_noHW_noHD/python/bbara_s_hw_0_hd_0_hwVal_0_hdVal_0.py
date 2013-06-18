from z3 import *
from math import *
for bits in range(int(ceil(log(20)/log(2))+4),  int(ceil(log(20)/log(2))-1), -1):
	st_st0, st_st0_n, st_st1, st_st4, st_st1_n, st_st2, st_st2_n, st_st3, st_st3_n, st_st7, st_st4_n, st_st5, st_st5_n, st_st6, st_st6_n, st_st7_n, st_st8, st_st8_n, st_st9, st_st9_n = BitVecs('st_st0 st_st0_n st_st1 st_st4 st_st1_n st_st2 st_st2_n st_st3 st_st3_n st_st7 st_st4_n st_st5 st_st5_n st_st6 st_st6_n st_st7_n st_st8 st_st8_n st_st9 st_st9_n',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_st0,st_st0_n,st_st1,st_st4,st_st1_n,st_st2,st_st2_n,st_st3,st_st3_n,st_st7,st_st4_n,st_st5,st_st5_n,st_st6,st_st6_n,st_st7_n,st_st8,st_st8_n,st_st9,st_st9_n))

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
