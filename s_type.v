`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.07.2026 12:30:58
// Design Name: 
// Module Name: s_type
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


module s_type(input [31:0] instruction, output [31:0] s_imm);
assign s_imm = {{20{instruction[31]}},instruction[31:25], instruction[11:7]};
endmodule
