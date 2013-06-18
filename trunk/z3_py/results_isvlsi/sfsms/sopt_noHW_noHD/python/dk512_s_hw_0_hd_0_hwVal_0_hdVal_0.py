from z3 import *
from math import *
for bits in range(int(ceil(log(15)/log(2))+4),  int(ceil(log(15)/log(2))-1), -1):
	st_state_1, st_state_8, st_state_2, st_state_4, st_state_3, st_state_5, st_state_6, st_state_13, st_state_7, st_state_9, st_state_10, st_state_11, st_state_12, st_state_14, st_state_15 = BitVecs('st_state_1 st_state_8 st_state_2 st_state_4 st_state_3 st_state_5 st_state_6 st_state_13 st_state_7 st_state_9 st_state_10 st_state_11 st_state_12 st_state_14 st_state_15',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_state_1,st_state_8,st_state_2,st_state_4,st_state_3,st_state_5,st_state_6,st_state_13,st_state_7,st_state_9,st_state_10,st_state_11,st_state_12,st_state_14,st_state_15))

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
