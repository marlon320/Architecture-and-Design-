`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2018 02:23:50 AM
// Design Name: 
// Module Name: 32bitcounter
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


module bitcounter32(
    input wire clock,
    output logic [31:0] counter
    );
       
       always_ff @(posedge clock) begin  
           counter <= (counter == 2147483647) ? 0 : (counter+1); //2^32-1
        end
endmodule
