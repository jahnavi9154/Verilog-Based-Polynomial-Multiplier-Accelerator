`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 12:30:08
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb;
reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
wire reg_write;
wire [2:0] alu_control;

control_unit uut(.opcode(opcode), .funct3(funct3), .funct7(funct7), .reg_write(reg_write), .alu_control(alu_control));

initial begin

opcode = 7'b0110011;
funct3 = 3'b000;
funct7 = 7'b0000000;
#10
opcode = 7'b0110011;
funct3 = 3'b000;
funct7 = 7'b0100000;
#10
opcode = 7'b0110011;
funct3 = 3'b110;
funct7 = 7'b0000000;
#10
opcode = 7'b0110011;
funct3 = 3'b111;
funct7 = 7'b0000000;
#10
opcode = 7'b0110011;
funct3 = 3'b100;
funct7 = 7'b0000000;
#10
opcode = 7'b0010011;
funct3 = 3'b000;
funct7 = 7'b0000000;
#10
$finish;
end
endmodule
