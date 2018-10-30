`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2018 01:38:04 AM
// Design Name: 
// Module Name: counter1second
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


module counter1second(
    input wire clock,
    output wire [3:0] value  
    );
    
     wire [31:0] counter;
     bitcounter32 b(clock,counter);
     
     assign value = (counter[30:27]); 
    
    
endmodule
