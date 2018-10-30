`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2018 01:06:23 PM
// Design Name: 
// Module Name: counter8digit
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


module counter8digit(
        input wire clk,
        output logic[7:0]segments,
        output logic [7:0]digitselect
        );
        
        wire [31:0] value;

        counter mycounter(clk, value);   
        display8digit mydisplay8digit(value, clk, segments, digitselect);
     
    endmodule
