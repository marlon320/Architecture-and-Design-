//////////////////////////////////////////////////////////////////////////////////
//
// Montek Singh
// 10/16/2018 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype none

module top #(
    parameter imem_size=128,                            // imem size, must be >= # instructions in program
    parameter imem_init="full_imem.mem",         // correct filename inherited from parent/tester
    parameter dmem_size=64,                             // dmem size, must be >= # words in .data of program + size of stack
    parameter dmem_init="full_dmem.mem"          // correct filename inherited from parent/tester
)(
    input wire clk, reset, enable
);
   
   wire [31:0] pc, instr, mem_readdata, mem_writedata, mem_addr;
   wire mem_wr;

   mips mips(clk, reset, enable, pc, instr, mem_wr, mem_addr, mem_writedata, mem_readdata);

   imem #(.Nloc(imem_size), .Dbits(32), .initfile(imem_init)) imem(pc[31:2], instr);      
                // dropped two LSBs from address to instr mem to convert byte address to word address
                
   dmem #(.Nloc(dmem_size), .Dbits(32), .initfile(dmem_init)) dmem(clk, mem_wr, mem_addr[31:2], mem_writedata, mem_readdata);  
                // dropped two LSBs from address to data mem to convert byte address to word address


endmodule