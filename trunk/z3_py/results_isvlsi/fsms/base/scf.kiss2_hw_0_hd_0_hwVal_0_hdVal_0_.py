from z3 import *
from math import *
for bits in range(int(ceil(log(122)/log(2))+6),  int(ceil(log(122)/log(2))-1), -1):
	st_START, st_state1, st_state3, st_state2, st_state4, st_state5, st_state7, st_state6, st_state9, st_state8, st_state17, st_state12, st_state10, st_state11, st_state15, st_state13, st_state29, st_state14, st_state59, st_state16, st_state18, st_state19, st_state21, st_state20, st_state22, st_state23, st_state24, st_state26, st_state25, st_state28, st_state27, st_state36, st_state34, st_state32, st_state30, st_state38, st_state31, st_state37, st_state55, st_state33, st_state57, st_state35, st_state43, st_state41, st_state39, st_state45, st_state40, st_state44, st_state50, st_state42, st_state48, st_state46, st_state47, st_state49, st_state52, st_state51, st_state54, st_state53, st_state56, st_state58, st_state67, st_state60, st_state65, st_state63, st_state61, st_state82, st_state62, st_state83, st_state64, st_state89, st_state66, st_state81, st_state80, st_state78, st_state76, st_state74, st_state72, st_state70, st_state68, st_state96, st_state69, st_state98, st_state71, st_state103, st_state73, st_state107, st_state75, st_state115, st_state77, st_state117, st_state79, st_state84, st_state86, st_state85, st_state88, st_state87, st_state91, st_state90, st_state92, st_state95, st_state93, st_state94, st_state97, st_state101, st_state99, st_state100, st_state102, st_state105, st_state104, st_state106, st_state112, st_state108, st_state110, st_state109, st_state111, st_state114, st_state113, st_state116, st_state118, st_state121, st_state119, st_state120 = BitVecs('st_START st_state1 st_state3 st_state2 st_state4 st_state5 st_state7 st_state6 st_state9 st_state8 st_state17 st_state12 st_state10 st_state11 st_state15 st_state13 st_state29 st_state14 st_state59 st_state16 st_state18 st_state19 st_state21 st_state20 st_state22 st_state23 st_state24 st_state26 st_state25 st_state28 st_state27 st_state36 st_state34 st_state32 st_state30 st_state38 st_state31 st_state37 st_state55 st_state33 st_state57 st_state35 st_state43 st_state41 st_state39 st_state45 st_state40 st_state44 st_state50 st_state42 st_state48 st_state46 st_state47 st_state49 st_state52 st_state51 st_state54 st_state53 st_state56 st_state58 st_state67 st_state60 st_state65 st_state63 st_state61 st_state82 st_state62 st_state83 st_state64 st_state89 st_state66 st_state81 st_state80 st_state78 st_state76 st_state74 st_state72 st_state70 st_state68 st_state96 st_state69 st_state98 st_state71 st_state103 st_state73 st_state107 st_state75 st_state115 st_state77 st_state117 st_state79 st_state84 st_state86 st_state85 st_state88 st_state87 st_state91 st_state90 st_state92 st_state95 st_state93 st_state94 st_state97 st_state101 st_state99 st_state100 st_state102 st_state105 st_state104 st_state106 st_state112 st_state108 st_state110 st_state109 st_state111 st_state114 st_state113 st_state116 st_state118 st_state121 st_state119 st_state120',bits)

	s = Solver();
	s.set("timeout", 600000)
	s.add(Distinct(st_START,st_state1,st_state3,st_state2,st_state4,st_state5,st_state7,st_state6,st_state9,st_state8,st_state17,st_state12,st_state10,st_state11,st_state15,st_state13,st_state29,st_state14,st_state59,st_state16,st_state18,st_state19,st_state21,st_state20,st_state22,st_state23,st_state24,st_state26,st_state25,st_state28,st_state27,st_state36,st_state34,st_state32,st_state30,st_state38,st_state31,st_state37,st_state55,st_state33,st_state57,st_state35,st_state43,st_state41,st_state39,st_state45,st_state40,st_state44,st_state50,st_state42,st_state48,st_state46,st_state47,st_state49,st_state52,st_state51,st_state54,st_state53,st_state56,st_state58,st_state67,st_state60,st_state65,st_state63,st_state61,st_state82,st_state62,st_state83,st_state64,st_state89,st_state66,st_state81,st_state80,st_state78,st_state76,st_state74,st_state72,st_state70,st_state68,st_state96,st_state69,st_state98,st_state71,st_state103,st_state73,st_state107,st_state75,st_state115,st_state77,st_state117,st_state79,st_state84,st_state86,st_state85,st_state88,st_state87,st_state91,st_state90,st_state92,st_state95,st_state93,st_state94,st_state97,st_state101,st_state99,st_state100,st_state102,st_state105,st_state104,st_state106,st_state112,st_state108,st_state110,st_state109,st_state111,st_state114,st_state113,st_state116,st_state118,st_state121,st_state119,st_state120))

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