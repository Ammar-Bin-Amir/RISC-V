module tb_control_unit;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [6:0] opcode;
    logic func_7_bit_6;
    logic [2:0] func_3;
    logic write;
    logic store;
    logic load;
    logic branch;
    logic [1:0] alu_operand_a_selector;
    logic alu_operand_b_selector;
    logic [1:0] immediate_selector;
    logic [1:0] next_pc_selector;
    logic [3:0] alu_operations_selector;

    control_unit dut (
        .opcode (opcode),
        .func_7_bit_6 (func_7_bit_6),
        .func_3 (func_3),
        .write (write),
        .store (store),
        .load (load),
        .branch (branch),
        .alu_operand_a_selector (alu_operand_a_selector),
        .alu_operand_b_selector (alu_operand_b_selector),
        .immediate_selector (immediate_selector),
        .next_pc_selector (next_pc_selector),
        .alu_operations_selector (alu_operations_selector)
    );

    initial begin
        #10 opcode = 7'h00; func_7_bit_6 = 0; func_3 = 3'b000;
        #10 opcode = 7'h33; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h33; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h03; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h03; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h13; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h13; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h67; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h67; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h23; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h23; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h63; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h63; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h17; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h17; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h37; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h37; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h6f; func_7_bit_6 = 0; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'h6f; func_7_bit_6 = 1; func_3 = 0;
        for (integer i = 1; i <= 8; i++) begin
            #10 func_3 = i;
        end
        #10 opcode = 7'hff; func_7_bit_6 = 1; func_3 = 3'b111;
        #10 $finish;
    end

endmodule