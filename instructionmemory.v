`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 20:02:04
// Design Name: 
// Module Name: instructionmemory
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


module instructionmemory(input[31:0] pc, output reg [31:0] instruction );
reg [31:0] memory [255:0];
initial begin
memory[0] = 32'hFFF00093;   // addi x1,x0,-1
memory[1] = 32'h00100113;   // addi x2,x0,1
memory[2] = 32'h0020F463;   // bgeu x1,x2,+8
memory[3] = 32'h06F00193;   // addi x3,x0,111
memory[4] = 32'h0DE00213;   // addi x4,x0,222
end

always @(*) begin
instruction = memory[pc >> 2];
end
endmodule
