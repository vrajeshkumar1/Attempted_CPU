`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 07:52:10 PM
// Design Name: 
// Module Name: top
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


module top(instruction,clk);
input wire clk;
input wire[31:0] instruction;
reg pc[31:0];
always@(clk,instruction) begin
pc<=instructon;
case(pc[6:0]) //cases for opcodes
7'b1010011:

7'b0110111:

7'b0100011:

7'b1001011:

7'b1110011:

7'b1000011:

7'b0100111:

7'b1100111:

7'b0000111:

7'b1000111:

7'b0010111:

7'b0010011:

7'b0000011:

7'b1101111:

7'b0110011:
// this has no float, all multiply and quite a few base instructions
//create a nested case using concatenated funct3 and funct7, since both are present for these
    case({instruction[31:25],instruction[14:12]})
    
    endcase
7'b1100011:

7'b0001111:

7'b1001111:

default:

endcase
end
endmodule
