`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 17:48:57
// Design Name: 
// Module Name: pc
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


module pc(input clk,input reset, input pc_src, input jal, input jalr, input [31:0] j_imm, input [31:0] b_imm, input [31:0] alu_result, output reg [31:0] pc);

always @(posedge clk) begin
if (reset)
pc <= 32'b0;
else if(pc_src)
pc <= pc + b_imm;
else if(jal) begin
pc <= pc + j_imm;
end
else if (jalr) begin
pc <= alu_result & 32'hFFFFFFFE;
end
else 
pc <= pc + 32'd4;
end
endmodule