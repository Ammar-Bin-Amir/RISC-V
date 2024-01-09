module tb_branch_selector;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic en;
    logic [2:0] func_3;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    wire branch_selector;

    branch_selector dut (
        .en (en),
        .func_3 (func_3),
        .rs1_data (rs1_data),
        .rs2_data (rs1_data),
        .branch_selector (branch_selector)
    );

    initial begin
        #10 en = 0; func_3 = 0; rs1_data = 0; rs2_data = 0;
        for (int i = 1; i <= 23; i++) begin
            #10 en = $random; func_3 = $random; rs1_data = $random; rs2_data = $random;
        end
        #10 $finish;
    end

endmodule