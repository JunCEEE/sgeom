; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; OY: Use ONLY geoptimiser from CrystFEL > 0.7.0
; OY: I think this is a very well optimized geometry!
; Optimized panel offsets can be found at the end of the file
; Manually optimized with hdfsee
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Optimized panel offsets can be found at the end of the file
; Camera length from LiTiO calibration
; Manually optimized with hdfsee
; Now all distances between panels is 5.8mm (29 pixels)
; OY: ACHTUNG! Orientation of the 2 halves of the detector might be wrong!
; A bit changed by OY: now 128 panels, rigid groups, bad lines to mask double pixels.
; Fixed errors noticed by Oleksandr
; Beginning of an AGIPD geometry construction by Helen Ginn on Thursday before beam time.
; Global panel positions not guesses
; Local positioning largely - but not entirely - guesses
; fast and slow scan directions have the potential to be accurate.

data = /entry_1/data_1/data
;data = /entry_1/instrument_1/detector_1/data
;mask = /entry_1/data_1/mask
mask = /entry_1/instrument_1/detector_1/mask
dim0 = %                      ; placeholder: this is the running frame# dimension

mask_good = 0x0
mask_bad = 0xffff

adu_per_eV = 0.0075  ; no idea
clen = 0.1222
photon_energy = 9360
res = 5000 ; 200 um pixels


rigid_group_p0 = p0a0,p0a1,p0a2,p0a3,p0a4,p0a5,p0a6,p0a7
rigid_group_p1 = p1a0,p1a1,p1a2,p1a3,p1a4,p1a5,p1a6,p1a7
rigid_group_p2 = p2a0,p2a1,p2a2,p2a3,p2a4,p2a5,p2a6,p2a7
rigid_group_p3 = p3a0,p3a1,p3a2,p3a3,p3a4,p3a5,p3a6,p3a7
rigid_group_p4 = p4a0,p4a1,p4a2,p4a3,p4a4,p4a5,p4a6,p4a7
rigid_group_p5 = p5a0,p5a1,p5a2,p5a3,p5a4,p5a5,p5a6,p5a7
rigid_group_p6 = p6a0,p6a1,p6a2,p6a3,p6a4,p6a5,p6a6,p6a7
rigid_group_p7 = p7a0,p7a1,p7a2,p7a3,p7a4,p7a5,p7a6,p7a7
rigid_group_p8 = p8a0,p8a1,p8a2,p8a3,p8a4,p8a5,p8a6,p8a7
rigid_group_p9 = p9a0,p9a1,p9a2,p9a3,p9a4,p9a5,p9a6,p9a7
rigid_group_p10 = p10a0,p10a1,p10a2,p10a3,p10a4,p10a5,p10a6,p10a7
rigid_group_p11 = p11a0,p11a1,p11a2,p11a3,p11a4,p11a5,p11a6,p11a7
rigid_group_p12 = p12a0,p12a1,p12a2,p12a3,p12a4,p12a5,p12a6,p12a7
rigid_group_p13 = p13a0,p13a1,p13a2,p13a3,p13a4,p13a5,p13a6,p13a7
rigid_group_p14 = p14a0,p14a1,p14a2,p14a3,p14a4,p14a5,p14a6,p14a7
rigid_group_p15 = p15a0,p15a1,p15a2,p15a3,p15a4,p15a5,p15a6,p15a7
rigid_group_collection_asics = p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15

rigid_group_q0 = p0a0,p0a1,p0a2,p0a3,p0a4,p0a5,p0a6,p0a7,p1a0,p1a1,p1a2,p1a3,p1a4,p1a5,p1a6,p1a7,p2a0,p2a1,p2a2,p2a3,p2a4,p2a5,p2a6,p2a7,p3a0,p3a1,p3a2,p3a3,p3a4,p3a5,p3a6,p3a7
rigid_group_q1 = p4a0,p4a1,p4a2,p4a3,p4a4,p4a5,p4a6,p4a7,p5a0,p5a1,p5a2,p5a3,p5a4,p5a5,p5a6,p5a7,p6a0,p6a1,p6a2,p6a3,p6a4,p6a5,p6a6,p6a7,p7a0,p7a1,p7a2,p7a3,p7a4,p7a5,p7a6,p7a7
rigid_group_q2 = p8a0,p8a1,p8a2,p8a3,p8a4,p8a5,p8a6,p8a7,p9a0,p9a1,p9a2,p9a3,p9a4,p9a5,p9a6,p9a7,p10a0,p10a1,p10a2,p10a3,p10a4,p10a5,p10a6,p10a7,p11a0,p11a1,p11a2,p11a3,p11a4,p11a5,p11a6,p11a7
rigid_group_q3 = p12a0,p12a1,p12a2,p12a3,p12a4,p12a5,p12a6,p12a7,p13a0,p13a1,p13a2,p13a3,p13a4,p13a5,p13a6,p13a7,p14a0,p14a1,p14a2,p14a3,p14a4,p14a5,p14a6,p14a7,p15a0,p15a1,p15a2,p15a3,p15a4,p15a5,p15a6,p15a7
rigid_group_collection_quadrants = q0,q1,q2,q3

p0a0/dim1 = 0        ; panel number
p0a0/dim2 = ss       ; slow scan pixel direction within panel
p0a0/dim3 = fs       ; fast scan pixel direction within panel
p0a0/min_fs = 0
p0a0/min_ss = 0
p0a0/max_fs = 127
p0a0/max_ss = 63
p0a0/fs = -0.000863x -0.999995y
p0a0/ss = +0.999995x -0.000863y
p0a0/corner_x = -534.405
p0a0/corner_y = 631.753

p0a1/dim1 = 0
p0a1/dim2 = ss
p0a1/dim3 = fs
p0a1/min_fs = 0
p0a1/min_ss = 64
p0a1/max_fs = 127
p0a1/max_ss = 127
p0a1/fs = -0.000863x -0.999995y
p0a1/ss = +0.999995x -0.000863y
p0a1/corner_x = -468.405
p0a1/corner_y = 631.676

p0a2/dim1 = 0
p0a2/dim2 = ss
p0a2/dim3 = fs
p0a2/min_fs = 0
p0a2/min_ss = 128
p0a2/max_fs = 127
p0a2/max_ss = 191
p0a2/fs = -0.000863x -0.999995y
p0a2/ss = +0.999995x -0.000863y
p0a2/corner_x = -402.411
p0a2/corner_y = 631.597

p0a3/dim1 = 0
p0a3/dim2 = ss
p0a3/dim3 = fs
p0a3/min_fs = 0
p0a3/min_ss = 192
p0a3/max_fs = 127
p0a3/max_ss = 255
p0a3/fs = -0.000863x -0.999995y
p0a3/ss = +0.999995x -0.000863y
p0a3/corner_x = -336.409
p0a3/corner_y = 631.519

p0a4/dim1 = 0
p0a4/dim2 = ss
p0a4/dim3 = fs
p0a4/min_fs = 0
p0a4/min_ss = 256
p0a4/max_fs = 127
p0a4/max_ss = 319
p0a4/fs = -0.000863x -0.999995y
p0a4/ss = +0.999995x -0.000863y
p0a4/corner_x = -270.408
p0a4/corner_y = 631.438

p0a5/dim1 = 0
p0a5/dim2 = ss
p0a5/dim3 = fs
p0a5/min_fs = 0
p0a5/min_ss = 320
p0a5/max_fs = 127
p0a5/max_ss = 383
p0a5/fs = -0.000863x -0.999995y
p0a5/ss = +0.999995x -0.000863y
p0a5/corner_x = -204.406
p0a5/corner_y = 631.47

p0a6/dim1 = 0
p0a6/dim2 = ss
p0a6/dim3 = fs
p0a6/min_fs = 0
p0a6/min_ss = 384
p0a6/max_fs = 127
p0a6/max_ss = 447
p0a6/fs = -0.000863x -0.999995y
p0a6/ss = +0.999995x -0.000863y
p0a6/corner_x = -138.406
p0a6/corner_y = 631.413

p0a7/dim1 = 0
p0a7/dim2 = ss
p0a7/dim3 = fs
p0a7/min_fs = 0
p0a7/min_ss = 448
p0a7/max_fs = 127
p0a7/max_ss = 511
p0a7/fs = -0.000863x -0.999995y
p0a7/ss = +0.999995x -0.000863y
p0a7/corner_x = -72.407
p0a7/corner_y = 631.355

p1a0/dim1 = 1
p1a0/dim2 = ss
p1a0/dim3 = fs
p1a0/min_fs = 0
p1a0/min_ss = 0
p1a0/max_fs = 127
p1a0/max_ss = 63
p1a0/fs = +0.000434x -1.000000y
p1a0/ss = +1.000000x +0.000434y
p1a0/corner_x = -535.034
p1a0/corner_y = 474.334

p1a1/dim1 = 1
p1a1/dim2 = ss
p1a1/dim3 = fs
p1a1/min_fs = 0
p1a1/min_ss = 64
p1a1/max_fs = 127
p1a1/max_ss = 127
p1a1/fs = +0.000434x -1.000000y
p1a1/ss = +1.000000x +0.000434y
p1a1/corner_x = -469.035
p1a1/corner_y = 474.374

p1a2/dim1 = 1
p1a2/dim2 = ss
p1a2/dim3 = fs
p1a2/min_fs = 0
p1a2/min_ss = 128
p1a2/max_fs = 127
p1a2/max_ss = 191
p1a2/fs = +0.000434x -1.000000y
p1a2/ss = +1.000000x +0.000434y
p1a2/corner_x = -403.036
p1a2/corner_y = 474.415

p1a3/dim1 = 1
p1a3/dim2 = ss
p1a3/dim3 = fs
p1a3/min_fs = 0
p1a3/min_ss = 192
p1a3/max_fs = 127
p1a3/max_ss = 255
p1a3/fs = +0.000434x -1.000000y
p1a3/ss = +1.000000x +0.000434y
p1a3/corner_x = -337.04
p1a3/corner_y = 474.455

p1a4/dim1 = 1
p1a4/dim2 = ss
p1a4/dim3 = fs
p1a4/min_fs = 0
p1a4/min_ss = 256
p1a4/max_fs = 127
p1a4/max_ss = 319
p1a4/fs = +0.000434x -1.000000y
p1a4/ss = +1.000000x +0.000434y
p1a4/corner_x = -271.042
p1a4/corner_y = 474.496

p1a5/dim1 = 1
p1a5/dim2 = ss
p1a5/dim3 = fs
p1a5/min_fs = 0
p1a5/min_ss = 320
p1a5/max_fs = 127
p1a5/max_ss = 383
p1a5/fs = +0.000434x -1.000000y
p1a5/ss = +1.000000x +0.000434y
p1a5/corner_x = -205.046
p1a5/corner_y = 474.536

p1a6/dim1 = 1
p1a6/dim2 = ss
p1a6/dim3 = fs
p1a6/min_fs = 0
p1a6/min_ss = 384
p1a6/max_fs = 127
p1a6/max_ss = 447
p1a6/fs = +0.000434x -1.000000y
p1a6/ss = +1.000000x +0.000434y
p1a6/corner_x = -139.026
p1a6/corner_y = 474.577

p1a7/dim1 = 1
p1a7/dim2 = ss
p1a7/dim3 = fs
p1a7/min_fs = 0
p1a7/min_ss = 448
p1a7/max_fs = 127
p1a7/max_ss = 511
p1a7/fs = +0.000434x -1.000000y
p1a7/ss = +1.000000x +0.000434y
p1a7/corner_x = -73.0269
p1a7/corner_y = 474.617

p2a0/dim1 = 2
p2a0/dim2 = ss
p2a0/dim3 = fs
p2a0/min_fs = 0
p2a0/min_ss = 0
p2a0/max_fs = 127
p2a0/max_ss = 63
p2a0/fs = +0.001588x -0.999999y
p2a0/ss = +0.999999x +0.001588y
p2a0/corner_x = -534.494
p2a0/corner_y = 316.983

p2a1/dim1 = 2
p2a1/dim2 = ss
p2a1/dim3 = fs
p2a1/min_fs = 0
p2a1/min_ss = 64
p2a1/max_fs = 127
p2a1/max_ss = 127
p2a1/fs = +0.001588x -0.999999y
p2a1/ss = +0.999999x +0.001588y
p2a1/corner_x = -468.496
p2a1/corner_y = 317.08

p2a2/dim1 = 2
p2a2/dim2 = ss
p2a2/dim3 = fs
p2a2/min_fs = 0
p2a2/min_ss = 128
p2a2/max_fs = 127
p2a2/max_ss = 191
p2a2/fs = +0.001588x -0.999999y
p2a2/ss = +0.999999x +0.001588y
p2a2/corner_x = -402.497
p2a2/corner_y = 317.176

p2a3/dim1 = 2
p2a3/dim2 = ss
p2a3/dim3 = fs
p2a3/min_fs = 0
p2a3/min_ss = 192
p2a3/max_fs = 127
p2a3/max_ss = 255
p2a3/fs = +0.001588x -0.999999y
p2a3/ss = +0.999999x +0.001588y
p2a3/corner_x = -336.497
p2a3/corner_y = 317.273

p2a4/dim1 = 2
p2a4/dim2 = ss
p2a4/dim3 = fs
p2a4/min_fs = 0
p2a4/min_ss = 256
p2a4/max_fs = 127
p2a4/max_ss = 319
p2a4/fs = +0.001588x -0.999999y
p2a4/ss = +0.999999x +0.001588y
p2a4/corner_x = -270.498
p2a4/corner_y = 317.37

p2a5/dim1 = 2
p2a5/dim2 = ss
p2a5/dim3 = fs
p2a5/min_fs = 0
p2a5/min_ss = 320
p2a5/max_fs = 127
p2a5/max_ss = 383
p2a5/fs = +0.001588x -0.999999y
p2a5/ss = +0.999999x +0.001588y
p2a5/corner_x = -204.5
p2a5/corner_y = 317.466

p2a6/dim1 = 2
p2a6/dim2 = ss
p2a6/dim3 = fs
p2a6/min_fs = 0
p2a6/min_ss = 384
p2a6/max_fs = 127
p2a6/max_ss = 447
p2a6/fs = +0.001588x -0.999999y
p2a6/ss = +0.999999x +0.001588y
p2a6/corner_x = -138.487
p2a6/corner_y = 317.563

p2a7/dim1 = 2
p2a7/dim2 = ss
p2a7/dim3 = fs
p2a7/min_fs = 0
p2a7/min_ss = 448
p2a7/max_fs = 127
p2a7/max_ss = 511
p2a7/fs = +0.001588x -0.999999y
p2a7/ss = +0.999999x +0.001588y
p2a7/corner_x = -72.4842
p2a7/corner_y = 317.659

p3a0/dim1 = 3
p3a0/dim2 = ss
p3a0/dim3 = fs
p3a0/min_fs = 0
p3a0/min_ss = 0
p3a0/max_fs = 127
p3a0/max_ss = 63
p3a0/fs = +0.004331x -0.999992y
p3a0/ss = +0.999992x +0.004331y
p3a0/corner_x = -534.805
p3a0/corner_y = 159.41

p3a1/dim1 = 3
p3a1/dim2 = ss
p3a1/dim3 = fs
p3a1/min_fs = 0
p3a1/min_ss = 64
p3a1/max_fs = 127
p3a1/max_ss = 127
p3a1/fs = +0.004331x -0.999992y
p3a1/ss = +0.999992x +0.004331y
p3a1/corner_x = -468.81
p3a1/corner_y = 159.699

p3a2/dim1 = 3
p3a2/dim2 = ss
p3a2/dim3 = fs
p3a2/min_fs = 0
p3a2/min_ss = 128
p3a2/max_fs = 127
p3a2/max_ss = 191
p3a2/fs = +0.004331x -0.999992y
p3a2/ss = +0.999992x +0.004331y
p3a2/corner_x = -402.812
p3a2/corner_y = 159.986

p3a3/dim1 = 3
p3a3/dim2 = ss
p3a3/dim3 = fs
p3a3/min_fs = 0
p3a3/min_ss = 192
p3a3/max_fs = 127
p3a3/max_ss = 255
p3a3/fs = +0.004331x -0.999992y
p3a3/ss = +0.999992x +0.004331y
p3a3/corner_x = -336.818
p3a3/corner_y = 160.273

p3a4/dim1 = 3
p3a4/dim2 = ss
p3a4/dim3 = fs
p3a4/min_fs = 0
p3a4/min_ss = 256
p3a4/max_fs = 127
p3a4/max_ss = 319
p3a4/fs = +0.004331x -0.999992y
p3a4/ss = +0.999992x +0.004331y
p3a4/corner_x = -270.817
p3a4/corner_y = 160.561

p3a5/dim1 = 3
p3a5/dim2 = ss
p3a5/dim3 = fs
p3a5/min_fs = 0
p3a5/min_ss = 320
p3a5/max_fs = 127
p3a5/max_ss = 383
p3a5/fs = +0.004331x -0.999992y
p3a5/ss = +0.999992x +0.004331y
p3a5/corner_x = -204.804
p3a5/corner_y = 160.849

p3a6/dim1 = 3
p3a6/dim2 = ss
p3a6/dim3 = fs
p3a6/min_fs = 0
p3a6/min_ss = 384
p3a6/max_fs = 127
p3a6/max_ss = 447
p3a6/fs = +0.004331x -0.999992y
p3a6/ss = +0.999992x +0.004331y
p3a6/corner_x = -138.801
p3a6/corner_y = 161.138

p3a7/dim1 = 3
p3a7/dim2 = ss
p3a7/dim3 = fs
p3a7/min_fs = 0
p3a7/min_ss = 448
p3a7/max_fs = 127
p3a7/max_ss = 511
p3a7/fs = +0.004331x -0.999992y
p3a7/ss = +0.999992x +0.004331y
p3a7/corner_x = -72.8034
p3a7/corner_y = 161.426

p4a0/dim1 = 4
p4a0/dim2 = ss
p4a0/dim3 = fs
p4a0/min_fs = 0
p4a0/min_ss = 0
p4a0/max_fs = 127
p4a0/max_ss = 63
p4a0/fs = +0.000278x -1.000001y
p4a0/ss = +1.000001x +0.000278y
p4a0/corner_x = -549.351
p4a0/corner_y = -24.6844

p4a1/dim1 = 4
p4a1/dim2 = ss
p4a1/dim3 = fs
p4a1/min_fs = 0
p4a1/min_ss = 64
p4a1/max_fs = 127
p4a1/max_ss = 127
p4a1/fs = +0.000278x -1.000001y
p4a1/ss = +1.000001x +0.000278y
p4a1/corner_x = -483.352
p4a1/corner_y = -24.6579

p4a2/dim1 = 4
p4a2/dim2 = ss
p4a2/dim3 = fs
p4a2/min_fs = 0
p4a2/min_ss = 128
p4a2/max_fs = 127
p4a2/max_ss = 191
p4a2/fs = +0.000278x -1.000001y
p4a2/ss = +1.000001x +0.000278y
p4a2/corner_x = -417.357
p4a2/corner_y = -24.6313

p4a3/dim1 = 4
p4a3/dim2 = ss
p4a3/dim3 = fs
p4a3/min_fs = 0
p4a3/min_ss = 192
p4a3/max_fs = 127
p4a3/max_ss = 255
p4a3/fs = +0.000278x -1.000001y
p4a3/ss = +1.000001x +0.000278y
p4a3/corner_x = -351.358
p4a3/corner_y = -24.6047

p4a4/dim1 = 4
p4a4/dim2 = ss
p4a4/dim3 = fs
p4a4/min_fs = 0
p4a4/min_ss = 256
p4a4/max_fs = 127
p4a4/max_ss = 319
p4a4/fs = +0.000278x -1.000001y
p4a4/ss = +1.000001x +0.000278y
p4a4/corner_x = -285.359
p4a4/corner_y = -24.5779

p4a5/dim1 = 4
p4a5/dim2 = ss
p4a5/dim3 = fs
p4a5/min_fs = 0
p4a5/min_ss = 320
p4a5/max_fs = 127
p4a5/max_ss = 383
p4a5/fs = +0.000278x -1.000001y
p4a5/ss = +1.000001x +0.000278y
p4a5/corner_x = -219.361
p4a5/corner_y = -24.5511

p4a6/dim1 = 4
p4a6/dim2 = ss
p4a6/dim3 = fs
p4a6/min_fs = 0
p4a6/min_ss = 384
p4a6/max_fs = 127
p4a6/max_ss = 447
p4a6/fs = +0.000278x -1.000001y
p4a6/ss = +1.000001x +0.000278y
p4a6/corner_x = -153.364
p4a6/corner_y = -24.5245

p4a7/dim1 = 4
p4a7/dim2 = ss
p4a7/dim3 = fs
p4a7/min_fs = 0
p4a7/min_ss = 448
p4a7/max_fs = 127
p4a7/max_ss = 511
p4a7/fs = +0.000278x -1.000001y
p4a7/ss = +1.000001x +0.000278y
p4a7/corner_x = -87.3676
p4a7/corner_y = -24.4979

p5a0/dim1 = 5
p5a0/dim2 = ss
p5a0/dim3 = fs
p5a0/min_fs = 0
p5a0/min_ss = 0
p5a0/max_fs = 127
p5a0/max_ss = 63
p5a0/fs = +0.003315x -0.999995y
p5a0/ss = +0.999995x +0.003315y
p5a0/corner_x = -547.733
p5a0/corner_y = -182.725

p5a1/dim1 = 5
p5a1/dim2 = ss
p5a1/dim3 = fs
p5a1/min_fs = 0
p5a1/min_ss = 64
p5a1/max_fs = 127
p5a1/max_ss = 127
p5a1/fs = +0.003315x -0.999995y
p5a1/ss = +0.999995x +0.003315y
p5a1/corner_x = -481.735
p5a1/corner_y = -182.512

p5a2/dim1 = 5
p5a2/dim2 = ss
p5a2/dim3 = fs
p5a2/min_fs = 0
p5a2/min_ss = 128
p5a2/max_fs = 127
p5a2/max_ss = 191
p5a2/fs = +0.003315x -0.999995y
p5a2/ss = +0.999995x +0.003315y
p5a2/corner_x = -415.738
p5a2/corner_y = -182.302

p5a3/dim1 = 5
p5a3/dim2 = ss
p5a3/dim3 = fs
p5a3/min_fs = 0
p5a3/min_ss = 192
p5a3/max_fs = 127
p5a3/max_ss = 255
p5a3/fs = +0.003315x -0.999995y
p5a3/ss = +0.999995x +0.003315y
p5a3/corner_x = -349.742
p5a3/corner_y = -182.092

p5a4/dim1 = 5
p5a4/dim2 = ss
p5a4/dim3 = fs
p5a4/min_fs = 0
p5a4/min_ss = 256
p5a4/max_fs = 127
p5a4/max_ss = 319
p5a4/fs = +0.003315x -0.999995y
p5a4/ss = +0.999995x +0.003315y
p5a4/corner_x = -283.743
p5a4/corner_y = -181.878

p5a5/dim1 = 5
p5a5/dim2 = ss
p5a5/dim3 = fs
p5a5/min_fs = 0
p5a5/min_ss = 320
p5a5/max_fs = 127
p5a5/max_ss = 383
p5a5/fs = +0.003315x -0.999995y
p5a5/ss = +0.999995x +0.003315y
p5a5/corner_x = -217.73
p5a5/corner_y = -181.666

p5a6/dim1 = 5
p5a6/dim2 = ss
p5a6/dim3 = fs
p5a6/min_fs = 0
p5a6/min_ss = 384
p5a6/max_fs = 127
p5a6/max_ss = 447
p5a6/fs = +0.003315x -0.999995y
p5a6/ss = +0.999995x +0.003315y
p5a6/corner_x = -151.73
p5a6/corner_y = -181.456

p5a7/dim1 = 5
p5a7/dim2 = ss
p5a7/dim3 = fs
p5a7/min_fs = 0
p5a7/min_ss = 448
p5a7/max_fs = 127
p5a7/max_ss = 511
p5a7/fs = +0.003315x -0.999995y
p5a7/ss = +0.999995x +0.003315y
p5a7/corner_x = -85.7291
p5a7/corner_y = -181.244

p6a0/dim1 = 6
p6a0/dim2 = ss
p6a0/dim3 = fs
p6a0/min_fs = 0
p6a0/min_ss = 0
p6a0/max_fs = 127
p6a0/max_ss = 63
p6a0/fs = +0.000177x -1.000002y
p6a0/ss = +1.000002x +0.000177y
p6a0/corner_x = -548.126
p6a0/corner_y = -339.173

p6a1/dim1 = 6
p6a1/dim2 = ss
p6a1/dim3 = fs
p6a1/min_fs = 0
p6a1/min_ss = 64
p6a1/max_fs = 127
p6a1/max_ss = 127
p6a1/fs = +0.000177x -1.000002y
p6a1/ss = +1.000002x +0.000177y
p6a1/corner_x = -482.129
p6a1/corner_y = -339.171

p6a2/dim1 = 6
p6a2/dim2 = ss
p6a2/dim3 = fs
p6a2/min_fs = 0
p6a2/min_ss = 128
p6a2/max_fs = 127
p6a2/max_ss = 191
p6a2/fs = +0.000177x -1.000002y
p6a2/ss = +1.000002x +0.000177y
p6a2/corner_x = -416.131
p6a2/corner_y = -339.168

p6a3/dim1 = 6
p6a3/dim2 = ss
p6a3/dim3 = fs
p6a3/min_fs = 0
p6a3/min_ss = 192
p6a3/max_fs = 127
p6a3/max_ss = 255
p6a3/fs = +0.000177x -1.000002y
p6a3/ss = +1.000002x +0.000177y
p6a3/corner_x = -350.132
p6a3/corner_y = -339.165

p6a4/dim1 = 6
p6a4/dim2 = ss
p6a4/dim3 = fs
p6a4/min_fs = 0
p6a4/min_ss = 256
p6a4/max_fs = 127
p6a4/max_ss = 319
p6a4/fs = +0.000177x -1.000002y
p6a4/ss = +1.000002x +0.000177y
p6a4/corner_x = -284.136
p6a4/corner_y = -339.162

p6a5/dim1 = 6
p6a5/dim2 = ss
p6a5/dim3 = fs
p6a5/min_fs = 0
p6a5/min_ss = 320
p6a5/max_fs = 127
p6a5/max_ss = 383
p6a5/fs = +0.000177x -1.000002y
p6a5/ss = +1.000002x +0.000177y
p6a5/corner_x = -218.136
p6a5/corner_y = -339.158

p6a6/dim1 = 6
p6a6/dim2 = ss
p6a6/dim3 = fs
p6a6/min_fs = 0
p6a6/min_ss = 384
p6a6/max_fs = 127
p6a6/max_ss = 447
p6a6/fs = +0.000177x -1.000002y
p6a6/ss = +1.000002x +0.000177y
p6a6/corner_x = -152.138
p6a6/corner_y = -339.155

p6a7/dim1 = 6
p6a7/dim2 = ss
p6a7/dim3 = fs
p6a7/min_fs = 0
p6a7/min_ss = 448
p6a7/max_fs = 127
p6a7/max_ss = 511
p6a7/fs = +0.000177x -1.000002y
p6a7/ss = +1.000002x +0.000177y
p6a7/corner_x = -86.1394
p6a7/corner_y = -339.152

p7a0/dim1 = 7
p7a0/dim2 = ss
p7a0/dim3 = fs
p7a0/min_fs = 0
p7a0/min_ss = 0
p7a0/max_fs = 127
p7a0/max_ss = 63
p7a0/fs = +0.002758x -0.999993y
p7a0/ss = +0.999993x +0.002758y
p7a0/corner_x = -548.454
p7a0/corner_y = -498.907

p7a1/dim1 = 7
p7a1/dim2 = ss
p7a1/dim3 = fs
p7a1/min_fs = 0
p7a1/min_ss = 64
p7a1/max_fs = 127
p7a1/max_ss = 127
p7a1/fs = +0.002758x -0.999993y
p7a1/ss = +0.999993x +0.002758y
p7a1/corner_x = -482.46
p7a1/corner_y = -498.726

p7a2/dim1 = 7
p7a2/dim2 = ss
p7a2/dim3 = fs
p7a2/min_fs = 0
p7a2/min_ss = 128
p7a2/max_fs = 127
p7a2/max_ss = 191
p7a2/fs = +0.002758x -0.999993y
p7a2/ss = +0.999993x +0.002758y
p7a2/corner_x = -416.464
p7a2/corner_y = -498.549

p7a3/dim1 = 7
p7a3/dim2 = ss
p7a3/dim3 = fs
p7a3/min_fs = 0
p7a3/min_ss = 192
p7a3/max_fs = 127
p7a3/max_ss = 255
p7a3/fs = +0.002758x -0.999993y
p7a3/ss = +0.999993x +0.002758y
p7a3/corner_x = -350.466
p7a3/corner_y = -498.368

p7a4/dim1 = 7
p7a4/dim2 = ss
p7a4/dim3 = fs
p7a4/min_fs = 0
p7a4/min_ss = 256
p7a4/max_fs = 127
p7a4/max_ss = 319
p7a4/fs = +0.002758x -0.999993y
p7a4/ss = +0.999993x +0.002758y
p7a4/corner_x = -284.471
p7a4/corner_y = -498.19

p7a5/dim1 = 7
p7a5/dim2 = ss
p7a5/dim3 = fs
p7a5/min_fs = 0
p7a5/min_ss = 320
p7a5/max_fs = 127
p7a5/max_ss = 383
p7a5/fs = +0.002758x -0.999993y
p7a5/ss = +0.999993x +0.002758y
p7a5/corner_x = -218.474
p7a5/corner_y = -498.011

p7a6/dim1 = 7
p7a6/dim2 = ss
p7a6/dim3 = fs
p7a6/min_fs = 0
p7a6/min_ss = 384
p7a6/max_fs = 127
p7a6/max_ss = 447
p7a6/fs = +0.002758x -0.999993y
p7a6/ss = +0.999993x +0.002758y
p7a6/corner_x = -152.476
p7a6/corner_y = -497.831

p7a7/dim1 = 7
p7a7/dim2 = ss
p7a7/dim3 = fs
p7a7/min_fs = 0
p7a7/min_ss = 448
p7a7/max_fs = 127
p7a7/max_ss = 511
p7a7/fs = +0.002758x -0.999993y
p7a7/ss = +0.999993x +0.002758y
p7a7/corner_x = -86.4787
p7a7/corner_y = -497.65

p8a0/dim1 = 8
p8a0/dim2 = ss
p8a0/dim3 = fs
p8a0/min_fs = 0
p8a0/min_ss = 0
p8a0/max_fs = 127
p8a0/max_ss = 63
p8a0/fs = +0.000096x +1.000000y
p8a0/ss = -1.000000x +0.000096y
p8a0/corner_x = 545.73
p8a0/corner_y = -161.708

p8a1/dim1 = 8
p8a1/dim2 = ss
p8a1/dim3 = fs
p8a1/min_fs = 0
p8a1/min_ss = 64
p8a1/max_fs = 127
p8a1/max_ss = 127
p8a1/fs = +0.000096x +1.000000y
p8a1/ss = -1.000000x +0.000096y
p8a1/corner_x = 479.732
p8a1/corner_y = -161.706

p8a2/dim1 = 8
p8a2/dim2 = ss
p8a2/dim3 = fs
p8a2/min_fs = 0
p8a2/min_ss = 128
p8a2/max_fs = 127
p8a2/max_ss = 191
p8a2/fs = +0.000096x +1.000000y
p8a2/ss = -1.000000x +0.000096y
p8a2/corner_x = 413.733
p8a2/corner_y = -161.704

p8a3/dim1 = 8
p8a3/dim2 = ss
p8a3/dim3 = fs
p8a3/min_fs = 0
p8a3/min_ss = 192
p8a3/max_fs = 127
p8a3/max_ss = 255
p8a3/fs = +0.000096x +1.000000y
p8a3/ss = -1.000000x +0.000096y
p8a3/corner_x = 347.736
p8a3/corner_y = -161.701

p8a4/dim1 = 8
p8a4/dim2 = ss
p8a4/dim3 = fs
p8a4/min_fs = 0
p8a4/min_ss = 256
p8a4/max_fs = 127
p8a4/max_ss = 319
p8a4/fs = +0.000096x +1.000000y
p8a4/ss = -1.000000x +0.000096y
p8a4/corner_x = 281.736
p8a4/corner_y = -161.704

p8a5/dim1 = 8
p8a5/dim2 = ss
p8a5/dim3 = fs
p8a5/min_fs = 0
p8a5/min_ss = 320
p8a5/max_fs = 127
p8a5/max_ss = 383
p8a5/fs = +0.000096x +1.000000y
p8a5/ss = -1.000000x +0.000096y
p8a5/corner_x = 215.738
p8a5/corner_y = -161.7

p8a6/dim1 = 8
p8a6/dim2 = ss
p8a6/dim3 = fs
p8a6/min_fs = 0
p8a6/min_ss = 384
p8a6/max_fs = 127
p8a6/max_ss = 447
p8a6/fs = +0.000096x +1.000000y
p8a6/ss = -1.000000x +0.000096y
p8a6/corner_x = 149.741
p8a6/corner_y = -161.7

p8a7/dim1 = 8
p8a7/dim2 = ss
p8a7/dim3 = fs
p8a7/min_fs = 0
p8a7/min_ss = 448
p8a7/max_fs = 127
p8a7/max_ss = 511
p8a7/fs = +0.000096x +1.000000y
p8a7/ss = -1.000000x +0.000096y
p8a7/corner_x = 83.7431
p8a7/corner_y = -161.701

p9a0/dim1 = 9
p9a0/dim2 = ss
p9a0/dim3 = fs
p9a0/min_fs = 0
p9a0/min_ss = 0
p9a0/max_fs = 127
p9a0/max_ss = 63
p9a0/fs = -0.002733x +0.999996y
p9a0/ss = -0.999996x -0.002733y
p9a0/corner_x = 545.077
p9a0/corner_y = -318.31

p9a1/dim1 = 9
p9a1/dim2 = ss
p9a1/dim3 = fs
p9a1/min_fs = 0
p9a1/min_ss = 64
p9a1/max_fs = 127
p9a1/max_ss = 127
p9a1/fs = -0.002733x +0.999996y
p9a1/ss = -0.999996x -0.002733y
p9a1/corner_x = 479.08
p9a1/corner_y = -318.495

p9a2/dim1 = 9
p9a2/dim2 = ss
p9a2/dim3 = fs
p9a2/min_fs = 0
p9a2/min_ss = 128
p9a2/max_fs = 127
p9a2/max_ss = 191
p9a2/fs = -0.002733x +0.999996y
p9a2/ss = -0.999996x -0.002733y
p9a2/corner_x = 413.082
p9a2/corner_y = -318.679

p9a3/dim1 = 9
p9a3/dim2 = ss
p9a3/dim3 = fs
p9a3/min_fs = 0
p9a3/min_ss = 192
p9a3/max_fs = 127
p9a3/max_ss = 255
p9a3/fs = -0.002733x +0.999996y
p9a3/ss = -0.999996x -0.002733y
p9a3/corner_x = 347.086
p9a3/corner_y = -318.862

p9a4/dim1 = 9
p9a4/dim2 = ss
p9a4/dim3 = fs
p9a4/min_fs = 0
p9a4/min_ss = 256
p9a4/max_fs = 127
p9a4/max_ss = 319
p9a4/fs = -0.002733x +0.999996y
p9a4/ss = -0.999996x -0.002733y
p9a4/corner_x = 281.087
p9a4/corner_y = -319.046

p9a5/dim1 = 9
p9a5/dim2 = ss
p9a5/dim3 = fs
p9a5/min_fs = 0
p9a5/min_ss = 320
p9a5/max_fs = 127
p9a5/max_ss = 383
p9a5/fs = -0.002733x +0.999996y
p9a5/ss = -0.999996x -0.002733y
p9a5/corner_x = 215.091
p9a5/corner_y = -319.23

p9a6/dim1 = 9
p9a6/dim2 = ss
p9a6/dim3 = fs
p9a6/min_fs = 0
p9a6/min_ss = 384
p9a6/max_fs = 127
p9a6/max_ss = 447
p9a6/fs = -0.002733x +0.999996y
p9a6/ss = -0.999996x -0.002733y
p9a6/corner_x = 149.072
p9a6/corner_y = -319.413

p9a7/dim1 = 9
p9a7/dim2 = ss
p9a7/dim3 = fs
p9a7/min_fs = 0
p9a7/min_ss = 448
p9a7/max_fs = 127
p9a7/max_ss = 511
p9a7/fs = -0.002733x +0.999996y
p9a7/ss = -0.999996x -0.002733y
p9a7/corner_x = 83.0703
p9a7/corner_y = -319.597

p10a0/dim1 = 10
p10a0/dim2 = ss
p10a0/dim3 = fs
p10a0/min_fs = 0
p10a0/min_ss = 0
p10a0/max_fs = 127
p10a0/max_ss = 63
p10a0/fs = -0.001171x +0.999998y
p10a0/ss = -0.999998x -0.001171y
p10a0/corner_x = 544.836
p10a0/corner_y = -475.631

p10a1/dim1 = 10
p10a1/dim2 = ss
p10a1/dim3 = fs
p10a1/min_fs = 0
p10a1/min_ss = 64
p10a1/max_fs = 127
p10a1/max_ss = 127
p10a1/fs = -0.001171x +0.999998y
p10a1/ss = -0.999998x -0.001171y
p10a1/corner_x = 478.84
p10a1/corner_y = -475.715

p10a2/dim1 = 10
p10a2/dim2 = ss
p10a2/dim3 = fs
p10a2/min_fs = 0
p10a2/min_ss = 128
p10a2/max_fs = 127
p10a2/max_ss = 191
p10a2/fs = -0.001171x +0.999998y
p10a2/ss = -0.999998x -0.001171y
p10a2/corner_x = 412.842
p10a2/corner_y = -475.804

p10a3/dim1 = 10
p10a3/dim2 = ss
p10a3/dim3 = fs
p10a3/min_fs = 0
p10a3/min_ss = 192
p10a3/max_fs = 127
p10a3/max_ss = 255
p10a3/fs = -0.001171x +0.999998y
p10a3/ss = -0.999998x -0.001171y
p10a3/corner_x = 346.847
p10a3/corner_y = -475.89

p10a4/dim1 = 10
p10a4/dim2 = ss
p10a4/dim3 = fs
p10a4/min_fs = 0
p10a4/min_ss = 256
p10a4/max_fs = 127
p10a4/max_ss = 319
p10a4/fs = -0.001171x +0.999998y
p10a4/ss = -0.999998x -0.001171y
p10a4/corner_x = 280.849
p10a4/corner_y = -475.974

p10a5/dim1 = 10
p10a5/dim2 = ss
p10a5/dim3 = fs
p10a5/min_fs = 0
p10a5/min_ss = 320
p10a5/max_fs = 127
p10a5/max_ss = 383
p10a5/fs = -0.001171x +0.999998y
p10a5/ss = -0.999998x -0.001171y
p10a5/corner_x = 214.852
p10a5/corner_y = -476.063

p10a6/dim1 = 10
p10a6/dim2 = ss
p10a6/dim3 = fs
p10a6/min_fs = 0
p10a6/min_ss = 384
p10a6/max_fs = 127
p10a6/max_ss = 447
p10a6/fs = -0.001171x +0.999998y
p10a6/ss = -0.999998x -0.001171y
p10a6/corner_x = 148.856
p10a6/corner_y = -476.15

p10a7/dim1 = 10
p10a7/dim2 = ss
p10a7/dim3 = fs
p10a7/min_fs = 0
p10a7/min_ss = 448
p10a7/max_fs = 127
p10a7/max_ss = 511
p10a7/fs = -0.001171x +0.999998y
p10a7/ss = -0.999998x -0.001171y
p10a7/corner_x = 82.8557
p10a7/corner_y = -476.233

p11a0/dim1 = 11
p11a0/dim2 = ss
p11a0/dim3 = fs
p11a0/min_fs = 0
p11a0/min_ss = 0
p11a0/max_fs = 127
p11a0/max_ss = 63
p11a0/fs = -0.001708x +0.999998y
p11a0/ss = -0.999998x -0.001708y
p11a0/corner_x = 545.158
p11a0/corner_y = -633.02

p11a1/dim1 = 11
p11a1/dim2 = ss
p11a1/dim3 = fs
p11a1/min_fs = 0
p11a1/min_ss = 64
p11a1/max_fs = 127
p11a1/max_ss = 127
p11a1/fs = -0.001708x +0.999998y
p11a1/ss = -0.999998x -0.001708y
p11a1/corner_x = 479.159
p11a1/corner_y = -633.139

p11a2/dim1 = 11
p11a2/dim2 = ss
p11a2/dim3 = fs
p11a2/min_fs = 0
p11a2/min_ss = 128
p11a2/max_fs = 127
p11a2/max_ss = 191
p11a2/fs = -0.001708x +0.999998y
p11a2/ss = -0.999998x -0.001708y
p11a2/corner_x = 413.161
p11a2/corner_y = -633.259

p11a3/dim1 = 11
p11a3/dim2 = ss
p11a3/dim3 = fs
p11a3/min_fs = 0
p11a3/min_ss = 192
p11a3/max_fs = 127
p11a3/max_ss = 255
p11a3/fs = -0.001708x +0.999998y
p11a3/ss = -0.999998x -0.001708y
p11a3/corner_x = 347.164
p11a3/corner_y = -633.376

p11a4/dim1 = 11
p11a4/dim2 = ss
p11a4/dim3 = fs
p11a4/min_fs = 0
p11a4/min_ss = 256
p11a4/max_fs = 127
p11a4/max_ss = 319
p11a4/fs = -0.001708x +0.999998y
p11a4/ss = -0.999998x -0.001708y
p11a4/corner_x = 281.17
p11a4/corner_y = -633.495

p11a5/dim1 = 11
p11a5/dim2 = ss
p11a5/dim3 = fs
p11a5/min_fs = 0
p11a5/min_ss = 320
p11a5/max_fs = 127
p11a5/max_ss = 383
p11a5/fs = -0.001708x +0.999998y
p11a5/ss = -0.999998x -0.001708y
p11a5/corner_x = 215.172
p11a5/corner_y = -633.615

p11a6/dim1 = 11
p11a6/dim2 = ss
p11a6/dim3 = fs
p11a6/min_fs = 0
p11a6/min_ss = 384
p11a6/max_fs = 127
p11a6/max_ss = 447
p11a6/fs = -0.001708x +0.999998y
p11a6/ss = -0.999998x -0.001708y
p11a6/corner_x = 149.177
p11a6/corner_y = -633.732

p11a7/dim1 = 11
p11a7/dim2 = ss
p11a7/dim3 = fs
p11a7/min_fs = 0
p11a7/min_ss = 448
p11a7/max_fs = 127
p11a7/max_ss = 511
p11a7/fs = -0.001708x +0.999998y
p11a7/ss = -0.999998x -0.001708y
p11a7/corner_x = 83.1745
p11a7/corner_y = -633.85

p12a0/dim1 = 12
p12a0/dim2 = ss
p12a0/dim3 = fs
p12a0/min_fs = 0
p12a0/min_ss = 0
p12a0/max_fs = 127
p12a0/max_ss = 63
p12a0/fs = -0.004541x +0.999990y
p12a0/ss = -0.999990x -0.004541y
p12a0/corner_x = 554.713
p12a0/corner_y = 492.491

p12a1/dim1 = 12
p12a1/dim2 = ss
p12a1/dim3 = fs
p12a1/min_fs = 0
p12a1/min_ss = 64
p12a1/max_fs = 127
p12a1/max_ss = 127
p12a1/fs = -0.004541x +0.999990y
p12a1/ss = -0.999990x -0.004541y
p12a1/corner_x = 488.715
p12a1/corner_y = 492.146

p12a2/dim1 = 12
p12a2/dim2 = ss
p12a2/dim3 = fs
p12a2/min_fs = 0
p12a2/min_ss = 128
p12a2/max_fs = 127
p12a2/max_ss = 191
p12a2/fs = -0.004541x +0.999990y
p12a2/ss = -0.999990x -0.004541y
p12a2/corner_x = 422.718
p12a2/corner_y = 491.799

p12a3/dim1 = 12
p12a3/dim2 = ss
p12a3/dim3 = fs
p12a3/min_fs = 0
p12a3/min_ss = 192
p12a3/max_fs = 127
p12a3/max_ss = 255
p12a3/fs = -0.004541x +0.999990y
p12a3/ss = -0.999990x -0.004541y
p12a3/corner_x = 356.715
p12a3/corner_y = 491.591

p12a4/dim1 = 12
p12a4/dim2 = ss
p12a4/dim3 = fs
p12a4/min_fs = 0
p12a4/min_ss = 256
p12a4/max_fs = 127
p12a4/max_ss = 319
p12a4/fs = -0.004541x +0.999990y
p12a4/ss = -0.999990x -0.004541y
p12a4/corner_x = 290.715
p12a4/corner_y = 491.294

p12a5/dim1 = 12
p12a5/dim2 = ss
p12a5/dim3 = fs
p12a5/min_fs = 0
p12a5/min_ss = 320
p12a5/max_fs = 127
p12a5/max_ss = 383
p12a5/fs = -0.004541x +0.999990y
p12a5/ss = -0.999990x -0.004541y
p12a5/corner_x = 224.717
p12a5/corner_y = 490.992

p12a6/dim1 = 12
p12a6/dim2 = ss
p12a6/dim3 = fs
p12a6/min_fs = 0
p12a6/min_ss = 384
p12a6/max_fs = 127
p12a6/max_ss = 447
p12a6/fs = -0.004541x +0.999990y
p12a6/ss = -0.999990x -0.004541y
p12a6/corner_x = 158.717
p12a6/corner_y = 490.693

p12a7/dim1 = 12
p12a7/dim2 = ss
p12a7/dim3 = fs
p12a7/min_fs = 0
p12a7/min_ss = 448
p12a7/max_fs = 127
p12a7/max_ss = 511
p12a7/fs = -0.004541x +0.999990y
p12a7/ss = -0.999990x -0.004541y
p12a7/corner_x = 92.7161
p12a7/corner_y = 490.394

p13a0/dim1 = 13
p13a0/dim2 = ss
p13a0/dim3 = fs
p13a0/min_fs = 0
p13a0/min_ss = 0
p13a0/max_fs = 127
p13a0/max_ss = 63
p13a0/fs = -0.001160x +1.000000y
p13a0/ss = -1.000000x -0.001160y
p13a0/corner_x = 553.474
p13a0/corner_y = 334.118

p13a1/dim1 = 13
p13a1/dim2 = ss
p13a1/dim3 = fs
p13a1/min_fs = 0
p13a1/min_ss = 64
p13a1/max_fs = 127
p13a1/max_ss = 127
p13a1/fs = -0.001160x +1.000000y
p13a1/ss = -1.000000x -0.001160y
p13a1/corner_x = 487.475
p13a1/corner_y = 334.032

p13a2/dim1 = 13
p13a2/dim2 = ss
p13a2/dim3 = fs
p13a2/min_fs = 0
p13a2/min_ss = 128
p13a2/max_fs = 127
p13a2/max_ss = 191
p13a2/fs = -0.001160x +1.000000y
p13a2/ss = -1.000000x -0.001160y
p13a2/corner_x = 421.48
p13a2/corner_y = 333.942

p13a3/dim1 = 13
p13a3/dim2 = ss
p13a3/dim3 = fs
p13a3/min_fs = 0
p13a3/min_ss = 192
p13a3/max_fs = 127
p13a3/max_ss = 255
p13a3/fs = -0.001160x +1.000000y
p13a3/ss = -1.000000x -0.001160y
p13a3/corner_x = 355.482
p13a3/corner_y = 333.854

p13a4/dim1 = 13
p13a4/dim2 = ss
p13a4/dim3 = fs
p13a4/min_fs = 0
p13a4/min_ss = 256
p13a4/max_fs = 127
p13a4/max_ss = 319
p13a4/fs = -0.001160x +1.000000y
p13a4/ss = -1.000000x -0.001160y
p13a4/corner_x = 289.484
p13a4/corner_y = 333.767

p13a5/dim1 = 13
p13a5/dim2 = ss
p13a5/dim3 = fs
p13a5/min_fs = 0
p13a5/min_ss = 320
p13a5/max_fs = 127
p13a5/max_ss = 383
p13a5/fs = -0.001160x +1.000000y
p13a5/ss = -1.000000x -0.001160y
p13a5/corner_x = 223.469
p13a5/corner_y = 333.677

p13a6/dim1 = 13
p13a6/dim2 = ss
p13a6/dim3 = fs
p13a6/min_fs = 0
p13a6/min_ss = 384
p13a6/max_fs = 127
p13a6/max_ss = 447
p13a6/fs = -0.001160x +1.000000y
p13a6/ss = -1.000000x -0.001160y
p13a6/corner_x = 157.47
p13a6/corner_y = 333.59

p13a7/dim1 = 13
p13a7/dim2 = ss
p13a7/dim3 = fs
p13a7/min_fs = 0
p13a7/min_ss = 448
p13a7/max_fs = 127
p13a7/max_ss = 511
p13a7/fs = -0.001160x +1.000000y
p13a7/ss = -1.000000x -0.001160y
p13a7/corner_x = 91.4693
p13a7/corner_y = 333.502

p14a0/dim1 = 14
p14a0/dim2 = ss
p14a0/dim3 = fs
p14a0/min_fs = 0
p14a0/min_ss = 0
p14a0/max_fs = 127
p14a0/max_ss = 63
p14a0/fs = -0.004917x +0.999987y
p14a0/ss = -0.999987x -0.004917y
p14a0/corner_x = 555.703
p14a0/corner_y = 178.47

p14a1/dim1 = 14
p14a1/dim2 = ss
p14a1/dim3 = fs
p14a1/min_fs = 0
p14a1/min_ss = 64
p14a1/max_fs = 127
p14a1/max_ss = 127
p14a1/fs = -0.004917x +0.999987y
p14a1/ss = -0.999987x -0.004917y
p14a1/corner_x = 489.707
p14a1/corner_y = 178.144

p14a2/dim1 = 14
p14a2/dim2 = ss
p14a2/dim3 = fs
p14a2/min_fs = 0
p14a2/min_ss = 128
p14a2/max_fs = 127
p14a2/max_ss = 191
p14a2/fs = -0.004917x +0.999987y
p14a2/ss = -0.999987x -0.004917y
p14a2/corner_x = 423.711
p14a2/corner_y = 177.817

p14a3/dim1 = 14
p14a3/dim2 = ss
p14a3/dim3 = fs
p14a3/min_fs = 0
p14a3/min_ss = 192
p14a3/max_fs = 127
p14a3/max_ss = 255
p14a3/fs = -0.004917x +0.999987y
p14a3/ss = -0.999987x -0.004917y
p14a3/corner_x = 357.715
p14a3/corner_y = 177.489

p14a4/dim1 = 14
p14a4/dim2 = ss
p14a4/dim3 = fs
p14a4/min_fs = 0
p14a4/min_ss = 256
p14a4/max_fs = 127
p14a4/max_ss = 319
p14a4/fs = -0.004917x +0.999987y
p14a4/ss = -0.999987x -0.004917y
p14a4/corner_x = 291.717
p14a4/corner_y = 177.162

p14a5/dim1 = 14
p14a5/dim2 = ss
p14a5/dim3 = fs
p14a5/min_fs = 0
p14a5/min_ss = 320
p14a5/max_fs = 127
p14a5/max_ss = 383
p14a5/fs = -0.004917x +0.999987y
p14a5/ss = -0.999987x -0.004917y
p14a5/corner_x = 225.704
p14a5/corner_y = 176.833

p14a6/dim1 = 14
p14a6/dim2 = ss
p14a6/dim3 = fs
p14a6/min_fs = 0
p14a6/min_ss = 384
p14a6/max_fs = 127
p14a6/max_ss = 447
p14a6/fs = -0.004917x +0.999987y
p14a6/ss = -0.999987x -0.004917y
p14a6/corner_x = 159.703
p14a6/corner_y = 176.506

p14a7/dim1 = 14
p14a7/dim2 = ss
p14a7/dim3 = fs
p14a7/min_fs = 0
p14a7/min_ss = 448
p14a7/max_fs = 127
p14a7/max_ss = 511
p14a7/fs = -0.004917x +0.999987y
p14a7/ss = -0.999987x -0.004917y
p14a7/corner_x = 93.702
p14a7/corner_y = 176.178

p15a0/dim1 = 15
p15a0/dim2 = ss
p15a0/dim3 = fs
p15a0/min_fs = 0
p15a0/min_ss = 0
p15a0/max_fs = 127
p15a0/max_ss = 63
p15a0/fs = -0.001908x +1.000001y
p15a0/ss = -1.000001x -0.001908y
p15a0/corner_x = 555.67
p15a0/corner_y = 21.7039

p15a1/dim1 = 15
p15a1/dim2 = ss
p15a1/dim3 = fs
p15a1/min_fs = 0
p15a1/min_ss = 64
p15a1/max_fs = 127
p15a1/max_ss = 127
p15a1/fs = -0.001908x +1.000001y
p15a1/ss = -1.000001x -0.001908y
p15a1/corner_x = 489.671
p15a1/corner_y = 21.5719

p15a2/dim1 = 15
p15a2/dim2 = ss
p15a2/dim3 = fs
p15a2/min_fs = 0
p15a2/min_ss = 128
p15a2/max_fs = 127
p15a2/max_ss = 191
p15a2/fs = -0.001908x +1.000001y
p15a2/ss = -1.000001x -0.001908y
p15a2/corner_x = 423.673
p15a2/corner_y = 21.4396

p15a3/dim1 = 15
p15a3/dim2 = ss
p15a3/dim3 = fs
p15a3/min_fs = 0
p15a3/min_ss = 192
p15a3/max_fs = 127
p15a3/max_ss = 255
p15a3/fs = -0.001908x +1.000001y
p15a3/ss = -1.000001x -0.001908y
p15a3/corner_x = 357.676
p15a3/corner_y = 21.3079

p15a4/dim1 = 15
p15a4/dim2 = ss
p15a4/dim3 = fs
p15a4/min_fs = 0
p15a4/min_ss = 256
p15a4/max_fs = 127
p15a4/max_ss = 319
p15a4/fs = -0.001908x +1.000001y
p15a4/ss = -1.000001x -0.001908y
p15a4/corner_x = 291.676
p15a4/corner_y = 21.1757

p15a5/dim1 = 15
p15a5/dim2 = ss
p15a5/dim3 = fs
p15a5/min_fs = 0
p15a5/min_ss = 320
p15a5/max_fs = 127
p15a5/max_ss = 383
p15a5/fs = -0.001908x +1.000001y
p15a5/ss = -1.000001x -0.001908y
p15a5/corner_x = 225.658
p15a5/corner_y = 21.0437

p15a6/dim1 = 15
p15a6/dim2 = ss
p15a6/dim3 = fs
p15a6/min_fs = 0
p15a6/min_ss = 384
p15a6/max_fs = 127
p15a6/max_ss = 447
p15a6/fs = -0.001908x +1.000001y
p15a6/ss = -1.000001x -0.001908y
p15a6/corner_x = 159.659
p15a6/corner_y = 20.9111

p15a7/dim1 = 15
p15a7/dim2 = ss
p15a7/dim3 = fs
p15a7/min_fs = 0
p15a7/min_ss = 448
p15a7/max_fs = 127
p15a7/max_ss = 511
p15a7/fs = -0.001908x +1.000001y
p15a7/ss = -1.000001x -0.001908y
p15a7/corner_x = 93.659
p15a7/corner_y = 20.7794

































p0a0/coffset = 0.001112
p0a1/coffset = 0.001112
p0a2/coffset = 0.001112
p0a3/coffset = 0.001112
p0a4/coffset = 0.001112
p0a5/coffset = 0.001112
p0a6/coffset = 0.001112
p0a7/coffset = 0.001112
p1a0/coffset = 0.000934
p1a1/coffset = 0.000934
p1a2/coffset = 0.000934
p1a3/coffset = 0.000934
p1a4/coffset = 0.000934
p1a5/coffset = 0.000934
p1a6/coffset = 0.000934
p1a7/coffset = 0.000934
p2a0/coffset = 0.000685
p2a1/coffset = 0.000685
p2a2/coffset = 0.000685
p2a3/coffset = 0.000685
p2a4/coffset = 0.000685
p2a5/coffset = 0.000685
p2a6/coffset = 0.000685
p2a7/coffset = 0.000685
p3a0/coffset = 0.000920
p3a1/coffset = 0.000920
p3a2/coffset = 0.000920
p3a3/coffset = 0.000920
p3a4/coffset = 0.000920
p3a5/coffset = 0.000920
p3a6/coffset = 0.000920
p3a7/coffset = 0.000920
p4a0/coffset = 0.000750
p4a1/coffset = 0.000750
p4a2/coffset = 0.000750
p4a3/coffset = 0.000750
p4a4/coffset = 0.000750
p4a5/coffset = 0.000750
p4a6/coffset = 0.000750
p4a7/coffset = 0.000750
p5a0/coffset = 0.000863
p5a1/coffset = 0.000863
p5a2/coffset = 0.000863
p5a3/coffset = 0.000863
p5a4/coffset = 0.000863
p5a5/coffset = 0.000863
p5a6/coffset = 0.000863
p5a7/coffset = 0.000863
p6a0/coffset = 0.000926
p6a1/coffset = 0.000926
p6a2/coffset = 0.000926
p6a3/coffset = 0.000926
p6a4/coffset = 0.000926
p6a5/coffset = 0.000926
p6a6/coffset = 0.000926
p6a7/coffset = 0.000926
p7a0/coffset = 0.001421
p7a1/coffset = 0.001421
p7a2/coffset = 0.001421
p7a3/coffset = 0.001421
p7a4/coffset = 0.001421
p7a5/coffset = 0.001421
p7a6/coffset = 0.001421
p7a7/coffset = 0.001421
p8a0/coffset = 0.000612
p8a1/coffset = 0.000612
p8a2/coffset = 0.000612
p8a3/coffset = 0.000612
p8a4/coffset = 0.000612
p8a5/coffset = 0.000612
p8a6/coffset = 0.000612
p8a7/coffset = 0.000612
p9a0/coffset = 0.000765
p9a1/coffset = 0.000765
p9a2/coffset = 0.000765
p9a3/coffset = 0.000765
p9a4/coffset = 0.000765
p9a5/coffset = 0.000765
p9a6/coffset = 0.000765
p9a7/coffset = 0.000765
p10a0/coffset = 0.000965
p10a1/coffset = 0.000965
p10a2/coffset = 0.000965
p10a3/coffset = 0.000965
p10a4/coffset = 0.000965
p10a5/coffset = 0.000965
p10a6/coffset = 0.000965
p10a7/coffset = 0.000965
p11a0/coffset = 0.001074
p11a1/coffset = 0.001074
p11a2/coffset = 0.001074
p11a3/coffset = 0.001074
p11a4/coffset = 0.001074
p11a5/coffset = 0.001074
p11a6/coffset = 0.001074
p11a7/coffset = 0.001074
p12a0/coffset = 0.000598
p12a1/coffset = 0.000598
p12a2/coffset = 0.000598
p12a3/coffset = 0.000598
p12a4/coffset = 0.000598
p12a5/coffset = 0.000598
p12a6/coffset = 0.000598
p12a7/coffset = 0.000598
p13a0/coffset = 0.000584
p13a1/coffset = 0.000584
p13a2/coffset = 0.000584
p13a3/coffset = 0.000584
p13a4/coffset = 0.000584
p13a5/coffset = 0.000584
p13a6/coffset = 0.000584
p13a7/coffset = 0.000584
p14a0/coffset = 0.000549
p14a1/coffset = 0.000549
p14a2/coffset = 0.000549
p14a3/coffset = 0.000549
p14a4/coffset = 0.000549
p14a5/coffset = 0.000549
p14a6/coffset = 0.000549
p14a7/coffset = 0.000549
p15a0/coffset = 0.000481
p15a1/coffset = 0.000481
p15a2/coffset = 0.000481
p15a3/coffset = 0.000481
p15a4/coffset = 0.000481
p15a5/coffset = 0.000481
p15a6/coffset = 0.000481
p15a7/coffset = 0.000481
