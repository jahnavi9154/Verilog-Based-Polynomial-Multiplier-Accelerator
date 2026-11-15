`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.07.2026 16:52:59
// Design Name: 
// Module Name: j_type
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


module j_type(input [31:0] instruction, output [31:0] j_imm);
assign j_imm = {{19{instruction[31]}},instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
endmodule
