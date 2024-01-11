module top (
    input wire clk,
    input wire rst
);
    
    // Program Counter
    wire [31:0] address;

    program_counter dut_program_counter (
        .clk,
        .rst,
        .data_in (32'hFFFF_0555),
        .data_out (address)
    );

    wire [31:0] pc;
    wire [31:0] pc_plus_1;

    assign pc = address;
    assign pc_plus_1 = address + 1;

    // Read Only Memory
    wire [31:0] instruction_memory;

    rom dut_rom (
        .address (address[11:0]),
        .data_out (instruction_memory)
    );

    // Control Unit
    wire write;
    wire store;
    wire load;
    wire branch;
    wire [1:0] alu_operand_a_selector;
    wire alu_operand_b_selector;
    wire [1:0] immediate_selector;
    wire [1:0] next_pc_selector;
    wire [3:0] alu_operations_selector;

    control_unit dut_control_unit (
        .opcode (instruction_memory[6:0]),
        .func_7_bit_6 (instruction_memory[30]),
        .func_3 (instruction_memory[14:12]),
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
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;
    wire [31:0] data_register;

    register_file dut_register_file (
        .clk,
        .en (write),
        .instruction_memory (data_register),
        .rd (instruction_memory[11:7]),
        .rs1_address (instruction_memory[19:15]),
        .rs2_address (instruction_memory[24:20]),
        .rs1_data,
        .rs2_data
    );

    // Immediate Generator
    wire [31:0] i_type;
    wire [31:0] s_type;
    wire [31:0] sb_type;
    wire [31:0] u_type;
    wire [31:0] uj_type;

    immediate_generator dut_immediate_generator (
        .instruction_memory,
        .program_counter (pc),
        .i_type,
        .s_type,
        .sb_type,
        .u_type,
        .uj_type
    );

    // Operand A
    reg [31:0] operand_a;

    always_comb begin
        case (alu_operand_a_selector)
            2'b00: operand_a = rs1_data;
            2'b01: operand_a = pc_plus_1;
            2'b10: operand_a = pc;
            2'b11: operand_a = 0;
            default: operand_a = rs1_data;
        endcase
    end

    // Operand B
    reg [31:0] operand_b;

    always_comb begin
        case (immediate_selector)
            2'b00: operand_b = i_type;
            2'b01: operand_b = u_type;
            2'b10: operand_b = s_type;
            default: operand_b = 0;
        endcase
    end

    // Arithmetic Logic Unit
    wire [31:0] data_memory;

    alu dut_alu (
        .operand_a,
        .operand_b,
        .alu_operations_selector,
        .ram (data_memory)
    );

    // Random Access Memory
    ram dut_ram (
        .clk,
        .address (address[11:0]),
        .data_in (rs2_data),
        .store,
        .load,
        .data_out (data_register)
    );

    logic [31:0] write_data;

    always_comb begin
        case (load)
            1'b0: write_data = data_memory;
            1'b1: write_data = data_register;
            default: write_data = data_memory;
        endcase
    end

    // Branch Selector
    logic branch_selector;

    branch_selector dut_branch_selector (
        .rs1 (rs1_data),
        .rs2 (rs2_data),
        .en (branch),
        .func_3 (instruction_memory[14:12]),
        .branch_selector (branch_selector)
    );

    logic [31:0] jump;
    
    always_comb begin
        case (branch_selector)
            1'b0: jump = pc_plus_1;
            1'b1: jump = sb_type;
            default: jump = pc_plus_1;
        endcase
    end

    logic [31:0] next_pc;

    always_comb begin
        case (next_pc_selector)
            2'b00: next_pc = pc_plus_1;
            2'b00: next_pc = rs1_data + i_type;
            2'b00: next_pc = jump;
            2'b00: next_pc = uj_type;
            default: next_pc = pc_plus_1;
        endcase
    end

endmodule