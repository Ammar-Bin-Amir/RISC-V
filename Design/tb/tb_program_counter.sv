module tb_program_counter;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic rst;
    logic [31:0] data_in;
    logic [31:0] data_out;

    program_counter dut (
        .clk,
        .rst,
        .data_in,
        .data_out
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        for (int i = 1; i <= 25; i++) begin
            #25 rst = $random; data_in = $random;
        end
        #10 $finish;
    end

endmodule