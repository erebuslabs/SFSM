from z3 import *
from math import *
for bits in range(int(ceil(log(4)/log(2))+4),  int(ceil(log(4)/log(2))-1), -1):
	st_HG, st_HY, st_FG, st_FY = BitVecs('st_HG st_HY st_FG st_FY',bits)

	s = Solver();
	s.set("timeout", 30000)
	s.add(Distinct(st_HG,st_HY,st_FG,st_FY))

	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HG)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HG)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_HG ^ st_HG))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HG)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HY)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_HG ^ st_HY))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HY)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HY)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_HY ^ st_HY))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HY)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FG)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_HY ^ st_FG))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FG)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FG)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FG ^ st_FG))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FG)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FY)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FG ^ st_FY))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FY)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FY)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_FY))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_FY)) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,st_HG)) for i in range(bits) ])
	)
	s.add(
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ]) ==
	Sum([ ZeroExt(int(ceil(log(bits)/log(2))+1), Extract(i,i,(st_FY ^ st_HG))) for i in range(bits) ])
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
