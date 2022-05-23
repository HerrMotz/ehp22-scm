/**
 * Top-level entry of the tiny calculator.
 * The calculator adds the 4-bit binary numbers in SW[3:0] and SW[7:4].
 * The two inputs are shown on displays HEX0 and HEX1.
 * The result of the addition is shown on displays HEX2 and HEX3.
 *
 * @param SW bits of switch buttons SW7, SW6, SW5, SW4, SW3, SW2, SW1 and SW0.
 * @param HEX0 output bits which drive the seven-segment display HEX0.
 * @param HEX1 output bits which drive the seven-segment display HEX1.
 * @param HEX2 output bits which drive the seven-segment display HEX2.
 * @param HEX3 output bits which drive the seven-segment display HEX3.
 **/
module tiny_calculator( input  logic [7:0] SW,
                        output logic [6:0] HEX0,
                        output logic [6:0] HEX1,
                        output logic [6:0] HEX2,
                        output logic [6:0] HEX3 );
  logic [3:0] l_s;
  logic [3:0]l_carry_out;
  
  assign {l_carry_out, l_s} = SW[3:0] + SW[7:4];
  
  decoder m_d0 ( SW[3:0],
                 HEX0[6:0] );
  
  decoder m_d1 ( SW[7:4],
                 HEX1[6:0] );
  
  decoder m_d2 ( l_s[3:0],
                 HEX2[6:0] );

  decoder m_d3 ( l_carry_out,
                 HEX3[6:0] );
  
endmodule
