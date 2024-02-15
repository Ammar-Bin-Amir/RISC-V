module tb_immediate_generator;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic [31:0] instruction_memory;
    logic [31:0] program_counter;
    logic [31:0] i_type;
    logic [31:0] s_type;
    logic [31:0] sb_type;
    logic [31:0] u_type;
    logic [31:0] uj_type;

    immediate_generator dut (
        .instruction_memory,
        .program_counter,
        .i_type,
        .s_type,
        .sb_type,
        .u_type,
        .uj_type
    );

    initial begin
        #10 instruction_memory = 32'hFDB9_7531; program_counter = 32'hECA8_6420;
        #50 instruction_memory = $random; program_counter = $random;
        #100 $finish;
    end

endmodule