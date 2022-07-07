        .text
        .align 4
        .type   add_asm, %function
        .global add_asm
add_asm:

start_loop:
        // x0 -> i_n_values
        // x1 -> *i_a
        // x2 -> *i_b
        // x3 -> *o_c
        cmp x0, #0
        b.eq end_loop

        // x4 -> a
        // x5 -> b
        // x6 -> a+b

        ldr x4, [x1]
        ldr x5, [x2]

        add x6, x4, x5

        str x6, [x3]

        add x1, x1, #8
        add x2, x2, #8
        add x3, x3, #8

        sub x0, x0, #1

        b start_loop

end_loop:

        ret
        .size   add_asm, (. - add_asm)
