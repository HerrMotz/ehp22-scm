# branch instruction
+ the branch instruction is read by the processor
+ we extract the 19 bits of the immediate value and "sign-extend" it: this means that the 19 bits are extended to 32 or 64 bits (we do not really know because this is unclear in the LEGv8 Simulator). This is necessary, because our immediate value is coded in two's complement. Simply adding leading bits would change the value completely. Effectively these leading bits are set to 1.
+ after that we multiply them by 4 (aka shift left twice)
+ this is added to the process counter (in our specific case subtracted)
+ we subtract our immediate -3 * 4 = -12 from our current process counter position
+ a multiplexer decides whether the branch is executed or not (right of the add)
+ this multiplexer takes an input from a series of gates, taking control bits of the instruction and the flags as inputs
+ the gates are arranged in such a way, that our branch 4 instruction bits allow the corresponding flag to get to the Mux.
+ if the input to the Mux is 1, the process counter is set to the value calculated by the "shift left 2"-adder


# what changes?
+ at some point the zero flag is 1 (subs x0, x0, #1 sets the zero flag to 1 after 4 loops) 
+ because our branch instruction is b.ne (Z == 0) we do not branch at this point, the process counter is set to pc + 4 bytes aka the next instruction (because the control bit for the Mux is zero)
