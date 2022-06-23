/**
 * Outputs a clock signal based on the given rollover signal.
 * The clock signal changes on every positive edge of the rollover signal.
 * On a positive edge of the reset signal, the clock is reset to high.
 *
 * @param i_roll_over rollover signal.
 * @param i_reset reset signal.
 * @param o_clk set to generated clock signal.
 **/
module clock( input  logic i_roll_over,
              input  logic i_reset,
              output logic o_clk );
  logic m_clk;

  // TODO: finish implementation

  assign o_clk = m_clk;
endmodule