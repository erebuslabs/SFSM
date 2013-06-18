from z3 import *
from math import *
for bits in range(int(ceil(log(32)/log(2))+4),  int(ceil(log(32)/log(2))-1), -1):
	st_st0, st_st5, st_st1, st_st2, st_st4, st_st3, st_st31, st_st25, st_st19, st_st6, st_st29, st_st23, st_st17, st_st13, st_st27, st_st21, st_st15, st_st12, st_st10, st_st7, st_st8, st_st9, st_st11, st_st14, st_st16, st_st18, st_st20, st_st22, st_st24, st_st26, st_st28, st_st30 = BitVecs('st_st0 st_st5 st_st1 st_st2 st_st4 st_st3 st_st31 st_st25 st_st19 st_st6 st_st29 st_st23 st_st17 st_st13 st_st27 st_st21 st_st15 st_st12 st_st10 st_st7 st_st8 st_st9 st_st11 st_st14 st_st16 st_st18 st_st20 st_st22 st_st24 st_st26 st_st28 st_st30',bits)

	s = Solver();
	s.set("timeout", 300000)
	s.add(Distinct(st_st0,st_st5,st_st1,st_st2,st_st4,st_st3,st_st31,st_st25,st_st19,st_st6,st_st29,st_st23,st_st17,st_st13,st_st27,st_st21,st_st15,st_st12,st_st10,st_st7,st_st8,st_st9,st_st11,st_st14,st_st16,st_st18,st_st20,st_st22,st_st24,st_st26,st_st28,st_st30))

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
