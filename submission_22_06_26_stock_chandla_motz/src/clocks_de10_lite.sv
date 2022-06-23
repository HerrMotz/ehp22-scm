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
                         
  counter_mod_k_ro m_mk0( MAX10_CLK1_50, SW[0],   7'd2500000, m_ro0 );
  counter_mod_k_ro m_mk0( MAX10_CLK1_50, SW[1],  8'd25000000, m_ro1 );
  counter_mod_k_ro m_mk0( MAX10_CLK1_50, SW[2], 9'd250000000, m_ro2 );
                         
  clock #(22) m_clk0( m_ro0, SW[0], LEDR[5] ); // 10
  clock #(22) m_clk0( m_ro1, SW[1], LEDR[5] ); // 1
  clock #(22) m_clk0( m_ro2, SW[2], LEDR[5] ); // 0.1
  
endmodule
