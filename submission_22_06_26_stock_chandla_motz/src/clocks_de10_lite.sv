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
                         
  counter_mod_k_ro #(20) m_ctr0( MAX10_CLK1_50, SW[0],   7'd5000000, LEDR[5] ); // 10
  counter_mod_k_ro #(26) m_ctr1( MAX10_CLK1_50, SW[1],  8'd50000000, LEDR[6] ); // 1
  counter_mod_k_ro #(29) m_ctr2( MAX10_CLK1_50, SW[2], 9'd500000000, LEDR[7] ); // 0.1
  
endmodule
