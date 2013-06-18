from z3 import *
from math import *
for bits in range(int(ceil(log(30)/log(2))+4),  int(ceil(log(30)/log(2))-1), -1):
	st_state_1, st_state_3, st_state_2, st_state_4, st_state_4_n, st_state_5, st_state_6, st_state_7, st_state_9, st_state_8, st_state_15, st_state_10, st_state_14, st_state_11, st_state_12, st_state_20, st_state_13, st_state_16, st_state_17, st_state_18, st_state_19, st_state_21, st_state_22, st_state_23, st_state_24, st_state_25, st_state_26, st_state_27, st_state_2_n, st_state_20_n = BitVecs('st_state_1 st_state_3 st_state_2 st_state_4 st_state_4_n st_state_5 st_state_6 st_state_7 st_state_9 st_state_8 st_state_15 st_state_10 st_state_14 st_state_11 st_state_12 st_state_20 st_state_13 st_state_16 st_state_17 st_state_18 st_state_19 st_state_21 st_state_22 st_state_23 st_state_24 st_state_25 st_state_26 st_state_27 st_state_2_n st_state_20_n',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_state_1,st_state_3,st_state_2,st_state_4,st_state_4_n,st_state_5,st_state_6,st_state_7,st_state_9,st_state_8,st_state_15,st_state_10,st_state_14,st_state_11,st_state_12,st_state_20,st_state_13,st_state_16,st_state_17,st_state_18,st_state_19,st_state_21,st_state_22,st_state_23,st_state_24,st_state_25,st_state_26,st_state_27,st_state_2_n,st_state_20_n))

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
