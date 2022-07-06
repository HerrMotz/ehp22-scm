        .text
        .align 4
        .type   fibonacci_asm, %function
        .global fibonacci_asm
fibonacci_asm:
        // x0 -> i_id (id-th fibonacci number)
        // x1 -> n-1 fibonacci number
        // x2 -> n-2 fibonacci number
        // x3 -> temp

        // initialise x1 with 1
        mov x1, #1
        mov x2, #0
        mov x3, #0

        // otherwise it would run 1 too far
        sub x0, x0, #1

start_loop:
        cmp x0, #0
        sub x0, x0, #1
        b.eq end_loop

        add x3, x1, x2
        mov x2, x1
        mov x1, x3

        b start_loop

end_loop:
        mov x0, x3
        ret
        .size   fibonacci_asm, (. - fibonacci_asm)