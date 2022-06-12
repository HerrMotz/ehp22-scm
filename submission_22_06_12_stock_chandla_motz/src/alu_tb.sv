/**
 * Testbench ALU.
 */
module alu_tb;
  logic [1:0] l_op;
  logic [7:0] l_a,
              l_b,
              l_out;
  logic       l_carry_out;

  alu #(8) dut( l_a, l_b, l_op, l_out, l_carry_out );

  initial begin
    $dumpfile("dump_alu_tb.vcd");
    $dumpvars;

    //
    // add
    //
    l_a  = 8'b0000_0000;
    l_b  = 8'b0000_0000;
    l_op = 2'b00;
    
    #10;
    assert( l_out === 8'b0000_0000 );
    assert( l_carry_out === 1'b0 );
    
    l_a  = 8'b1011_1101;
    l_b  = 8'b1010_0101;
    
    #10;
    assert( l_out === 8'b0110_0010 );
    assert( l_carry_out === 1'b1 );
    
    //
    // sub
    //
    l_op = 2'b01;
    
    l_a  = 8'b1011_1101;
    l_b  = 8'b1010_0101;
    
    #10;
    assert( l_out === 8'b0001_1000 );
    assert( l_carry_out === 1'b1 );
    
    //
    // and
    //
    l_op = 2'b10;
    
    l_a  = 8'b1011_1101;
    l_b  = 8'b1010_0101;
    
    #10;
    assert( l_out === 8'b1010_0101 );
    assert( l_carry_out === 1'b1 );
    
    //
    // or
    //
    l_op = 2'b11;
   
    l_a  = 8'b1011_1101;
    l_b  = 8'b1010_0101;
    
    #10;
    assert( l_out === 8'b1011_1101 );
    assert( l_carry_out === 1'b1 );

    $finish;
  end
endmodule

// ato894w9
