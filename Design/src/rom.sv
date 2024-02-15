module rom (
    input logic [11:0] address,
    output logic [31:0] data_out
);
    
    reg [31:0] data [0:4095];

    // Upload Raw Data
    always_comb begin
        // data[123] = 32'h7E80_0293;

         data[0] = 32'h00000293;
         data[1] = 32'h00128293;
         data[2] = 32'h00502023;
         data[3] = 32'h00002303;
         data[4] = 32'hFF5FF0EF;
    end

    always_comb begin
        data_out = data[address];
    end

endmodule