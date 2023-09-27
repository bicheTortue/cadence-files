.subckt xbar
R9 netIn0 net12 385785.67136260617
R10 netIn0 net13 624214.3286373939
R11 netIn1 net12 430881.737666724
R12 netIn1 net13 579118.262333276
R13 netBias net12 311213.3173586417
R14 netBias net13 698786.6826413583
XopAmp2 net12 net14 Vcm opAmp
R15 net12 net14 R
R16 net14 net13 R
XopAmp3 net13 net15 Vcm opAmp
R17 net13 net15 Rf

Vpulse6 net0 Vcm DC=0 srcType=pulse val0=0 val1=in0step0 per=0 pw=T td="(T+T/20)*0"
Vpulse7 netIn0 net0 DC=0 srcType=pulse val0=0 val1=in0step1 per=0 pw=T td="(T+T/20)*1"
Vpulse8 net2 Vcm DC=0 srcType=pulse val0=0 val1=in1step0 per=0 pw=T td="(T+T/20)*0"
Vpulse9 netIn1 net2 DC=0 srcType=pulse val0=0 val1=in1step1 per=0 pw=T td="(T+T/20)*1"
Vdc1 Vcm gnd! DC=vdd/2 srcType=dc
Vdc2 netBias gnd! DC=vdd/2+0.1 srcType=dc
.ends xbar
