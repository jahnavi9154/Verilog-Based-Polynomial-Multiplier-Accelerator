`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 22:33:29
// Design Name: 
// Module Name: instruction_decoder_tb
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


module instruction_decoder_tb;
reg [31:0] instruction;
wire [6:0] opcode;
wire [4:0]rd;
wire [2:0]funct3;
wire [4:0]rs1;
wire [4:0]rs2;
wire [6:0]funct7;

instruction_decoder uut(.instruction(instruction), .opcode(opcode), .rd(rd), .funct3(funct3), .rs1(rs1), .rs2(rs2), .funct7(funct7));
initial begin
$monitor("Time=%0t Instruction=%h Opcode=%b rd=%0d funct3=%b rs1=%0d rs2=%0d funct7=%b",
         $time, instruction, opcode, rd, funct3, rs1, rs2, funct7);
instruction = 32'h00500093; 
#10
instruction = 32'h00A00113;   
#10
instruction = 32'h002081B3; 
#10
instruction = 32'h40110233;
#10
instruction = 32'h0030F293;
#10
instruction = 32'h0080E313;
#10
instruction = 32'h0030C393;
#10


$finish;
end
endmodule
