.subckt lstm
R209 netIn0 net82 338587.38200714474
R210 netIn0 net83 671412.6179928553
R211 netHid0 net82 612579.3353427042
R212 netHid0 net83 397420.6646572958
R213 netHid1 net82 563481.1435035798
R214 netHid1 net83 446518.8564964202
R215 netHid2 net82 417761.2078892202
R216 netHid2 net83 592238.7921107798
R217 netHid3 net82 456503.2409093206
R218 netHid3 net83 553496.7590906795
R219 netBias net82 313162.9039228221
R220 netBias net83 696837.0960771779
M64 net82 e0 net80 net80 nch
M65 net80 ne0 net82 net82 pch
M66 net83 e0 net81 net81 nch
M67 net81 ne0 net83 net83 pch
R221 netIn0 net84 339975.14032578206
R222 netIn0 net85 670024.8596742179
R223 netHid0 net84 585307.3558711095
R224 netHid0 net85 424692.6441288905
R225 netHid1 net84 673975.0973149337
R226 netHid1 net85 336024.90268506634
R227 netHid2 net84 412149.6967740112
R228 netHid2 net85 597850.3032259888
R229 netHid3 net84 548720.1640273922
R230 netHid3 net85 461279.83597260783
R231 netBias net84 271419.4235471963
R232 netBias net85 738580.5764528037
M68 net84 e1 net80 net80 nch
M69 net80 ne1 net84 net84 pch
M70 net85 e1 net81 net81 nch
M71 net81 ne1 net85 net85 pch
R233 netIn0 net86 493864.57630773436
R234 netIn0 net87 516135.42369226564
R235 netHid0 net86 334613.1154331377
R236 netHid0 net87 675386.8845668624
R237 netHid1 net86 372995.1660308459
R238 netHid1 net87 637004.8339691542
R239 netHid2 net86 407473.726194136
R240 netHid2 net87 602526.2738058639
R241 netHid3 net86 279992.42678068165
R242 netHid3 net87 730007.5732193184
R243 netBias net86 292524.7978325378
R244 netBias net87 717475.2021674622
M72 net86 e2 net80 net80 nch
M73 net80 ne2 net86 net86 pch
M74 net87 e2 net81 net81 nch
M75 net81 ne2 net87 net87 pch
R245 netIn0 net88 395994.72928871645
R246 netIn0 net89 614005.2707112835
R247 netHid0 net88 534083.0345126609
R248 netHid0 net89 475916.96548733907
R249 netHid1 net88 580492.59301764
R250 netHid1 net89 429507.40698235994
R251 netHid2 net88 299265.66573954036
R252 netHid2 net89 710734.3342604596
R253 netHid3 net88 509617.0728911497
R254 netHid3 net89 500382.9271088503
R255 netBias net88 259762.3634994428
R256 netBias net89 750237.6365005572
M76 net88 e3 net80 net80 nch
M77 net80 ne3 net88 net88 pch
M78 net89 e3 net81 net81 nch
M79 net81 ne3 net89 net89 pch
XopAmp10 net80 net90 Vcm opAmp
R257 net80 net90 R
R258 net90 net81 R
XopAmp11 net81 net91 Vcm opAmp
R259 net81 net91 Rf
R260 netIn0 net94 317460.96529668197
R261 netIn0 net95 692539.034703318
R262 netHid0 net94 522744.61635015765
R263 netHid0 net95 487255.38364984235
R264 netHid1 net94 555561.2048034519
R265 netHid1 net95 454438.7951965481
R266 netHid2 net94 428256.6326209192
R267 netHid2 net95 581743.3673790807
R268 netHid3 net94 513784.7182335448
R269 netHid3 net95 496215.2817664552
R270 netBias net94 616408.3310298143
R271 netBias net95 393591.6689701857
M80 net94 e0 net92 net92 nch
M81 net92 ne0 net94 net94 pch
M82 net95 e0 net93 net93 nch
M83 net93 ne0 net95 net95 pch
R272 netIn0 net96 343833.8625593539
R273 netIn0 net97 666166.1374406461
R274 netHid0 net96 570544.1197283524
R275 netHid0 net97 439455.8802716476
R276 netHid1 net96 573282.6002591139
R277 netHid1 net97 436717.39974088606
R278 netHid2 net96 449394.7452191324
R279 netHid2 net97 560605.2547808676
R280 netHid3 net96 653712.9741379898
R281 netHid3 net97 356287.0258620102
R282 netBias net96 655992.190020329
R283 netBias net97 354007.80997967103
M84 net96 e1 net92 net92 nch
M85 net92 ne1 net96 net96 pch
M86 net97 e1 net93 net93 nch
M87 net93 ne1 net97 net97 pch
R284 netIn0 net98 421824.8543034122
R285 netIn0 net99 588175.1456965879
R286 netHid0 net98 502615.4468798906
R287 netHid0 net99 507384.5531201094
R288 netHid1 net98 264593.74257317954
R289 netHid1 net99 745406.2574268205
R290 netHid2 net98 466301.609680588
R291 netHid2 net99 543698.390319412
R292 netHid3 net98 393247.9051433823
R293 netHid3 net99 616752.0948566177
R294 netBias net98 606117.3913925738
R295 netBias net99 403882.60860742617
M88 net98 e2 net92 net92 nch
M89 net92 ne2 net98 net98 pch
M90 net99 e2 net93 net93 nch
M91 net93 ne2 net99 net99 pch
R296 netIn0 net100 424892.7225480578
R297 netIn0 net101 585107.2774519422
R298 netHid0 net100 430258.294100753
R299 netHid0 net101 579741.705899247
R300 netHid1 net100 568437.8165939456
R301 netHid1 net101 441562.1834060544
R302 netHid2 net100 433723.2652302314
R303 netHid2 net101 576276.7347697685
R304 netHid3 net100 510404.36177435936
R305 netHid3 net101 499595.63822564064
R306 netBias net100 506157.14339213906
R307 netBias net101 503842.85660786094
M92 net100 e3 net92 net92 nch
M93 net92 ne3 net100 net100 pch
M94 net101 e3 net93 net93 nch
M95 net93 ne3 net101 net101 pch
XopAmp12 net92 net102 Vcm opAmp
R308 net92 net102 R
R309 net102 net93 R
XopAmp13 net93 net103 Vcm opAmp
R310 net93 net103 Rf
R311 netIn0 net106 486519.75094561465
R312 netIn0 net107 523480.24905438535
R313 netHid0 net106 434612.1594336235
R314 netHid0 net107 575387.8405663765
R315 netHid1 net106 620841.701623474
R316 netHid1 net107 389158.298376526
R317 netHid2 net106 431713.635257524
R318 netHid2 net107 578286.364742476
R319 netHid3 net106 525101.075581334
R320 netHid3 net107 484898.92441866605
R321 netBias net106 287040.38136502105
R322 netBias net107 722959.618634979
M96 net106 e0 net104 net104 nch
M97 net104 ne0 net106 net106 pch
M98 net107 e0 net105 net105 nch
M99 net105 ne0 net107 net107 pch
R323 netIn0 net108 428083.8836865868
R324 netIn0 net109 581916.1163134133
R325 netHid0 net108 516413.8133680503
R326 netHid0 net109 493586.1866319497
R327 netHid1 net108 525362.1246962632
R328 netHid1 net109 484637.8753037368
R329 netHid2 net108 561696.5051218612
R330 netHid2 net109 448303.49487813876
R331 netHid3 net108 520338.11074721726
R332 netHid3 net109 489661.88925278274
R333 netBias net108 387610.37280841946
R334 netBias net109 622389.6271915806
M100 net108 e1 net104 net104 nch
M101 net104 ne1 net108 net108 pch
M102 net109 e1 net105 net105 nch
M103 net105 ne1 net109 net109 pch
R335 netIn0 net110 298931.7511999096
R336 netIn0 net111 711068.2488000904
R337 netHid0 net110 573019.2709391393
R338 netHid0 net111 436980.7290608607
R339 netHid1 net110 658414.1432198881
R340 netHid1 net111 351585.8567801119
R341 netHid2 net110 486961.2674650928
R342 netHid2 net111 523038.7325349072
R343 netHid3 net110 443575.2593785159
R344 netHid3 net111 566424.7406214841
R345 netBias net110 534823.563113605
R346 netBias net111 475176.436886395
M104 net110 e2 net104 net104 nch
M105 net104 ne2 net110 net110 pch
M106 net111 e2 net105 net105 nch
M107 net105 ne2 net111 net111 pch
R347 netIn0 net112 393786.46595033095
R348 netIn0 net113 616213.534049669
R349 netHid0 net112 594414.3439166895
R350 netHid0 net113 415585.6560833105
R351 netHid1 net112 607174.5023423404
R352 netHid1 net113 402825.4976576596
R353 netHid2 net112 528051.2207151601
R354 netHid2 net113 481948.77928483987
R355 netHid3 net112 563262.7587636797
R356 netHid3 net113 446737.24123632035
R357 netBias net112 399403.869382762
R358 netBias net113 610596.130617238
M108 net112 e3 net104 net104 nch
M109 net104 ne3 net112 net112 pch
M110 net113 e3 net105 net105 nch
M111 net105 ne3 net113 net113 pch
XopAmp14 net104 net114 Vcm opAmp
R359 net104 net114 R
R360 net114 net105 R
XopAmp15 net105 net115 Vcm opAmp
R361 net105 net115 Rf
R362 netIn0 net118 370021.62585631496
R363 netIn0 net119 639978.374143685
R364 netHid0 net118 479718.0081587996
R365 netHid0 net119 530281.9918412004
R366 netHid1 net118 605435.6426841108
R367 netHid1 net119 404564.3573158892
R368 netHid2 net118 404273.4293464388
R369 netHid2 net119 605726.5706535613
R370 netHid3 net118 427246.40409642435
R371 netHid3 net119 582753.5959035757
R372 netBias net118 326279.90632219316
R373 netBias net119 683720.0936778069
M112 net118 e0 net116 net116 nch
M113 net116 ne0 net118 net118 pch
M114 net119 e0 net117 net117 nch
M115 net117 ne0 net119 net119 pch
R374 netIn0 net120 302730.68212280783
R375 netIn0 net121 707269.3178771922
R376 netHid0 net120 622936.3126546565
R377 netHid0 net121 387063.6873453435
R378 netHid1 net120 693807.079340679
R379 netHid1 net121 316192.920659321
R380 netHid2 net120 294776.9341933894
R381 netHid2 net121 715223.0658066106
R382 netHid3 net120 644486.9948446474
R383 netHid3 net121 365513.00515535264
R384 netBias net120 510579.33600877965
R385 netBias net121 499420.66399122035
M116 net120 e1 net116 net116 nch
M117 net116 ne1 net120 net120 pch
M118 net121 e1 net117 net117 nch
M119 net117 ne1 net121 net121 pch
R386 netIn0 net122 411348.35855243914
R387 netIn0 net123 598651.6414475609
R388 netHid0 net122 344484.3611937565
R389 netHid0 net123 665515.6388062434
R390 netHid1 net122 260657.71752270433
R391 netHid1 net123 749342.2824772957
R392 netHid2 net122 459353.81434542453
R393 netHid2 net123 550646.1856545755
R394 netHid3 net122 306877.99383729347
R395 netHid3 net123 703122.0061627065
R396 netBias net122 347560.78600707307
R397 netBias net123 662439.213992927
M120 net122 e2 net116 net116 nch
M121 net116 ne2 net122 net122 pch
M122 net123 e2 net117 net117 nch
M123 net117 ne2 net123 net123 pch
R398 netIn0 net124 275363.31664023886
R399 netIn0 net125 734636.6833597611
R400 netHid0 net124 540342.0644958365
R401 netHid0 net125 469657.9355041635
R402 netHid1 net124 612140.4407297896
R403 netHid1 net125 397859.55927021045
R404 netHid2 net124 486081.9572777035
R405 netHid2 net125 523918.0427222965
R406 netHid3 net124 460357.3089677855
R407 netHid3 net125 549642.6910322146
R408 netBias net124 407482.5004335928
R409 netBias net125 602517.4995664072
M124 net124 e3 net116 net116 nch
M125 net116 ne3 net124 net124 pch
M126 net125 e3 net117 net117 nch
M127 net117 ne3 net125 net125 pch
XopAmp16 net116 net126 Vcm opAmp
R410 net116 net126 R
R411 net126 net117 R
XopAmp17 net117 net127 Vcm opAmp
R412 net117 net127 Rf
Xsig3 V1 V2 V3s net91 net128 0 idc vdd! sigmoid
Xbuffer9 inputG0 inputG0 net128 opAmp
Xsig4 V1 V2 V3s net103 net129 0 idc vdd! sigmoid
Xbuffer10 forgetG0 forgetG0 net129 opAmp
Xtanh2 V1 V2 V3t net115 net130 0 idc vdd! tanh
Xbuffer11 cellStateG0 cellStateG0 net130 opAmp
Xsig5 V1 V2 V3s net127 net131 0 idc vdd! sigmoid
Xbuffer12 outputG0 outputG0 net131 opAmp
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
Vdc6 V3t 0 DC=0.55 srcType=dc
Vdc7 V3s 0 DC=0.8 srcType=dc
Vdc8 V2 0 DC=0.635 srcType=dc
Vdc9 V1 0 DC=1.1 srcType=dc
Vdc10 netBias Vcm DC=0.1 srcType=dc
Idc0 vdd! idc DC=150u srcType=dc
Vpulse0 nextT 0 DC=0 srcType=pulse val0=0 val1=vdd per=T+T/20 pw=T/20 td=T
Vpulse1 predEn 0 DC=0 srcType=pulse val0=0 val1=vdd per=0 pw=3*T/40 td="(T+T/20)*2"
Vpulse2 xbarEn 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T td="(T+T/20)"
Vpulse3 m0p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=0*T/4
Vpulse4 m0p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+0*T/4
Vpulse5 e0 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/4 td=0*T/4
Xinverter0 0 e0 ne0 vdd! inverter
Vpulse6 m1p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=1*T/4
Vpulse7 m1p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+1*T/4
Vpulse8 e1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/4 td=1*T/4
Xinverter1 0 e1 ne1 vdd! inverter
Vpulse9 m2p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=2*T/4
Vpulse10 m2p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+2*T/4
Vpulse11 e2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/4 td=2*T/4
Xinverter2 0 e2 ne2 vdd! inverter
Vpulse12 m3p1 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=3*T/4
Vpulse13 m3p2 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/8 td=T/8+3*T/4
Vpulse14 e3 0 DC=0 srcType=pulse val0=0 val1=vdd per="(T+T/20)" pw=T/4 td=3*T/4
Xinverter3 0 e3 ne3 vdd! inverter
Vpulse15 net152 Vcm DC=0 srcType=pulse val0=0 val1=in0step0 per=0 pw=T td="(T+T/20)*0"
Vpulse16 netIn0 net152 DC=0 srcType=pulse val0=0 val1=in0step1 per=0 pw=T td="(T+T/20)*1"
.ends lstm
