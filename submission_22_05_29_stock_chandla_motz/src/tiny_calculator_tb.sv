/**
 * Testbench for the tiny calculator.
 */
module ripple_carry_adder_4_tb;
  logic [7:0] l_i;
  logic [6:0] l_HEX0, l_HEX1, l_HEX2, l_HEX3;

  tiny_calculator dut( l_i,
                       l_HEX0,
                       l_HEX1,
                       l_HEX2,
                       l_HEX3 );

  initial begin
    $dumpfile("dump_tiny_calculator.vcd");
    $dumpvars;

    l_i = 8'b00000000;
    #10;
    assert( l_HEX0 === 7'b1000000 );
    assert( l_HEX1 === 7'b1000000 );
    assert( l_HEX2 === 7'b1000000 );
    assert( l_HEX3 === 7'b1000000 );
    
    l_i = 8'b00100011;
    #10;
    assert( l_HEX0 === 7'b0110000 );
    assert( l_HEX1 === 7'b0100100 );
    assert( l_HEX2 === 7'b0010010 );
    assert( l_HEX3 === 7'b1000000 );
    
    l_i = 8'b00010111;
    #10;
    assert( l_HEX0 === 7'b1111000 );
    assert( l_HEX1 === 7'b1111001 );
    assert( l_HEX2 === 7'b0000000 );
    assert( l_HEX3 === 7'b1000000 );
    
    l_i = 8'b10001000;
    #10;
    assert( l_HEX0 === 7'b0000000 );
    assert( l_HEX1 === 7'b0000000 );
    assert( l_HEX2 === 7'b1000000 );
    assert( l_HEX3 === 7'b1111001 );
    
    l_i = 8'b11111111;
    #10;
    assert( l_HEX0 === 7'b0001110 );
    assert( l_HEX1 === 7'b0001110 );
    assert( l_HEX2 === 7'b0000110 );
    assert( l_HEX3 === 7'b1111001 );

    $finish;
  end
endmodule
