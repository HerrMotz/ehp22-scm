/**
 * Top-level entry for the seven-segment display decoder.
 * The decoder shows the binary number represented
 * by SW3-SW0 of a DE10 Lite board on HEX0 as a hex number.
 *
 * @param SW bits of switch buttons SW3, SW2, SW1 and SW0.
 * @param HEX0 output bits which drive the seven-segment display HEX0.
 **/
module tiny_calculator_de10_lite( input  logic [7:0] SW,
                                  output       [6:0] HEX0, 
											 output       [6:0] HEX1, 
											 output       [6:0] HEX2;										 output       [6:0] HEX3 );
  tiny_calculator tc( SW, HEX0, HEX1, HEX2, HEX3 );
endmodule
