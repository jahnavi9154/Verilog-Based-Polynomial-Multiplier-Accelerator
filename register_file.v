`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 22:48:28
// Design Name: 
// Module Name: register_file
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


module register_file(input clk,input [4:0]rs1,input [4:0]rs2,input [4:0]rd,input [31:0] write_data,input reg_write, output [31:0] read_data1,output [31:0] read_data2);
reg [31:0] registers [31:0];
assign read_data1 = registers [rs1];
assign read_data2 = registers [rs2];
always @(posedge clk) begin
 registers[0] <= 32'd0;
if (reg_write && (rd != 0))
registers[rd] <= write_data;
end
endmodule
