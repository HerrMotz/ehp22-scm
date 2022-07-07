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
