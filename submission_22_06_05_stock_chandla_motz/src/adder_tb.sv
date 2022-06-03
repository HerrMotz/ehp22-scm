/**
 * Testbench of the adder with a carry-in and carry-out.
 */
module adder_tb;
  logic [7:0] l_a, l_b, l_c;
  logic l_carry_in, l_carry_out;
  adder #(8) dut( l_a,
                   l_b,
                   l_carry_in,
                   l_c,
                   l_carry_out );
  initial begin
    $dumpfile("dump_adder_tb.vcd");
    $dumpvars;
    l_carry_in = 1'b0;
    l_a = 8'b0000_0000;
    l_b = 8'b0000_0000;
    
    #10;
    assert( l_c === 8'b0000_0000 );
    assert( l_carry_out === 1'b0 );
    

    // 2nd test    
    l_carry_in = 1'b0;
    l_a = 8'b1011_1101;
    l_b = 8'b1010_0101;
    
    #10;
    assert( l_c === 8'b0110_0010 );
    assert( l_carry_out === 1'b1 );
    
    
    // 3rd test
    l_carry_in = 1'b0;
    l_a = 8'b1111_0000;
    l_b = 8'b0000_1111;
    
    #10;
    assert( l_c === 8'b1111_1111 );
    assert( l_carry_out === 1'b0 );
    
    // 4th test
    l_carry_in = 1'b0;
    l_a = 8'b1111_0000;
    l_b = 8'b1000_1111;
    
    #10;
    assert( l_c === 8'b0111_1111 );
    assert( l_carry_out === 1'b1 );
    
  end
endmodule
