// copy_c.c compiled using gcc
// with option -O2 optimisation flag

// this optimised code uses ldp and stp,
// which can load/store a pair of registers,
// so we can process 16 bytes using one instruction

// because we only have 7 registers our last instruction
// is a simple ldr and str

        .arch armv8-a
        .file   "copy_c.c"
        .text
        .align  2
        .p2align 4,,11
        .global copy_c
        .type   copy_c, %function
copy_c:
.LFB0:
        .cfi_startproc

        ldp     x7, x6, [x0]
        ldp     x5, x4, [x0, 16]
        ldp     x3, x2, [x0, 32]
        ldr     x0, [x0, 48]
        stp     x7, x6, [x1]
        stp     x5, x4, [x1, 16]
        stp     x3, x2, [x1, 32]
        str     x0, [x1, 48]
        ret
        .cfi_endproc
.LFE0:
        .size   copy_c, .-copy_c
        .ident  "GCC: (Ubuntu 10.3.0-1ubuntu1~20.10) 10.3.0"
        .section        .note.GNU-stack,"",@progbits