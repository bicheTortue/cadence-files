.subckt test

M0 AVDD net13 net14 AVDD pch

M1 AVSS net13 net14 AVSS nch 

Resi net14 AVDD  r=16.5

Resi2 net14 AVSS 15MEG

Xname net13 AVDD net1 AVSS inverter
Xsig net1 net2 net1 gnd net2 net13 net14 AVDD sigmoid
Xte2t net2 net1 net14 opAmp
Xtest net1 net2 net13 voltageMult
Xte23 net2 net13 gnd AVSS ahah net3 memcell

Vtest net13 net2 DC=0 srcType=pulse val0=0 val1=1.8 per=T pw="3*(T/2-3)" td=T/4

Vdebilos net14 net1 DC=0.9 srcType=dc
Itest net1 net14 DC=150u

.ends test 
