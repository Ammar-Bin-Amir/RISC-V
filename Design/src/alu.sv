module alu (
    input logic [31:0] operand_a,
    input logic [31:0] operand_b,
    input logic [3:0] alu_operations_selector,
    output logic [31:0] alu_data
);
    
    localparam ADD = 0;
    localparam SUB = 1;
    localparam AND = 2;
    localparam OR = 3;
    localparam XOR = 4;
    localparam SLL = 5;
    localparam SLR = 6;
    localparam SLT = 7;
    localparam SLTU = 8;
    localparam SRA = 9;
    localparam OPERAND_B = 15;

    always_comb begin
        case (alu_operations_selector)
            ADD: alu_data = operand_a + operand_b;
            SUB: alu_data = operand_a - operand_b;
            AND: alu_data = operand_a & operand_b;
            OR: alu_data = operand_a | operand_b;
            XOR: alu_data = operand_a ^ operand_b;
            SLL: alu_data = operand_a << operand_b[4:0];
            SLR: alu_data = operand_a >> operand_b[4:0];
            SLT: alu_data = (signed'(operand_a) < signed'(operand_b)) ? 1'b1 : 1'b0;
            SLTU: alu_data = (operand_a < operand_b) ? 1'b1 : 1'b0;
            SRA: alu_data = signed'(operand_a) >>> signed'(operand_b[4:0]);
            OPERAND_B: alu_data = operand_b;
            default: alu_data = 0;
        endcase
    end

endmodule