module immediate_generator (
    input logic [31:0] instruction_memory,
    input logic [31:0] program_counter,
    output logic [31:0] i_type,
    output logic [31:0] s_type,
    output logic [31:0] sb_type,
    output logic [31:0] u_type,
    output logic [31:0] uj_type
);

    // I Type
    assign i_type = {{21{instruction_memory[31]}},instruction_memory[31:20]};

    // S Type
    assign s_type = {{22{instruction_memory[31]}},instruction_memory[31:25],instruction_memory[11:7]};

    // SB Type
    assign sb_type = ({{21{instruction_memory[31]}},instruction_memory[31],instruction_memory[7],instruction_memory[30:25],instruction_memory[11:8],1'b0} + program_counter);

    // U Type
    assign u_type = {instruction_memory[31:12],12'b0};

    // UJ Type
    assign uj_type = ({{13{instruction_memory[31]}},instruction_memory[31],instruction_memory[19:12],instruction_memory[20],instruction_memory[30:21],1'b0} + program_counter);
    
endmodule