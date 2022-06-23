/**
 * Top-level module of the custom clocks.
 * The module displays a 10Hz clock signal through LEDR5, a 1Hz signal through LEDR6, and a 0.1Hz signal through LEDR7.
 * Switch button SW0 resets all resettable modules on low.
 *
 * @param MAX10_CLK1_50 MAX10_CLK1_50 clock signal available in the MAX 10 FPGA.
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 **/
module clocks_de10_lite( input  logic       MAX10_CLK1_50,
                         input  logic [9:0] SW,
                         output logic [9:0] LEDR );
                         
  logic m_ro0, m_ro1, m_ro2; 
  logic m_out0, m_out1, m_out2;
                         
  counter_mod_k_ro #(23) m_mk0( MAX10_CLK1_50, SW[0],   7'd2500000, m_ro0 );
  counter_mod_k_ro #(25) m_mk1( MAX10_CLK1_50, SW[0],  8'd25000000, m_ro1 );
  counter_mod_k_ro #(28) m_mk2( MAX10_CLK1_50, SW[0], 9'd250000000, m_ro2 );
                         
  clock m_clk0( m_ro0, SW[0], m_out0 ); // 10
  clock m_clk1( m_ro1, SW[0], m_out1 ); // 1
  clock m_clk2( m_ro2, SW[0], m_out2 ); // 0.1
  
  assign LEDR[5] = m_out0;
  assign LEDR[6] = m_out1;
  assign LEDR[7] = m_out2;
  
endmodule

