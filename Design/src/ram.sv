module ram (
    input logic clk,
    input logic [11:0] address,
    input logic [31:0] data_in,
    input logic store,
    input logic load,
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

    always_comb begin
        if (load) begin
            if (data[address] === 32'hxxxx_xxxx) begin
                data_out = 0;
            end
            else begin
                data_out = data[address];
            end
        end
        else begin
            data_out = data_out;
        end
    end

endmodule