module tb_top;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic rst;

    top dut (
        .clk,
        .rst
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        #10 rst = 1;
        #50 rst = 0;
        #1000 $finish;
    end

endmodule