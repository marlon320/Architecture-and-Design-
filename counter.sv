`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2018 01:04:00 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input wire clk,
    output logic [31:0] val
    );
    
    logic [60:0] counter;
    
    always_ff @(posedge clk)
           counter <= counter + 1'b 1;
            
    assign val[31:0] = counter[50:19];
          
endmodule

