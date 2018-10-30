`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2018 12:57:48 PM
// Design Name: 
// Module Name: counter4digit
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


    module counter4digit(
        input wire clk,
        output logic[7:0]segments,
        output logic [7:0]digitselect
        );
        
        wire [15:0] value;

        counter mycounter(clk, value);   
        display4digit mydisplay4digit(value, clk, segments, digitselect);
     
    endmodule
