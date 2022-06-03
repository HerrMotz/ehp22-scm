module alu #(parameter N=64) ( input  logic [N-1:0] i_a,
                                                    i_b,
                               input  logic [1:0]   i_alu_ctrl,
                               output logic [N-1:0] o_result,
                               output logic         o_carry_out );

  logic [N-1:0] l_adder, l_and, l_or, l_b;
  
  mux_2 #(N) m_mux2( i_b, ~i_b, i_alu_ctrl[0:0], l_b );
  adder #(N) a_1( i_a, l_b, i_alu_ctrl[0:0], l_adder, o_carry_out );
  
  
  assign l_and = i_a & i_b;
  assign l_or  = i_a | i_b;
  
  mux_4 #(N) m_mux4( l_adder, l_adder, l_and, l_or, i_alu_ctrl, o_result );

endmodule
