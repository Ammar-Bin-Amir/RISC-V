module tb_rom;

    timeunit 1ns;
    timeprecision 1ps;

    logic [11:0] address;
    wire [31:0] data_out;

    rom dut (
        .address,
        .data_out
    );

    initial begin
        #10 address = 123;
        #50 $finish;
    end
    
endmodule