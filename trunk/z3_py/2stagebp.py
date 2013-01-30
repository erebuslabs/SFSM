from z3 import *
# Create to bit-vectors of size 32
x, y, z, w, p, n = BitVecs('x y z w p n',8)

s = Solver()

s.add(Distinct(x, y, z, w, p, n))

print s.check()


#check that they all have the same number of bits turned on

s.add(
  Sum([((x & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([((y & (2**(i)))/(2**(i))) for i in range(8)])
)
s.add(
  Sum([((x & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([((z & (2**(i)))/(2**(i))) for i in range(8)]))
s.add(
  Sum([((x & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([((w & (2**(i)))/(2**(i))) for i in range(8)])
)
s.add(
  Sum([((x & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([((p & (2**(i)))/(2**(i))) for i in range(8)])
)
s.add(
  Sum([((x & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([((n & (2**(i)))/(2**(i))) for i in range(8)])
)
      

#print Sum([(((x^y) & (2**(i)))/(2**(i))) for i in range(8)])
#check that they all have the same number of bits after xor

s.add(
  Sum([(((x^y) & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([(((y^z) & (2**(i)))/(2**(i))) for i in range(8)])
)
s.add(
  Sum([(((y^z) & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([(((z^w) & (2**(i)))/(2**(i))) for i in range(8)])
)
s.add(
  Sum([(((z^w) & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([(((w^p) & (2**(i)))/(2**(i))) for i in range(8)])
)
s.add(
  Sum([(((w^p) & (2**(i)))/(2**(i))) for i in range(8)]) ==
  Sum([(((p^n) & (2**(i)))/(2**(i))) for i in range(8)])
)

if(s.check() == sat):
  m = s.model()
  print "traversing model..."
  for d in m.decls():
      print "%s = %s" % (d.name(), m[d])
      #print simplify(Sum([((m[d] & (2**(i)))/(2**(i))) for i in range(5)]))
