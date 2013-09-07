from z3 import *
from math import *
for bits in range(int(ceil(log(17)/log(2))+4),  int(ceil(log(17)/log(2))-1), -1):
	st_1, st_2, st_3, st_4, st_5, st_6, st_7, st_8, st_9, st_12, st_10, st_11, st_13, st_14, st_15, st_16, st_0 = BitVecs('st_1 st_2 st_3 st_4 st_5 st_6 st_7 st_8 st_9 st_12 st_10 st_11 st_13 st_14 st_15 st_16 st_0',bits)

	s = Solver();
	s.set("timeout", 30000)
	s.add(Distinct(st_1,st_2,st_3,st_4,st_5,st_6,st_7,st_8,st_9,st_12,st_10,st_11,st_13,st_14,st_15,st_16,st_0))

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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_4)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_4)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_4 ^ st_4))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_6)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_6)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_6 ^ st_6))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_8 ^ st_12))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_9)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_9 ^ st_12))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_12)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_10 ^ st_12))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_13 ^ st_14))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_13)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_13 ^ st_13))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_14)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_14 ^ st_14))) for i in range(bits) ]) ==
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
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_7)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_15 ^ st_7))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_0)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16 ^ st_0))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_0 ^ st_1))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_16)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_6)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_16 ^ st_6))) for i in range(bits) ]) ==
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
