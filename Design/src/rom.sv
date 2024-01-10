module rom (
    input wire [11:0] address,
    output logic [31:0] data_out
);
    
    reg [31:0] data [0:4095];

    // Upload Raw Data
    always_comb begin
        data[123] = 32'h1234_5678;
    end

    always_comb begin
        data_out = data[address];
    end

endmodule