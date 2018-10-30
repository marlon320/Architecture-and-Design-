`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 09:00:10 PM
// Design Name: 
// Module Name: screenmem
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


module screenmem(   
    input wire [10:0] screenAddr,
    output wire [1:0] characterCode
    );
    
    logic [1:0] screenMem [1199:0];
       
           initial $readmemh("smem_screentest.mem", screenMem, 0, 1199);         
           assign characterCode = screenMem[screenAddr];    
           
endmodule
