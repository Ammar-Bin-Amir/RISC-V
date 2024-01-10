module branch_selector (
    input wire [31:0] rs1,
    input wire [31:0] rs2,
    input wire en,
    input wire [2:0] func_3,
    output logic branch_selector
);

    always_comb begin
        if (en) begin
            case (func_3)
                3'b000: branch_selector = (rs1 == rs2);
                3'b001: branch_selector = (rs1 != rs2);
                3'b100: branch_selector = (signed'(rs1) < signed'(rs2));
                3'b101: branch_selector = (signed'(rs1) >= signed'(rs2));
                3'b110: branch_selector = (rs1 < rs2);
                3'b111: branch_selector = (rs1 >= rs2);
                default: branch_selector = 0;
            endcase
        end
        else begin
            branch_selector = 0;
        end
    end

endmodule