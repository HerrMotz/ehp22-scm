        .arch armv8-a
        .file   "add_c.c"
        .text
        .align  2
        .p2align 4,,11
        .global add_c
        .type   add_c, %function
add_c:
.LFB0:
        .cfi_startproc
        // x0 is our i_n_values
        cbz     x0, .L1

        // x4 is our counter
        mov     x4, 0
        .p2align 3,,7

        // x1 i_a
        // x2 i_b
        // x3 o_c
.L3:
        // loads using register offset:
        // https://developer.arm.com/documentation/dui0552/a/the-cortex-m3-instruction-set/memory-access-instructions/ldr-and-str--register-offset
        ldr     x5, [x1, x4, lsl 3]
        ldr     x6, [x2, x4, lsl 3]

        // adds the loaded values from x1, x2
        add     x5, x5, x6

        // stores them back using register offset
        str     x5, [x3, x4, lsl 3]

        // increase counter
        add     x4, x4, 1

        // compare whether our counter
        // is at its limit.
        // l_va < i_n_values
        cmp     x0, x4
        bne     .L3
.L1:
        ret
        .cfi_endproc
.LFE0:
        .size   add_c, .-add_c
        .ident  "GCC: (Ubuntu 10.3.0-1ubuntu1~20.10) 10.3.0"
        .section        .note.GNU-stack,"",@progbits