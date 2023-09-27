.subckt ptWise
XvoltMult3 inputG0 cellStateG0 net132 voltageMult
Xbuffer13 net133 net133 net132 opAmp
R413 net133 net134 R1
XvoltMult4 forgetG0 cellStateOld net135 voltageMult
Xbuffer14 net136 net136 net135 opAmp
R414 net136 net134 R1
XopAmp18 net134 net137 Vcm opAmp
R415 net134 net137 R2
Xbuffer15 cellStateCur cellStateCur net137 opAmp
Xmemcell16 m0p2 m0p1 0 cellStateCur cellStateOld vdd! memcell
Xmemcell17 m1p2 m1p1 0 cellStateCur cellStateOld vdd! memcell
Xmemcell18 m2p2 m2p1 0 cellStateCur cellStateOld vdd! memcell
Xmemcell19 m3p2 m3p1 0 cellStateCur cellStateOld vdd! memcell
Xtanh3 V1 V2 V3t net134 net138 0 idc vdd! tanh
Xbuffer16 net139 net139 net138 opAmp
XvoltMult5 outputG0 net139 net140 voltageMult
Xbuffer17 net141 net141 net140 opAmp
R416 net141 net142 R3
XopAmp19 net142 net143 Vcm opAmp
R417 net142 net143 R4
Xmemcell20 m0p2 predEn 0 net143 net144 vdd! memcell
Xmemcell21 m0p2 nextT 0 net143 net145 vdd! memcell
Xmemcell22 nextT xbarEn 0 net145 netHid0 vdd! memcell
Xmemcell23 m1p2 predEn 0 net143 net146 vdd! memcell
Xmemcell24 m1p2 nextT 0 net143 net147 vdd! memcell
Xmemcell25 nextT xbarEn 0 net147 netHid1 vdd! memcell
Xmemcell26 m2p2 predEn 0 net143 net148 vdd! memcell
Xmemcell27 m2p2 nextT 0 net143 net149 vdd! memcell
Xmemcell28 nextT xbarEn 0 net149 netHid2 vdd! memcell
Xmemcell29 m3p2 predEn 0 net143 net150 vdd! memcell
Xmemcell30 m3p2 nextT 0 net143 net151 vdd! memcell
Xmemcell31 nextT xbarEn 0 net151 netHid3 vdd! memcell
Vdc0 vdd! 0 DC=vdd srcType=dc
Vdc1 Vcm 0 DC=vdd/2 srcType=dc
Vdc2 V3t 0 DC=0.55 srcType=dc
Vdc3 V3s 0 DC=0.8 srcType=dc
Vdc4 V2 0 DC=0.635 srcType=dc
Vdc5 V1 0 DC=1.1 srcType=dc
Vdc6 netBias Vcm DC=0.1 srcType=dc
Idc0 vdd! idc DC=150u srcType=dc
Vpulse0 nextT 0 DC=0 srcType=pulse val0=0 val1=vdd per=T+T/20 pw=T/20 td=T
Vpulse1 predEn 0 DC=0 srcType=pulse val0=0 val1=vdd per=0 pw=3*T/40 td="(T+T/20)*2"
Vpulse2 xbarEn 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T td="(T+T/20)"
Vpulse3 m0p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=0*T/4
Vpulse4 m0p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+0*T/4
Vpulse6 m1p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=1*T/4
Vpulse7 m1p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+1*T/4
Vpulse9 m2p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=2*T/4
Vpulse10 m2p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+2*T/4
Vpulse12 m3p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=3*T/4
Vpulse13 m3p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+3*T/4
Vpulse15 net152 Vcm DC=0 srcType=pulse val0=0 val1=in0step0 per=0 pw=T td="(T+T/20)*0"
Vpulse16 netIn0 net152 DC=0 srcType=pulse val0=0 val1=in0step1 per=0 pw=T td="(T+T/20)*1"
.ends ptWise
