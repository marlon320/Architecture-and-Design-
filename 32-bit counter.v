`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2018 02:21:27 AM
// Design Name: 
// Module Name: 32-bit counter
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


module 32bitcounter(
    input wire clock,
   output logic [31:0] counter
   );
   
   always_ff @(posedge clock) begin
       
       counter <= (counter == 2147483647) ? 0 : (counter+1);
    end
    
endmodule
