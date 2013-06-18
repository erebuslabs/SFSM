from z3 import *
from math import *
for bits in range(int(ceil(log(11)/log(2))+4),  int(ceil(log(11)/log(2))-1), -1):
	st_START, st_init0, st_init1, st_init2, st_init4, st_IOwait, st_read0, st_write0, st_RMACK, st_WMACK, st_read1 = BitVecs('st_START st_init0 st_init1 st_init2 st_init4 st_IOwait st_read0 st_write0 st_RMACK st_WMACK st_read1',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_START,st_init0,st_init1,st_init2,st_init4,st_IOwait,st_read0,st_write0,st_RMACK,st_WMACK,st_read1))

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
