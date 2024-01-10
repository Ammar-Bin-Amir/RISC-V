module alu (
    input wire [31:0] operand_a,
    input wire [31:0] operand_b,
    input wire [3:0] alu_operations_selector,
    output logic [31:0] ram
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
            ADD: ram = operand_a + operand_b;
            SUB: ram = operand_a - operand_b;
            AND: ram = operand_a & operand_b;
            OR: ram = operand_a | operand_b;
            XOR: ram = operand_a ^ operand_b;
            SLL: ram = operand_a << operand_b[4:0];
            SLR: ram = operand_a >> operand_b[4:0];
            SLT: ram = (signed'(operand_a) < signed'(operand_b)) ? 1'b1 : 1'b0;
            SLTU: ram = (operand_a < operand_b) ? 1'b1 : 1'b0;
            SRA: ram = signed'(operand_a) >>> signed'(operand_b[4:0]);
            OPERAND_B: ram = operand_b;
            default: ram = 0;
        endcase
    end

endmodule