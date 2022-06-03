/**
 * Testbench for the Multiplexer 2. Very descriptive...
 */
module mux_4_tb;
  logic [3:0] l_in0;
  logic [3:0] l_in1;
  logic [3:0] l_in2;
  logic [3:0] l_in3;
  logic [1:0] l_s;
  logic [3:0] l_out;

  mux_4 #(4) dut( l_in0,
                  l_in1,
                  l_in2,
                  l_in3,
                  l_s,
                  l_out );

  initial begin
    $dumpfile("dump_mux_4_tb.vcd");
    $dumpvars;

    l_in0 = 2'b00;
    l_in1 = 2'b01;
    l_in2 = 2'b10;
    l_in3 = 2'b11;
    
    l_s   = 2'b00;
    #10;
    assert( l_out === l_in0 );
    
    l_s   = 2'b01;
    #10;
    assert( l_out === l_in1 );
    
    l_s   = 2'b10;
    #10;
    assert( l_out === l_in2 );
    
    l_s   = 2'b11;
    #10;
    assert( l_out === l_in3 );

    $finish;
  end
endmodule
