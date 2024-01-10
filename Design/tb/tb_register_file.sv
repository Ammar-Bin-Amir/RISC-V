module tb_register_file;
    
    timeunit 1ns;
    timeprecision 1ps;
    
    logic clk;
    logic en;
    logic [31:0] instruction_memory;
    logic [4:0] rd;
    logic [4:0] rs1_address;
    logic [4:0] rs2_address;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;

    register_file dut (
        .clk (clk),
        .en (en),
        .instruction_memory (instruction_memory),
        .rd (rd),
        .rs1_address (rs1_address),
        .rs2_address (rs2_address),
        .rs1_data (rs1_data),
        .rs2_data (rs2_data)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        #25 en = 0; instruction_memory = 0; rd = 0; rs1_address = 0; rs2_address = 0;
        for (int i = 1; i <= 25; i++) begin
            #25 en = $random; instruction_memory = $random; rd = $random; rs1_address = $random; rs2_address = $random;
        end
        #100 $finish;
    end

endmodule