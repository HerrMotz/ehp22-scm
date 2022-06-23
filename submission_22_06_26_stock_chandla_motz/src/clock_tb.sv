/**
 * Testbench of the clock derived from a counter's rollover signal.
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

    // TODO: finish testbench

    $finish;
  end
endmodule