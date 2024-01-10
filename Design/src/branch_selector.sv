module branch_selector (
    input wire [31:0] rs1,
    input wire [31:0] rs2,
    input wire en,
    input wire [2:0] func_3,
    output logic branch_selector
);
    
    localparam BEQ = 0;
    localparam BNE = 1;
    localparam BLT = 4;
    localparam BGE = 5;
    localparam BLTU = 6;
    localparam BGEU = 7;

    always_comb begin
        if (en) begin
            case (func_3)
                BEQ: branch_selector = (rs1 == rs2) ? 1'b1 : 1'b0;
                BNE: branch_selector = (rs1 != rs2) ? 1'b1 : 1'b0;
                BLT: branch_selector = (signed'(rs1) < signed'(rs2)) ? 1'b1 : 1'b0;
                BGE: branch_selector = (signed'(rs1) >= signed'(rs2)) ? 1'b1 : 1'b0;
                BLT: branch_selector = (rs1 < rs2) ? 1'b1 : 1'b0;
                BGE: branch_selector = (rs1 >= rs2) ? 1'b1 : 1'b0;
                default: branch_selector = 0;
            endcase
        end
        else begin
            branch_selector = 0;
        end
    end

endmodule