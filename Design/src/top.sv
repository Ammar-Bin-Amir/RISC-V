module top (
    input logic clk,
    input logic rst
);
    
    // Program Counter
    logic [31:0] next_pc;
    logic [31:0] pc;

    program_counter dut_program_counter (
        .clk,
        .rst,
        .data_in (next_pc),
        .data_out (pc)
    );

    logic [31:0] pc_plus_4;

    assign pc_plus_4 = pc + 4;

    // Read Only Memory
    logic [31:0] instruction_memory_data;

    rom dut_rom (
        .address (pc[13:2]),
        .data_out (instruction_memory_data)
    );

    // Control Unit
    logic write;
    logic store;
    logic load;
    logic branch;
    logic [1:0] alu_operand_a_selector;
    logic alu_operand_b_selector;
    logic [1:0] immediate_selector;
    logic [1:0] next_pc_selector;
    logic [3:0] alu_operations_selector;

    control_unit dut_control_unit (
        .opcode (instruction_memory_data[6:0]),
        .func_7_bit_6 (instruction_memory_data[30]),
        .func_3 (instruction_memory_data[14:12]),
        .write,
        .store,
        .load,
        .branch,
        .alu_operand_a_selector,
        .alu_operand_b_selector,
        .immediate_selector,
        .next_pc_selector,
        .alu_operations_selector
    );

    // Register File
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    logic [31:0] register_file_data;

    register_file dut_register_file (
        .clk,
        .en (write),
        .register_file_data,
        .rd (instruction_memory_data[11:7]),
        .rs1_address (instruction_memory_data[19:15]),
        .rs2_address (instruction_memory_data[24:20]),
        .rs1_data,
        .rs2_data
    );

    // Immediate Generator
    logic [31:0] i_type;
    logic [31:0] s_type;
    logic [31:0] sb_type;
    logic [31:0] u_type;
    logic [31:0] uj_type;

    immediate_generator dut_immediate_generator (
        .instruction_memory (instruction_memory_data),
        .program_counter (pc),
        .i_type,
        .s_type,
        .sb_type,
        .u_type,
        .uj_type
    );

    // Immediate Select
    logic [31:0] immediate;
    
    always_comb begin
        case (immediate_selector)
            2'b00: immediate = i_type;
            2'b01: immediate = u_type;
            2'b10: immediate = s_type;
            default: immediate = 0;
        endcase
    end

    // Operand A Select
    logic [31:0] operand_a;

    always_comb begin
        case (alu_operand_a_selector)
            2'b00: operand_a = rs1_data;
            2'b01: operand_a = pc_plus_4;
            2'b10: operand_a = pc;
            2'b11: operand_a = 0;
            default: operand_a = rs1_data;
        endcase
    end

    // Operand B Select
    logic [31:0] operand_b;

    always_comb begin
        case (alu_operand_b_selector)
            1'b0: operand_b = rs2_data;
            1'b1: operand_b = immediate;
            default: operand_b = rs2_data;
        endcase
    end

    // Arithmetic Logic Unit
    logic [31:0] alu_data;

    alu dut_alu (
        .operand_a,
        .operand_b,
        .alu_operations_selector,
        .alu_data
    );

    // Random Access Memory
    logic [31:0] data_memory_data;

    ram dut_ram (
        .clk,
        .address (alu_data[13:2]),
        .data_in (rs2_data),
        .store,
        .load,
        .data_out (data_memory_data)
    );

    always_comb begin
        case (load)
            1'b0: register_file_data = alu_data;
            1'b1: register_file_data = data_memory_data;
            default: register_file_data = alu_data;
        endcase
    end

    // Branch Selector
    logic branch_selector;

    branch_selector dut_branch_selector (
        .rs1 (rs1_data),
        .rs2 (rs2_data),
        .en (branch),
        .func_3 (instruction_memory_data[14:12]),
        .branch_selector (branch_selector)
    );

    // Next PC Select
    always_comb begin
        case (next_pc_selector)
            2'b00: next_pc = pc_plus_4;
            2'b01: next_pc = i_type + rs1_data;
            2'b10: next_pc = branch_selector ? sb_type : pc_plus_4;
            2'b11: next_pc = uj_type;
            default: next_pc = pc_plus_4;
        endcase
    end

endmodule