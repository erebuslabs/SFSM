from z3 import *
# Create to bit-vectors of size 32
x, y ,z , w, p, n = BitVecs('x y z w p n',4)

s = Solver()
#X = [ Int('x%s' % i) for i in range(4) ]
s.add(x != y, x != z, x != w, x != p, x !=n)
s.add(y != z, y != w, y != p, y != n)
s.add(z != w, z != p, z !=n)
s.add(w != p, w != n)
s.add(p != n)
print s.check()


#check that they all have the same number of bits turned on
#for i in range(5):
#  print (10 & (2**(i)))/(2**(i))

s.add(Sum([((x & (2**(i)))/(2**(i))) for i in range(4)])==Sum([((y & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([((x & (2**(i)))/(2**(i))) for i in range(4)])==Sum([((z & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([((x & (2**(i)))/(2**(i))) for i in range(4)])==Sum([((w & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([((x & (2**(i)))/(2**(i))) for i in range(4)])==Sum([((p & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([((x & (2**(i)))/(2**(i))) for i in range(4)])==Sum([((n & (2**(i)))/(2**(i))) for i in range(4)]))
      

#print Sum([(((x^y) & (2**(i)))/(2**(i))) for i in range(4)])
#check that they all have the same number of bits after xor
s.add(Sum([(((x^y) & (2**(i)))/(2**(i))) for i in range(4)])==Sum([(((y^z) & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([(((y^z) & (2**(i)))/(2**(i))) for i in range(4)])==Sum([(((z^w) & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([(((z^w) & (2**(i)))/(2**(i))) for i in range(4)])==Sum([(((w^p) & (2**(i)))/(2**(i))) for i in range(4)]))
s.add(Sum([(((w^p) & (2**(i)))/(2**(i))) for i in range(4)])==Sum([(((p^n) & (2**(i)))/(2**(i))) for i in range(4)]))

if(s.check() == sat):
  m = s.model()
  print "traversing model..."
  for d in m.decls():
      print "%s = %s" % (d.name(), m[d])
      #print simplify(Sum([((m[d] & (2**(i)))/(2**(i))) for i in range(5)]))
