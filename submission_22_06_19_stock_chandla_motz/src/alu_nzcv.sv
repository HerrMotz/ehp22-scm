module alu_nzcv #(parameter N=64) ( input  logic [N-1:0] i_a,
                                                         i_b,
                                    input  logic [1:0]   i_alu_ctrl,
                                    output logic [N-1:0] o_result,
                                    output logic [3:0]   o_nzcv );

    logic l_carry_out;

    alu #(N) m_alu( i_a, i_b, i_alu_ctrl, o_result, l_carry_out );

    // negative flag
    assign o_nzcv[3] = o_result[N-1:N-1];

    // zero flag
    assign o_nzcv[2] = !o_result;

    // carry flag
    assign o_nzcv[1] = (!i_alu_ctrl[1:1] & l_carry_out);


    // overflow flag
    logic l_xor_temp;
    xor_3 m_xor_3(i_b[N-1:N-1], i_a[N-1:N-1], i_alu_ctrl[0:0], l_xor_temp); // C
    assign o_nzcv[0] = (
        (!i_alu_ctrl[1:1]) & // A
        (o_result[N-1:N-1] ^ i_a[N-1:N-1]) & // B
        (!l_xor_temp) // C
    );

endmodule