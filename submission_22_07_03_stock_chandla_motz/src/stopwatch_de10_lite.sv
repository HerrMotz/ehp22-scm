/**
 * Top-level module of the stopwatch.
 * Switch button SW0 resets all resettable modules on low.
 *
 * @param MAX10_CLK1_50 MAX10_CLK1_50 clock signal available in the MAX 10 FPGA.
 * @param SW bits of ten switch buttons SW9 - SW0.
 * @param LEDR output bits corresponding to the board's ten leds LEDR9 - LEDR0.
 **/
 
module stopwatch_de10_lite( input  logic       MAX10_CLK1_50,
                            input  logic [9:0] SW,
                            output logic [9:0] LEDR,
                            output logic [6:0] HEX0,
                            output logic [7:0] HEX1,
                            output logic [6:0] HEX2,
                            output logic [6:0] HEX3,
                            output logic [6:0] HEX4,
                            output logic [6:0] HEX5 );
  
  logic [21:0] l_mod_s_01;
  logic [24:0] l_mod_s_1;
  logic [27:0] l_mod_s_10;
  logic [30:0] l_mod_s_60;
  logic [33:0] l_mod_s_600;
  
  logic [6:0] l_HEX3;

  logic l_reset;
  logic l_clk_50mhz;

  // rollover signals: 0.1s, 1s, 10s
  logic l_ro_s_01;
  logic l_ro_s_1;
  logic l_ro_s_10;
  logic l_ro_s_60;		// 1/60 Hz 
  logic l_ro_s_600;		// 1/600 Hz
  
  logic [3:0] l_ro_s_01_out;
  logic [3:0] l_ro_s_1_out;
  logic [3:0] l_ro_s_10_out;
  logic [3:0] l_ro_s_60_out;		
  logic [3:0] l_ro_s_600_out;
  
  // clock signals: 0.1s, 1s, 10s
  logic l_clk_s_01;		//0.1s
  logic l_clk_s_1;
  logic l_clk_s_10;
  logic l_clk_s_60;		//1/60 Hz
  logic l_clk_s_600;		//1/600 Hz

  // assign input clock to internal signal
  assign l_clk_50mhz = MAX10_CLK1_50;
  
  // assign reset to disabled switch button 0
  assign l_reset = ~SW[0];

  // k for mod k computation w.r.t. 50Hz clock: 0.1s, 1s, 10s
  assign l_mod_s_01 = 22'd2500000;
  assign l_mod_s_1  = 25'd25000000;
  assign l_mod_s_10 = 28'd250000000;
  assign l_mod_s_60 = 31'd1500000000;
  assign l_mod_s_600 = 34'd15000000000;

  // 0.1s clock
  counter_mod_k_ro #(22) counter_over_01s( l_clk_50mhz,
                                           l_reset,
                                           l_mod_s_01,
                                           l_ro_s_01 );

  clock clock_01s( l_ro_s_01,
                   l_reset,
                   l_clk_s_01 );
                   
  counter_mod_k_count #(4) counter_over_01s_out( l_clk_s_01,
                                                l_reset,
                                                4'd10,
                                                l_ro_s_01_out );

  // 1s clock
  counter_mod_k_ro #(25) counter_over_1s( l_clk_50mhz,
                                          l_reset,
                                          l_mod_s_1,
                                          l_ro_s_1 );

  clock clock_1s( l_ro_s_1,
                  l_reset,
                  l_clk_s_1 );
                                     
  counter_mod_k_count #(4) counter_over_1s_out( l_clk_s_1,
                                                l_reset,
                                                4'd10,
                                                l_ro_s_1_out );

  // 10s clock
  counter_mod_k_ro #(28) counter_over_10s( l_clk_50mhz,
                                           l_reset,
                                           l_mod_s_10,
                                           l_ro_s_10 );

  clock clock_10s( l_ro_s_10,
                   l_reset,
                   l_clk_s_10 );
                                      
  counter_mod_k_count #(3) counter_over_10s_out( l_clk_s_10,
                                                l_reset,
                                                3'd6,
                                                l_ro_s_10_out );
  // 60s clock
  counter_mod_k_ro #(31) counter_over_60s( l_clk_50mhz,
                                           l_reset,
                                           l_mod_s_60,
                                           l_ro_s_60 );

  clock clock_60s( l_ro_s_60,
                   l_reset,
                   l_clk_s_60 );
                                      
  counter_mod_k_count #(4) counter_over_60s_out( l_clk_s_60,
                                                 l_reset,
                                                 4'd10,
                                                 l_ro_s_60_out );
  // 600s clock
  counter_mod_k_ro #(34) counter_over_600s( l_clk_50mhz,
                                            l_reset,
                                            l_mod_s_600,
                                            l_ro_s_600 );

  clock clock_600s( l_ro_s_600,
                   l_reset,
                   l_clk_s_600 );
                                      
  counter_mod_k_count #(4) counter_over_600s_out( l_clk_s_600,
                                                  l_reset,
                                                  7'd99,
                                                  l_ro_s_600_out );
  
  //Decoder                                         
  decoder m_decoder_01  ( l_ro_s_01_out, HEX0[6:0] );
  decoder m_decoder_1   ( l_ro_s_1_out, HEX1[6:0] );
  decoder m_decoder_10  ( l_ro_s_10_out, HEX2[6:0] );
  decoder m_decoder_60  ( l_ro_s_60_out, HEX4[6:0] );
  decoder m_decoder_600 ( l_ro_s_600_out, HEX5[6:0] );
  
  assign HEX3[6] = l_clk_s_1;
  assign HEX3[5:0] = 6'b111111;

  // assign LEDs to clocks: 0.1s, 1s, 10s
  assign LEDR[5] = l_clk_s_01;
  assign LEDR[6] = l_clk_s_1;
  assign LEDR[7] = l_clk_s_10;
  assign LEDR[8] = l_clk_s_60;
  assign LEDR[9] = l_clk_s_600;
  
  assign HEX1[7] = 1'b0;
  
endmodule
