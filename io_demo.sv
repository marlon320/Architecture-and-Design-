`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2018 03:09:01 PM
// Design Name: 
// Module Name: io_demo
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

module io_demo(
    //Clock 
    input wire clk,
    
    //Keyboard 
    input wire ps2_data,
    input wire ps2_clk,
    
    //Audio 
    output wire audPWM,
    output wire audEn,
      
    //Accel 
    output wire aclSCK,
    output wire aclMOSI,
    input wire aclMISO,
    output wire aclSS,
   
    //LED 
    output wire [15:0] LED
    );
   
   //Keyboard 
    wire [31:0] keyb_char, period;
    
    //Accel 
    wire [8:0] accelX, accelY;      // The accelX and accelY values are 9-bit values, ranging from 9'h 000 to 9'h 1FF
    wire [11:0] accelTmp;           // 12-bit value for temperature
    
    assign audEn = 1;
     
    keyboard keyb(clk, ps2_clk, ps2_data, keyb_char);
     
     assign period = (keyb_char == 32'h0015)? 382219:      //q
                       (keyb_char == 32'h001d)? 340530:    //w
                       (keyb_char == 32'h0024)? 303370:    //e
                       (keyb_char == 32'h002d)? 286344:    //r
                       (keyb_char == 32'h002c)? 255102:    //t
                       (keyb_char == 32'h0035)? 227273:    //y
                       (keyb_char == 32'h003c)? 202478:    //u
                       (keyb_char == 32'h0043)? 191113:    //i
                       000000;   
                    
    montek_sound_Nexys4 snd(clk, period, audPWM);
     
     
    accelerometer accel(clk, aclSCK, aclMOSI, aclMISO, aclSS, accelX, accelY, accelTmp);
    
    assign LED[15:0] = (accelY > 9'h1F0)? 'b1000000000000000:
                       (accelY > 9'h1D0)? 'b0100000000000000:
                       (accelY > 9'h1B0)? 'b0010000000000000:
                       (accelY > 9'h190)? 'b0001000000000000:
                       (accelY > 9'h170)? 'b0000100000000000:
                       (accelY > 9'h150)? 'b0000010000000000:
                       (accelY > 9'h130)? 'b0000001000000000:
                       (accelY > 9'h110)? 'b0000000100000000:
                       (accelY > 9'h0E0)? 'b0000000010000000:
                       (accelY > 9'h0C0)? 'b0000000001000000:
                       (accelY > 9'h0A0)? 'b0000000000100000:
                       (accelY > 9'h080)? 'b0000000000010000:
                       (accelY > 9'h060)? 'b0000000000001000:
                       (accelY > 9'h040)? 'b0000000000000100:
                       (accelY > 9'h020)? 'b0000000000000010:
                       (accelY > 9'h001)? 'b0000000000000001:
                        'b0000000000000000;

     
endmodule
