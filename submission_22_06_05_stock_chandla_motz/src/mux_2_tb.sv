/**
 * Testbench for the Multiplexer 2. Very descriptive...
 */
module mux_2_tb;
  logic [3:0] l_in0;
  logic [3:0] l_in1;
  logic       l_s;
  logic [3:0] l_out;

  mux_2 #(4) dut( l_in0,
                  l_in1,
                  l_s,
                  l_out );

  initial begin
    $dumpfile("dump_mux_2_tb.vcd");
    $dumpvars;

    l_in0 = 4'b1010;
    l_in1 = 4'b0101;
    l_s   = 0;
    #10;
    assert( l_out === l_in0 );
    
    l_s   = 1;
    #10;
    assert( l_out === l_in1 );
    
    l_in1 = 4'b1100;
    l_s   = 1;
    #10;
    assert( l_out === l_in1 );
    
    l_in0 = 4'b1111;
    l_s   = 0;
    #10;
    assert( l_out === l_in0 );

    $finish;
  end
endmodule
