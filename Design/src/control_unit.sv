module control_unit (
    input logic [6:0] opcode,
    input logic func_7_bit_6,
    input logic [2:0] func_3,
    output logic write,
    output logic store,
    output logic load,
    output logic branch,
    output logic [1:0] alu_operand_a_selector,
    output logic alu_operand_b_selector,
    output logic [1:0] immediate_selector,
    output logic [1:0] next_pc_selector,
    output logic [3:0] alu_operations_selector
);
    
    logic r_type;
    logic i_type_lw;
    logic i_type_addi;
    logic i_type_jalr;
    logic s_type;
    logic sb_type;
    logic u_type_auipc;
    logic u_type_lui;
    logic uj_type;
    
    type_decoder dut_type_decoder (
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

    control_decoder dut_control_decoder (
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

endmodule