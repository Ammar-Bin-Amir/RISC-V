module register_file (
    input wire clk,
    input wire en,
    input wire [31:0] instruction_memory,
    input wire [4:0] rd,
    input wire [4:0] rs1_address,
    input wire [4:0] rs2_address,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data
);
    
    reg [31:0] data [31:0];

    always @(posedge clk) begin
        // Address[0] = ZERO
        data[0] <= '0;
        // Destination Register
        if (en) begin
            data[rd] <= instruction_memory;
        end
        else begin
            data[rd] <= data[rd];
        end
        // Source Register 1
        rs1_data <= data[rs1_address];
        // Source Register 2
        rs2_data <= data[rs2_address];
    end

endmodule

