.subckt truc
R0 netIn0 net2 300000.0
R1 netIn0 net3 710000.0
R2 netHid0 net2 400000.0
R3 netHid0 net3 610000.0
R4 netHid1 net2 630000.0
R5 netHid1 net3 380000.0
R6 netHid2 net2 630000.0
R7 netHid2 net3 380000.0
R8 netHid3 net2 630000.0
R9 netHid3 net3 380000.0
R10 netBias net2 420000.0
R11 netBias net3 590000.0
M0 net2 e0 net0 net0 nch
M1 net0 ne0 net2 net2 pch
M2 net3 e0 net1 net1 nch
M3 net1 ne0 net3 net3 pch
R12 netIn0 net4 300000.0
R13 netIn0 net5 710000.0
R14 netHid0 net4 400000.0
R15 netHid0 net5 610000.0
R16 netHid1 net4 630000.0
R17 netHid1 net5 380000.0
R18 netHid2 net4 630000.0
R19 netHid2 net5 380000.0
R20 netHid3 net4 630000.0
R21 netHid3 net5 380000.0
R22 netBias net4 430000.0
R23 netBias net5 580000.0
M4 net4 e1 net0 net0 nch
M5 net0 ne1 net4 net4 pch
M6 net5 e1 net1 net1 nch
M7 net1 ne1 net5 net5 pch
R24 netIn0 net6 300000.0
R25 netIn0 net7 710000.0
R26 netHid0 net6 400000.0
R27 netHid0 net7 610000.0
R28 netHid1 net6 630000.0
R29 netHid1 net7 380000.0
R30 netHid2 net6 630000.0
R31 netHid2 net7 380000.0
R32 netHid3 net6 630000.0
R33 netHid3 net7 380000.0
R34 netBias net6 430000.0
R35 netBias net7 580000.0
M8 net6 e2 net0 net0 nch
M9 net0 ne2 net6 net6 pch
M10 net7 e2 net1 net1 nch
M11 net1 ne2 net7 net7 pch
R36 netIn0 net8 300000.0
R37 netIn0 net9 710000.0
R38 netHid0 net8 400000.0
R39 netHid0 net9 610000.0
R40 netHid1 net8 630000.0
R41 netHid1 net9 380000.0
R42 netHid2 net8 630000.0
R43 netHid2 net9 380000.0
R44 netHid3 net8 630000.0
R45 netHid3 net9 380000.0
R46 netBias net8 430000.0
R47 netBias net9 580000.0
M12 net8 e3 net0 net0 nch
M13 net0 ne3 net8 net8 pch
M14 net9 e3 net1 net1 nch
M15 net1 ne3 net9 net9 pch
XopAmp0 net0 net10 Vcm opAmp
R48 net0 net10 R
R49 net10 net1 R
XopAmp1 net1 net11 Vcm opAmp
R50 net1 net11 Rf
R51 netIn0 net14 300000.0
R52 netIn0 net15 710000.0
R53 netHid0 net14 400000.0
R54 netHid0 net15 610000.0
R55 netHid1 net14 630000.0
R56 netHid1 net15 380000.0
R57 netHid2 net14 630000.0
R58 netHid2 net15 380000.0
R59 netHid3 net14 630000.0
R60 netHid3 net15 380000.0
R61 netBias net14 450000.0
R62 netBias net15 560000.0
M16 net14 e0 net12 net12 nch
M17 net12 ne0 net14 net14 pch
M18 net15 e0 net13 net13 nch
M19 net13 ne0 net15 net15 pch
R63 netIn0 net16 300000.0
R64 netIn0 net17 710000.0
R65 netHid0 net16 400000.0
R66 netHid0 net17 610000.0
R67 netHid1 net16 630000.0
R68 netHid1 net17 380000.0
R69 netHid2 net16 630000.0
R70 netHid2 net17 380000.0
R71 netHid3 net16 630000.0
R72 netHid3 net17 380000.0
R73 netBias net16 460000.0
R74 netBias net17 550000.0
M20 net16 e1 net12 net12 nch
M21 net12 ne1 net16 net16 pch
M22 net17 e1 net13 net13 nch
M23 net13 ne1 net17 net17 pch
R75 netIn0 net18 300000.0
R76 netIn0 net19 710000.0
R77 netHid0 net18 400000.0
R78 netHid0 net19 610000.0
R79 netHid1 net18 630000.0
R80 netHid1 net19 380000.0
R81 netHid2 net18 630000.0
R82 netHid2 net19 380000.0
R83 netHid3 net18 630000.0
R84 netHid3 net19 380000.0
R85 netBias net18 460000.0
R86 netBias net19 550000.0
M24 net18 e2 net12 net12 nch
M25 net12 ne2 net18 net18 pch
M26 net19 e2 net13 net13 nch
M27 net13 ne2 net19 net19 pch
R87 netIn0 net20 300000.0
R88 netIn0 net21 710000.0
R89 netHid0 net20 400000.0
R90 netHid0 net21 610000.0
R91 netHid1 net20 630000.0
R92 netHid1 net21 380000.0
R93 netHid2 net20 630000.0
R94 netHid2 net21 380000.0
R95 netHid3 net20 630000.0
R96 netHid3 net21 380000.0
R97 netBias net20 460000.0
R98 netBias net21 550000.0
M28 net20 e3 net12 net12 nch
M29 net12 ne3 net20 net20 pch
M30 net21 e3 net13 net13 nch
M31 net13 ne3 net21 net21 pch
XopAmp2 net12 net22 Vcm opAmp
R99 net12 net22 R
R100 net22 net13 R
XopAmp3 net13 net23 Vcm opAmp
R101 net13 net23 Rf
R102 netIn0 net26 300000.0
R103 netIn0 net27 710000.0
R104 netHid0 net26 400000.0
R105 netHid0 net27 610000.0
R106 netHid1 net26 630000.0
R107 netHid1 net27 380000.0
R108 netHid2 net26 630000.0
R109 netHid2 net27 380000.0
R110 netHid3 net26 630000.0
R111 netHid3 net27 380000.0
R112 netBias net26 500000.0
R113 netBias net27 510000.0
M32 net26 e0 net24 net24 nch
M33 net24 ne0 net26 net26 pch
M34 net27 e0 net25 net25 nch
M35 net25 ne0 net27 net27 pch
R114 netIn0 net28 710000.0
R115 netIn0 net29 300000.0
R116 netHid0 net28 400000.0
R117 netHid0 net29 610000.0
R118 netHid1 net28 630000.0
R119 netHid1 net29 380000.0
R120 netHid2 net28 630000.0
R121 netHid2 net29 380000.0
R122 netHid3 net28 630000.0
R123 netHid3 net29 380000.0
R124 netBias net28 510000.0
R125 netBias net29 500000.0
M36 net28 e1 net24 net24 nch
M37 net24 ne1 net28 net28 pch
M38 net29 e1 net25 net25 nch
M39 net25 ne1 net29 net29 pch
R126 netIn0 net30 710000.0
R127 netIn0 net31 300000.0
R128 netHid0 net30 400000.0
R129 netHid0 net31 610000.0
R130 netHid1 net30 630000.0
R131 netHid1 net31 380000.0
R132 netHid2 net30 630000.0
R133 netHid2 net31 380000.0
R134 netHid3 net30 630000.0
R135 netHid3 net31 380000.0
R136 netBias net30 510000.0
R137 netBias net31 500000.0
M40 net30 e2 net24 net24 nch
M41 net24 ne2 net30 net30 pch
M42 net31 e2 net25 net25 nch
M43 net25 ne2 net31 net31 pch
R138 netIn0 net32 710000.0
R139 netIn0 net33 300000.0
R140 netHid0 net32 400000.0
R141 netHid0 net33 610000.0
R142 netHid1 net32 630000.0
R143 netHid1 net33 380000.0
R144 netHid2 net32 630000.0
R145 netHid2 net33 380000.0
R146 netHid3 net32 630000.0
R147 netHid3 net33 380000.0
R148 netBias net32 510000.0
R149 netBias net33 500000.0
M44 net32 e3 net24 net24 nch
M45 net24 ne3 net32 net32 pch
M46 net33 e3 net25 net25 nch
M47 net25 ne3 net33 net33 pch
XopAmp4 net24 net34 Vcm opAmp
R150 net24 net34 R
R151 net34 net25 R
XopAmp5 net25 net35 Vcm opAmp
R152 net25 net35 Rf
R153 netIn0 net38 300000.0
R154 netIn0 net39 710000.0
R155 netHid0 net38 400000.0
R156 netHid0 net39 610000.0
R157 netHid1 net38 630000.0
R158 netHid1 net39 380000.0
R159 netHid2 net38 630000.0
R160 netHid2 net39 380000.0
R161 netHid3 net38 630000.0
R162 netHid3 net39 380000.0
R163 netBias net38 390000.0
R164 netBias net39 620000.0
M48 net38 e0 net36 net36 nch
M49 net36 ne0 net38 net38 pch
M50 net39 e0 net37 net37 nch
M51 net37 ne0 net39 net39 pch
R165 netIn0 net40 300000.0
R166 netIn0 net41 710000.0
R167 netHid0 net40 400000.0
R168 netHid0 net41 610000.0
R169 netHid1 net40 630000.0
R170 netHid1 net41 380000.0
R171 netHid2 net40 630000.0
R172 netHid2 net41 380000.0
R173 netHid3 net40 630000.0
R174 netHid3 net41 380000.0
R175 netBias net40 440000.0
R176 netBias net41 570000.0
M52 net40 e1 net36 net36 nch
M53 net36 ne1 net40 net40 pch
M54 net41 e1 net37 net37 nch
M55 net37 ne1 net41 net41 pch
R177 netIn0 net42 300000.0
R178 netIn0 net43 710000.0
R179 netHid0 net42 400000.0
R180 netHid0 net43 610000.0
R181 netHid1 net42 630000.0
R182 netHid1 net43 380000.0
R183 netHid2 net42 630000.0
R184 netHid2 net43 380000.0
R185 netHid3 net42 630000.0
R186 netHid3 net43 380000.0
R187 netBias net42 440000.0
R188 netBias net43 570000.0
M56 net42 e2 net36 net36 nch
M57 net36 ne2 net42 net42 pch
M58 net43 e2 net37 net37 nch
M59 net37 ne2 net43 net43 pch
R189 netIn0 net44 300000.0
R190 netIn0 net45 710000.0
R191 netHid0 net44 400000.0
R192 netHid0 net45 610000.0
R193 netHid1 net44 630000.0
R194 netHid1 net45 380000.0
R195 netHid2 net44 630000.0
R196 netHid2 net45 380000.0
R197 netHid3 net44 630000.0
R198 netHid3 net45 380000.0
R199 netBias net44 440000.0
R200 netBias net45 570000.0
M60 net44 e3 net36 net36 nch
M61 net36 ne3 net44 net44 pch
M62 net45 e3 net37 net37 nch
M63 net37 ne3 net45 net45 pch
XopAmp6 net36 net46 Vcm opAmp
R201 net36 net46 R
R202 net46 net37 R
XopAmp7 net37 net47 Vcm opAmp
R203 net37 net47 Rf
Idc0 vdd! net49 DC=150u srcType=dc
Xsig0 V1 V2 V3s net11 net48 0 net49 vdd! sigmoid
Xbuffer0 inputG0 inputG0 net48 opAmp
Idc1 vdd! net51 DC=150u srcType=dc
Xsig1 V1 V2 V3s net23 net50 0 net51 vdd! sigmoid
Xbuffer1 forgetG0 forgetG0 net50 opAmp
Idc2 vdd! net53 DC=150u srcType=dc
Xtanh0 V1 V2 V3t net35 net52 0 net53 vdd! tanh
Xbuffer2 cellStateG0 cellStateG0 net52 opAmp
Idc3 vdd! net55 DC=150u srcType=dc
Xsig2 V1 V2 V3s net47 net54 0 net55 vdd! sigmoid
Xbuffer3 outputG0 outputG0 net54 opAmp
XvoltMult0 inputG0 cellStateG0 net56 voltageMult
R204 net56 net57 R1
XvoltMult1 forgetG0 cellStateOld0 net58 voltageMult
R205 net58 net57 R1
XopAmp8 net57 cellStateCur0 Vcm opAmp
R206 net57 cellStateCur0 R2
Xmemcell0 m0p2 nextT 0 cellStateCur0 net59 vdd! memcell
Xmemcell1 nextT e0 0 net59 cellStateOld0 vdd! memcell
Xmemcell2 m1p2 nextT 0 cellStateCur0 net60 vdd! memcell
Xmemcell3 nextT e1 0 net60 cellStateOld0 vdd! memcell
Xmemcell4 m2p2 nextT 0 cellStateCur0 net61 vdd! memcell
Xmemcell5 nextT e2 0 net61 cellStateOld0 vdd! memcell
Xmemcell6 m3p2 nextT 0 cellStateCur0 net62 vdd! memcell
Xmemcell7 nextT e3 0 net62 cellStateOld0 vdd! memcell
Idc4 vdd! net64 DC=150u srcType=dc
Xtanh1 V1 V2 V3t cellStateCur0 net63 0 net64 vdd! tanh
Xbuffer4 net65 net65 net63 opAmp
XvoltMult2 outputG0 net65 net66 voltageMult
R207 net66 net67 R3
XopAmp9 net67 net68 Vcm opAmp
R208 net67 net68 R4
Xmemcell8 m0p2 predEn 0 net68 net69 vdd! memcell
Xmemcell9 m0p2 nextT 0 net68 net70 vdd! memcell
Xmemcell10 nextT xbarEn 0 net70 netHid0 vdd! memcell
Xmemcell11 m1p2 predEn 0 net68 net71 vdd! memcell
Xmemcell12 m1p2 nextT 0 net68 net72 vdd! memcell
Xmemcell13 nextT xbarEn 0 net72 netHid1 vdd! memcell
Xmemcell14 m2p2 predEn 0 net68 net73 vdd! memcell
Xmemcell15 m2p2 nextT 0 net68 net74 vdd! memcell
Xmemcell16 nextT xbarEn 0 net74 netHid2 vdd! memcell
Xmemcell17 m3p2 predEn 0 net68 net75 vdd! memcell
Xmemcell18 m3p2 nextT 0 net68 net76 vdd! memcell
Xmemcell19 nextT xbarEn 0 net76 netHid3 vdd! memcell
R209 net69 net77 80000.0
R210 net69 net78 930000.0
R211 net71 net77 870000.0
R212 net71 net78 140000.0
R213 net73 net77 870000.0
R214 net73 net78 140000.0
R215 net75 net77 870000.0
R216 net75 net78 140000.0
R217 netBias net77 500000.0
R218 netBias net78 510000.0
XopAmp10 net77 net79 Vcm opAmp
R219 net77 net79 R
R220 net79 net78 R
XopAmp11 net78 net80 Vcm opAmp
R221 net78 net80 Rf
Vdc0 vdd! 0 DC=vdd srcType=dc
Vdc1 Vcm 0 DC=vdd/2 srcType=dc
Vdc2 V3t 0 DC=V3t srcType=dc
Vdc3 V3s 0 DC=V3s srcType=dc
Vdc4 V2 0 DC=V2 srcType=dc
Vdc5 V1 0 DC=V1 srcType=dc
Vdc6 netBias Vcm DC=0.1 srcType=dc
Vpulse0 nextT 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/8 td=T*4
Vpulse1 predEn 0 DC=0 srcType=pulse val0=0 val1=vdd per=0 pw=T/2 td="(T*4+T/8)*2"
Vpulse2 xbarEn 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T*4 td=0
Vpulse3 m0p1 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=0*T
Vpulse4 m0p2 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=0*T+T/2
Vpulse5 e0 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T td=0*T
Xinverter0 0 e0 ne0 vdd! inverter
Vpulse6 m1p1 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=1*T
Vpulse7 m1p2 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=1*T+T/2
Vpulse8 e1 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T td=1*T
Xinverter1 0 e1 ne1 vdd! inverter
Vpulse9 m2p1 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=2*T
Vpulse10 m2p2 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=2*T+T/2
Vpulse11 e2 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T td=2*T
Xinverter2 0 e2 ne2 vdd! inverter
Vpulse12 m3p1 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=3*T
Vpulse13 m3p2 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T/2-T/16 td=3*T+T/2
Vpulse14 e3 0 DC=0 srcType=pulse val0=0 val1=vdd per=T*4+T/8 pw=T td=3*T
Xinverter3 0 e3 ne3 vdd! inverter
Vpulse15 net81 Vcm DC=0 srcType=pulse val0=0 val1=in0step0 per=0 pw=T*4 td="(T*4+T/2)*0"
Vpulse16 netIn0 net81 DC=0 srcType=pulse val0=0 val1=in0step1 per=0 pw=T*4 td="(T*4+T/2)*1"
.ends truc
