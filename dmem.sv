`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 11:10:56 PM
// Design Name: 
// Module Name: dmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dmem #(
   parameter Nloc = 16,                      // Number of memory locations
   parameter Dbits = 4,                      // Number of bits in data
   parameter initfile = "dmemfile.mem"          // Name of file with initial values
)(
    input wire clk,
    input wire mem_wr,
    input wire [31:2] mem_addr, mem_writedata,
    output wire [31:0] mem_readdata
    );
    
       logic [Dbits-1 : 0] mem [Nloc-1 : 0];     // The actual storage where data resides
       initial $readmemh(initfile, mem, 0, Nloc-1); // Initialize memory contents from a file
    
       always_ff @(posedge clk)                // Memory write: only when wr==1, and only at posedge clock
          if(mem_wr)
             mem[mem_addr[7:2]] <= mem_writedata;
    
       assign mem_readdata = mem[mem_addr[7:2]];                  // Memory read: read continuously, no clock involved
    
endmodule

