module tb_control_decoder;
    
    logic r_type;
    logic i_type_lw;
    logic i_type_addi;
    logic i_type_jalr;
    logic s_type;
    logic sb_type;
    logic u_type_auipc;
    logic u_type_lui;
    logic uj_type;
    logic func_7_bit_6;
    logic [2:0] func_3;
    logic write;
    logic store;
    logic load;
    logic branch;
    logic [1:0] alu_operand_a_selector;
    logic alu_operand_b_selector;
    logic [1:0] immediate_selector;
    logic [1:0] next_pc_selector;
    logic [3:0] alu_operations_selector;

    control_decoder dut (
        .r_type (r_type),
        .i_type_lw (i_type_lw),
        .i_type_addi (i_type_addi),
        .i_type_jalr (i_type_jalr),
        .s_type (s_type),
        .sb_type (sb_type),
        .u_type_auipc (u_type_auipc),
        .u_type_lui (u_type_lui),
        .uj_type (uj_type),
        .func_7_bit_6 (func_7_bit_6),
        .func_3 (func_3),
        .write (write),
        .store (store),
        .load (load),
        .branch (branch),
        .alu_operand_a_selector (alu_operand_a_selector),
        .alu_operand_b_selector (alu_operand_b_selector),
        .immediate_selector (immediate_selector),
        .next_pc_selector (next_pc_selector),
        .alu_operations_selector (alu_operations_selector)
    );

    initial begin
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b1; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b1; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b1; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b1; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b1; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b1; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b1; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b1; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b1; func_7_bit_6 = 1'b0; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b1; func_3 = 3'b000;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b001;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b010;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b011;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b100;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b101;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b110;
        #10 r_type = 1'b0; i_type_lw = 1'b0; i_type_addi = 1'b0; i_type_jalr = 1'b0; s_type = 1'b0; sb_type = 1'b0; u_type_auipc = 1'b0; u_type_lui = 1'b0; uj_type = 1'b0; func_7_bit_6 = 1'b0; func_3 = 3'b111;
        #10 $finish;
    end

    initial begin
        $dumpfile("./temp/dump_control_decoder.vcd");
        $dumpvars();
    end

endmodule