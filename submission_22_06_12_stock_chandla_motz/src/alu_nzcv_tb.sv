/*
 * Testbench ALU_NZCV
 */
module alu_nzcv_tb;
  logic [1:0]  l_op;
  logic [31:0] l_a,
               l_b,
               l_out;
  logic [3:0]  l_nzcv;

  alu_nzcv #(32) dut( l_a, l_b, l_op, l_out, l_nzcv );
  
  initial begin
    $dumpfile("dump_alu_nzcv_tb.vcd");
    $dumpvars;
    
    //
    // add
    //
    l_a  = 32'h0000_0000;
    l_b  = 32'h0000_0000;
    l_op = 2'b00;
    
    #10;
    assert( l_out === 32'h0000_0000);
    assert( l_nzcv === 4'b0100);

    l_a  = 32'h0000_0000;
    l_b  = 32'hffff_ffff;

    #10;
    assert( l_out === 32'hffff_ffff);
    assert( l_nzcv === 4'b1000);

    l_a  = 32'h0000_0001;
    l_b  = 32'hffff_ffff;

    #10;
    assert( l_out === 32'h0000_0000);
    assert( l_nzcv === 4'b0110);

    l_a  = 32'h0000_ffff;
    l_b  = 32'h0000_0001;

    #10;
    assert( l_out === 32'h0001_0000);
    assert( l_nzcv === 4'b0000);

    //
    // sub
    //
    l_op = 2'b01;
    
    l_a  = 32'h0000_0000;
    l_b  = 32'h0000_0000;

    #10;
    assert( l_out === 32'h0000_0000);
    assert( l_nzcv === 4'b0110);

    l_a  = 32'h0001_0000;
    l_b  = 32'h0000_0001;

    #10;
    assert( l_out === 32'h0000_ffff);
    assert( l_nzcv === 4'b0010);

    //
    // and
    //
    l_op = 2'b10;
    
    l_a  = 32'hffff_ffff;
    l_b  = 32'hffff_ffff;

    #10;
    assert( l_out === 32'hffff_ffff);
    assert( l_nzcv === 4'b1000);

    l_a  = 32'hffff_ffff;
    l_b  = 32'h7743_3477;

    #10;
    assert( l_out === 32'h7743_3477);
    assert( l_nzcv === 4'b0000);

    l_a  = 32'h0000_0000;
    l_b  = 32'hffff_ffff;

    #10;
    assert( l_out === 32'h0000_0000);
    assert( l_nzcv === 4'b0100);

    //
    // or
    //
    l_op = 2'b11;
    
    l_a  = 32'h0000_0000;
    l_b  = 32'hffff_ffff;

    #10;
    assert( l_out === 32'hffff_ffff);
    assert( l_nzcv === 4'b1000);

    $finish;
  end
endmodule