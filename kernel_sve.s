.global kernel_sve_fp32

kernel_sve_fp32:
    ptrue   p0.s
    
    eor z0.s, p0/m, z0.s, z0.s
    eor z1.s, p0/m, z1.s, z1.s
    eor z2.s, p0/m, z2.s, z2.s
    eor z3.s, p0/m, z3.s, z3.s

    eor z4.s, p0/m, z4.s, z4.s
    eor z5.s, p0/m, z5.s, z5.s
    eor z6.s, p0/m, z6.s, z6.s
    eor z7.s, p0/m, z7.s, z7.s

    eor z8.s, p0/m, z8.s, z8.s
    eor z9.s, p0/m, z9.s, z9.s
    eor z10.s, p0/m, z10.s, z10.s
    eor z11.s, p0/m, z11.s, z11.s

    eor z12.s, p0/m, z12.s, z12.s
    eor z13.s, p0/m, z13.s, z13.s
    eor z14.s, p0/m, z14.s, z14.s
    eor z15.s, p0/m, z15.s, z15.s

    eor z16.s, p0/m, z16.s, z16.s
    eor z17.s, p0/m, z17.s, z17.s
    eor z18.s, p0/m, z18.s, z18.s
    eor z19.s, p0/m, z19.s, z19.s

    eor z20.s, p0/m, z20.s, z20.s
    eor z21.s, p0/m, z21.s, z21.s
    eor z22.s, p0/m, z22.s, z22.s
    eor z23.s, p0/m, z23.s, z23.s

    eor z24.s, p0/m, z24.s, z24.s
    eor z25.s, p0/m, z25.s, z25.s
    eor z26.s, p0/m, z26.s, z26.s
    eor z27.s, p0/m, z27.s, z27.s

    eor z28.s, p0/m, z28.s, z28.s
    eor z29.s, p0/m, z29.s, z29.s
    eor z30.s, p0/m, z30.s, z30.s
    eor z31.s, p0/m, z31.s, z31.s

.loop2:
    fmla z0.s, p0/m, z0.s, z0.s
    fmla z1.s, p0/m, z1.s, z1.s
    fmla z2.s, p0/m, z2.s, z2.s
    fmla z3.s, p0/m, z3.s, z3.s

    fmla z4.s, p0/m, z4.s, z4.s
    fmla z5.s, p0/m, z5.s, z5.s
    fmla z6.s, p0/m, z6.s, z6.s
    fmla z7.s, p0/m, z7.s, z7.s

    fmla z8.s, p0/m, z8.s, z8.s
    fmla z9.s, p0/m, z9.s, z9.s
    fmla z10.s, p0/m, z10.s, z10.s
    fmla z11.s, p0/m, z11.s, z11.s

    fmla z12.s, p0/m, z12.s, z12.s
    fmla z13.s, p0/m, z13.s, z13.s
    fmla z14.s, p0/m, z14.s, z14.s
    fmla z15.s, p0/m, z15.s, z15.s

    fmla z16.s, p0/m, z16.s, z16.s
    fmla z17.s, p0/m, z17.s, z17.s
    fmla z18.s, p0/m, z18.s, z18.s
    fmla z19.s, p0/m, z19.s, z19.s

    fmla z20.s, p0/m, z20.s, z20.s
    fmla z21.s, p0/m, z21.s, z21.s
    fmla z22.s, p0/m, z22.s, z22.s
    fmla z23.s, p0/m, z23.s, z23.s

    fmla z24.s, p0/m, z24.s, z24.s
    fmla z25.s, p0/m, z25.s, z25.s
    fmla z26.s, p0/m, z26.s, z26.s
    fmla z27.s, p0/m, z27.s, z27.s

    fmla z28.s, p0/m, z28.s, z28.s
    fmla z29.s, p0/m, z29.s, z29.s
    fmla z30.s, p0/m, z30.s, z30.s
    fmla z31.s, p0/m, z31.s, z31.s

    subs x0, x0, #1
    bne .loop2
    ret
