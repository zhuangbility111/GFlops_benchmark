.global kernel_neon_fp32

kernel_neon_fp32:
    eor    v0.16b, v0.16b, v0.16b 
    eor    v1.16b, v1.16b, v1.16b 
    eor    v2.16b, v2.16b, v2.16b
    eor    v3.16b, v3.16b, v3.16b

    eor    v4.16b, v4.16b, v4.16b
    eor    v5.16b, v5.16b, v5.16b
    eor    v6.16b, v6.16b, v6.16b
    eor    v7.16b, v7.16b, v7.16b

    eor    v8.16b, v8.16b, v8.16b 
    eor    v9.16b, v9.16b, v9.16b 
    eor    v10.16b, v10.16b, v10.16b
    eor    v11.16b, v11.16b, v11.16b

    eor    v12.16b, v12.16b, v12.16b
    eor    v13.16b, v13.16b, v13.16b
    eor    v14.16b, v14.16b, v14.16b
    eor    v15.16b, v15.16b, v15.16b

    eor    v16.16b, v16.16b, v16.16b
    eor    v17.16b, v17.16b, v17.16b
    eor    v18.16b, v18.16b, v18.16b
    eor    v19.16b, v19.16b, v19.16b

    eor    v20.16b, v20.16b, v20.16b
    eor    v21.16b, v21.16b, v21.16b
    eor    v22.16b, v22.16b, v22.16b
    eor    v23.16b, v23.16b, v23.16b

    eor    v24.16b, v24.16b, v24.16b
    eor    v25.16b, v25.16b, v25.16b
    eor    v26.16b, v26.16b, v26.16b
    eor    v27.16b, v27.16b, v27.16b
    
    eor    v28.16b, v28.16b, v28.16b
    eor    v29.16b, v29.16b, v29.16b
    eor    v30.16b, v30.16b, v30.16b
    eor    v31.16b, v31.16b, v31.16b

.loop1:
    fmla v0.4s, v0.4s, v0.4s
    fmla v1.4s, v1.4s, v1.4s
    fmla v2.4s, v2.4s, v2.4s
    fmla v3.4s, v3.4s, v3.4s

    fmla v4.4s, v4.4s, v4.4s
    fmla v5.4s, v5.4s, v5.4s
    fmla v6.4s, v6.4s, v6.4s
    fmla v7.4s, v7.4s, v7.4s

    fmla v8.4s, v8.4s, v8.4s
    fmla v9.4s, v9.4s, v9.4s
    fmla v10.4s, v10.4s, v10.4s
    fmla v11.4s, v11.4s, v11.4s

    fmla v12.4s, v12.4s, v12.4s
    fmla v13.4s, v13.4s, v13.4s
    fmla v14.4s, v14.4s, v14.4s
    fmla v15.4s, v15.4s, v15.4s

    fmla v16.4s, v16.4s, v16.4s
    fmla v17.4s, v17.4s, v17.4s
    fmla v18.4s, v18.4s, v18.4s
    fmla v19.4s, v19.4s, v19.4s

    fmla v20.4s, v20.4s, v20.4s
    fmla v21.4s, v21.4s, v21.4s
    fmla v22.4s, v22.4s, v22.4s
    fmla v23.4s, v23.4s, v23.4s

    fmla v24.4s, v24.4s, v24.4s
    fmla v25.4s, v25.4s, v25.4s
    fmla v26.4s, v26.4s, v26.4s
    fmla v27.4s, v27.4s, v27.4s

    fmla v28.4s, v28.4s, v28.4s
    fmla v29.4s, v29.4s, v29.4s
    fmla v30.4s, v30.4s, v30.4s
    fmla v31.4s, v31.4s, v31.4s

    subs x0, x0, #1
    bne .loop1
    ret
