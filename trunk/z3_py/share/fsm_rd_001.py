from z3 import *
from math import *
for bits in range(28, int(ceil(log(28)/log(2))), -1):
	st1, st10, st11, st12, st13, st14, st15, st15_n, st16, st16_n, st17, st17_n, st18, st19, st19_n, st2, st20, st2_n, st3, st4, st4_n, st5, st6, st6_n, st7, st8, st9, st9_n = BitVecs('st1 st10 st11 st12 st13 st14 st15 st15_n st16 st16_n st17 st17_n st18 st19 st19_n st2 st20 st2_n st3 st4 st4_n st5 st6 st6_n st7 st8 st9 st9_n',bits)

	s = Solver();
	s.add(Distinct(st1,st10,st11,st12,st13,st14,st15,st15_n,st16,st16_n,st17,st17_n,st18,st19,st19_n,st2,st20,st2_n,st3,st4,st4_n,st5,st6,st6_n,st7,st8,st9,st9_n))

	s.add(
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1 ^ st2) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st20 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st1 ^ st20) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st10 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st11 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st10 ^ st11) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st11 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st10 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st11 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st11 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st12 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st11 ^ st12) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st12 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st13 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st12 ^ st13) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st13 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st14 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st13 ^ st14) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st14 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st13 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st14 ^ st13) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st14 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st15 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st14 ^ st15) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st15 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st15_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st15 ^ st15_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st15 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st16 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st15 ^ st16) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st15_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st15 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st15_n ^ st15) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st15_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st16 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st15_n ^ st16) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st16 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st16_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st16 ^ st16_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st16 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st17 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st16 ^ st17) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st16_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st16 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st16_n ^ st16) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st16_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st17 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st16_n ^ st17) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st17 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st17_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st17 ^ st17_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st17 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st18 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st17 ^ st18) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st17_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st17 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st17_n ^ st17) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st17_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st18 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st17_n ^ st18) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st18 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st17 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st18 ^ st17) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st18 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st19 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st18 ^ st19) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st19 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st19_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st19 ^ st19_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st19 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st20 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st19 ^ st20) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st19_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st19 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st19_n ^ st19) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st19_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st20 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st19_n ^ st20) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st2_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2 ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st20 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st20 ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st1 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st1) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st2) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st2_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st2_n ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st2 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3 ^ st2) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st3 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st4_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4 ^ st5) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st3 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st3) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st4_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st4_n ^ st5) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st4 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5 ^ st4) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st5 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st5 ^ st6) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6 ^ st6_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6 ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st6 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6_n ^ st6) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st6_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st6_n ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st7 ^ st8) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st7 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8 ^ st7) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st8 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st8 ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st10 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9 ^ st9_n) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st10 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9_n ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([((st9_n & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([((st9 & (2**(i)))/(2**(i))) for i in range(bits)])
	)
	s.add(
	Sum([(((st9_n ^ st9) & (2**(i)))/(2**(i))) for i in range(bits)]) ==
	Sum([(((st9 ^ st10) & (2**(i)))/(2**(i))) for i in range(bits)])
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
           break
        print " "
