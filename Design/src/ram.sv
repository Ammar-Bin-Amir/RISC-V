module ram (
    input wire clk,
    input wire [11:0] address,
    input wire [31:0] data_in,
    input wire store,
    input wire load,
    output logic [31:0] data_out
);
    
    reg [31:0] data [0:4095];

    always_ff @(posedge clk) begin
        if (store) begin
            data[address] <= data_in;
        end
        else begin
            data <= data;
        end
    end

    always_ff @(posedge clk) begin
        if (load) begin
            data_out <= data[address];
        end
        else begin
            data_out <= data_out;
        end
    end

endmodule