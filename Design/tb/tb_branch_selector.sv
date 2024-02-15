module tb_branch_selector;
    
    timeunit 1ns;
    timeprecision 1ps;
    
    logic [31:0] rs1;
    logic [31:0] rs2;
    logic en;
    logic [2:0] func_3;
    logic branch_selector;

    branch_selector dut (
        .rs1,
        .rs2,
        .en,
        .func_3,
        .branch_selector
    );

    initial begin
        #10 en = 1; rs1 = 32'hECA8_6420; rs2 = 32'hFDB9_7531;
        for (int i = 0; i < 8; i++) begin
            #10 func_3 = i;
        end
        for (int i = 0; i < 16; i++) begin
            #10 en = $random; rs1 = $random; rs2 = $random; func_3 = i;
        end
        #100 $finish;
    end

endmodule