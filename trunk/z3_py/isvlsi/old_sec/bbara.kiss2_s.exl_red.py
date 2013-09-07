from z3 import *
from math import *
for bits in range(int(ceil(log((20)/log(2))))+6, int(ceil(log(20)/log(2))), -1):
	st0, st0_n, st1, st1_n, st2, st2_n, st3, st3_n, st4, st4_n, st5, st5_n, st6, st6_n, st7, st7_n, st8, st8_n, st9, st9_n = BitVecs('st0 st0_n st1 st1_n st2 st2_n st3 st3_n st4 st4_n st5 st5_n st6 st6_n st7 st7_n st8 st8_n st9 st9_n',bits)

	s = Solver();
	s.add(Distinct(st0,st0_n,st1,st1_n,st2,st2_n,st3,st3_n,st4,st4_n,st5,st5_n,st6,st6_n,st7,st7_n,st8,st8_n,st9,st9_n))

	s.add(
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st0 ^ st0_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st0 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st0 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st0_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st0_n ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st0_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st0_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st0_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st0_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1 ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1 ^ st1_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1 ^ st2) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1_n ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1_n ^ st2) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st2_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st2) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3 ^ st3_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3 ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3_n ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3_n ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st4_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st5) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st5) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st5_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5 ^ st5_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5 ^ st6) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5_n ^ st5) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5_n ^ st6) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6 ^ st6_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6 ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6_n ^ st6) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6_n ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7 ^ st7_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7 ^ st8) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7_n ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7_n ^ st8) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st8_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8 ^ st8_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8 ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8_n ^ st8) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9 ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9 ^ st9_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st0 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9_n ^ st0) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)])
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
