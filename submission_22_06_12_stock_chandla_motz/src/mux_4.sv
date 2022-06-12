module mux_4 #(parameter N=64) ( input  logic [N-1:0] i_in0,
                                                      i_in1,
                                                      i_in2,
                                                      i_in3,
                                 input  logic [1:0]   i_s,
                                 output logic [N-1:0] o_out );
                              
  logic [N-1:0] l_out_0;
  logic [N-1:0] l_out_1;
  
  mux_2 #(N) m_mux2_0( i_in0   , i_in1   , i_s[0:0] , l_out_0 );
  mux_2 #(N) m_mux2_1( i_in2   , i_in3   , i_s[0:0] , l_out_1 );
  mux_2 #(N) m_mux2_2( l_out_0 , l_out_1 , i_s[1:1] , o_out   );
                       
endmodule
