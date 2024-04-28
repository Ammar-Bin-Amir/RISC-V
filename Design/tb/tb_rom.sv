module tb_rom;

    logic [11:0] address;
    logic [31:0] data_out;

    rom dut (
        .address,
        .data_out
    );

    initial begin
        #10 address = 123;
        #50 $finish;
    end

    initial begin
        $dumpfile("./temp/dump_rom.vcd");
        $dumpvars();
    end
    
endmodule