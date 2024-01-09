module branch_selector (
    input wire en,
    input wire [2:0] func_3,
    input wire [31:0] rs1_data,
    input wire [31:0] rs2_data,
    output logic branch_selector
);

    localparam BEQ = 3'b000;
    localparam BNE = 3'b001;
    localparam BLT = 3'b100;
    localparam BGE = 3'b101;
    localparam BLTU = 3'b110;
    localparam BGEU = 3'b111;

    wire signed [31:0] rs1_data_signed;
    wire signed [31:0] rs2_data_signed;
    
    assign rs1_data_signed = rs1_data;
    assign rs2_data_signed = rs2_data;

    always_comb begin
        if (en) begin
            case (func_3)
                BEQ: begin
                    branch_selector = (rs1_data_signed == rs2_data_signed) ? 1'b1 : 1'b0;
                end
                BNE: begin
                    branch_selector = (rs1_data_signed != rs2_data_signed) ? 1'b1 : 1'b0;
                end
                BLT: begin
                    branch_selector = (rs1_data_signed < rs2_data_signed) ? 1'b1 : 1'b0;
                end
                BGE: begin
                    branch_selector = (rs1_data_signed >= rs2_data_signed) ? 1'b1 : 1'b0;
                end
                BLTU: begin
                    branch_selector = (rs1_data < rs2_data) ? 1'b1 : 1'b0;
                end
                BGEU: begin
                    branch_selector = (rs1_data >= rs2_data) ? 1'b1 : 1'b0;
                end
               default: branch_selector = 1'b0;
            endcase
        end
        else begin
            branch_selector = 1'b0;
        end
    end
    
endmodule