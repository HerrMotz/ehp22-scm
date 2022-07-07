//
// copy_asm
//

        .text
        .align 4
        .type   copy_asm, %function
        .global copy_asm
copy_asm:
        // very fancy codet
        ldr x3, [x0]
        str x3, [x1]

        ldr x3, [x0, #8]
        str x3, [x1, #8]

        ldr x3, [x0, #16]
        str x3, [x1, #16]

        ldr x3, [x0, #24]
        str x3, [x1, #24]

        ldr x3, [x0, #32]
        str x3, [x1, #32]

        ldr x3, [x0, #40]
        str x3, [x1, #40]

        ldr x3, [x0, #48]
	str x3, [x1, #48]

        ret
        .size   copy_asm, (. - copy_asm)

//
// copy_asm_loop
//

        .text
        .align 4
        .type   copy_asm_loop, %function
        .global copy_asm_loop

copy_asm_loop:
        // x0 i_a
        // x1 o_b
        // x2 counter
        // x3 temporary register
        mov x2, #8

start_loop:
        ldr x3, [x0]
        str x3, [x1]

        add x0, x0, #8
        add x1, x1, #8

        sub x2, x2, #1

        b start_loop

end_loop:

        ret
        .size   copy_asm_loop, (. - copy_asm_loop)
