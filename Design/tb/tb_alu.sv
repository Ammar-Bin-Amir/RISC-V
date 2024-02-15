module tb_alu;
    
    timeunit 1ns;
    timeprecision 1ps;
    
    logic [31:0] operand_a;
    logic [31:0] operand_b;
    logic [3:0] alu_operations_selector;
    logic [31:0] alu_data;

    alu dut (
        .operand_a,
        .operand_b,
        .alu_operations_selector,
        .alu_data
    );

    initial begin
        #10 operand_a = 32'hECA8_6420; operand_b = 32'hFDB9_7531;
        for (int i = 0; i < 10; i++) begin
            #10 alu_operations_selector = i;
        end
        #10 alu_operations_selector = 4'hF;
        #50 operand_a = $random; operand_b = $random;
        for (int i = 0; i < 16; i++) begin
            #10 alu_operations_selector = i;
        end
        #100 $finish;
    end

endmodule