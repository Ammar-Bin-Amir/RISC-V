module tb_register_file;
    
    timeunit 1ns;
    timeprecision 1ps;
    
    logic clk;
    logic en;
    logic [31:0] register_file_data;
    logic [4:0] rd;
    logic [4:0] rs1_address;
    logic [4:0] rs2_address;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;

    register_file dut (
        .clk (clk),
        .en (en),
        .register_file_data (register_file_data),
        .rd (rd),
        .rs1_address (rs1_address),
        .rs2_address (rs2_address),
        .rs1_data (rs1_data),
        .rs2_data (rs2_data)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        #25 en = 0; register_file_data = 0; rd = 0; rs1_address = 0; rs2_address = 0;
        for (int i = 1; i <= 25; i++) begin
            #25 en = $random; register_file_data = $random; rd = $random; rs1_address = $random; rs2_address = $random;
        end
        #25 en = 1; register_file_data = $random; rd = 5'hff; rs1_address = 0; rs2_address = 0;
        #25 en = 1; register_file_data = $random; rd = 5'hff; rs1_address = 5'hff; rs2_address = 0;
        #25 en = 1; register_file_data = $random; rd = 5'hff; rs1_address = 0; rs2_address = 5'hff;
        #25 en = 1; register_file_data = $random; rd = 5'hff; rs1_address = 5'hff; rs2_address = 5'hff;
        #100 $finish;
    end

endmodule