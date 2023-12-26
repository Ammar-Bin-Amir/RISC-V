module tb_type_decoder;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [6:0] opcode;
    logic r_type;
    logic i_type_lw;
    logic i_type_addi;
    logic i_type_jalr;
    logic s_type;
    logic sb_type;
    logic u_type_auipc;
    logic u_type_lui;
    logic uj_type;

    type_decoder dut (
        .opcode (opcode),
        .r_type (r_type),
        .i_type_lw (i_type_lw),
        .i_type_addi (i_type_addi),
        .i_type_jalr (i_type_jalr),
        .s_type (s_type),
        .sb_type (sb_type),
        .u_type_auipc (u_type_auipc),
        .u_type_lui (u_type_lui),
        .uj_type (uj_type)
    );

    initial begin
        #10 opcode = 7'h00;
        #10 opcode = 7'h33;
        #10 opcode = 7'h03;
        #10 opcode = 7'h13;
        #10 opcode = 7'h67;
        #10 opcode = 7'h23;
        #10 opcode = 7'h63;
        #10 opcode = 7'h17;
        #10 opcode = 7'h37;
        #10 opcode = 7'h6f;
        #10 opcode = 7'hff;
        #10 $finish;
    end

endmodule