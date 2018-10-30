`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2018 01:38:04 AM
// Design Name: 
// Module Name: hexcounterdisplay
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


module hexcounterdisplay(
   input wire clock,
   output logic [7:0] digitselect = ~(8'b0000_0001),
   output logic [7:0] segments
   
    );
    wire [3:0] value;
    
    counter1second c(clock, value);
    hexto7seg h(value,segments);
    
endmodule

