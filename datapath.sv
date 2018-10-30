`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 08:27:31 PM
// Design Name: 
// Module Name: datapath
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

module datapath #( 
    parameter Nloc = 32,
    parameter Dbits = 32,
    parameter Abits = $clog2(Nloc) 
    )(
    //Inputs
    input wire clock,
    input wire [Abits-1:0] ReadAddr1, ReadAddr2 ,WriteAddr,
    input wire RegWrite,
    input wire [4:0] ALUFN,
    input wire [Dbits-1:0] WriteData,
    
    //Outputs
    output wire [Dbits-1:0] ReadData1, ReadData2, ALUResult,
    output wire FlagZ
    );
    
    
    register_file #(Nloc,Dbits) myRF(clock, RegWrite, ReadAddr1, ReadAddr2 ,WriteAddr, WriteData, ReadData1, ReadData2);
    ALU #(Dbits) myALU (ReadData1, ReadData2, ALUResult, ALUFN, FlagZ);
    
    
    
endmodule