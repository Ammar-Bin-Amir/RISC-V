module tb_ram;
    
    timeunit 1ns;
    timeprecision 1ps;

    logic clk;
    logic [11:0] address;
    logic [31:0] data_in;
    logic store;
    logic load;
    logic [31:0] data_out;

    ram dut (
        .clk,
        .address,
        .data_in,
        .store,
        .load,
        .data_out
    );

    initial clk = 0;
    always #10 clk = ~clk;
    
    initial begin
        #20 address = 0; data_in = 0; store = 0; load = 0;
        for (integer i = 1; i <= 25; i++) begin
            #25 address = $random; data_in = $random; store = $random; load = $random;
        end
        #25 address = 123; data_in = 32'h1234_cdef;
        #50 store = 1;
        #50 load = 1;
        #10 address = 12'hfff; data_in = 32'hffff_ffff; store = 1; load = 1;
        #100 $finish;
    end

endmodule