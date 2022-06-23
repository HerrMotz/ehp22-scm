/**
 * k = 3
 * Testbench of the clock derived from a counter's rollover signal.
 * reset:    | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |  0 | ...
 * cycle     | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | ...
 * mod k     | 0 | 1 | 2 | 0 | 1 | 2 | 0 | 1 | 2 | 0 |  1 | ...
 * rollover: | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 |  0 | ...
 * clock:    | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 |  0 | ...
 **/
module clock_tb;
  logic l_reset;
  logic l_roll_over;
  logic l_clk;

  // reset
  initial
    begin
      l_reset <= 1;
      #3;
      l_reset <= 0;
    end

  clock dut( l_roll_over,
             l_reset,
             l_clk );

  initial begin
    $dumpfile("dump_clock.vcd");
    $dumpvars;
    
    l_roll_over = 1'b0;

    #5;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b1;
    #1;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b1;
    #1;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b1;
    #1;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b1;
    #1;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b0;
    assert( l_clk === 1'b0 );
    
    #10;
    l_roll_over = 1'b1;
    #1;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    #1;
    assert( l_clk === 1'b1 );
    
    #10;
    l_roll_over = 1'b0;
    l_reset = 1'b1;
    #1;
    assert( l_clk === 1'b0 );
    
    #10;

    $finish;
  end
endmodule
