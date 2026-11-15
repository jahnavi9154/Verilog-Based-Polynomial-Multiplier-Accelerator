`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 11:40:02
// Design Name: 
// Module Name: control_unit
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


module control_unit(input [6:0] opcode,input [2:0] funct3 ,input [6:0] funct7, output reg alu_src, output reg reg_write, output reg [3:0] alu_control, output reg mem_read, output reg mem_write, output reg mem_to_reg, output reg branch, output reg jal, output reg jalr, output reg lui, output reg auipc);

always @(*) begin
reg_write   = 0;
alu_src     = 0;
alu_control = 4'd0;
mem_read = 0;
mem_write = 0;
mem_to_reg = 0;
branch = 0;
jal = 0;
jalr = 0;
lui = 0;
auipc = 0;

case(opcode) 
7'b0110011: begin    // r-type
alu_src = 1;
reg_write = 1;
branch = 0;
case({funct7, funct3})
10'b0000000000: 
alu_control = 4'd0;
10'b0000000110:
alu_control = 4'd2;
10'b0000000111:
alu_control = 4'd3;
10'b0000000100:
alu_control = 4'd4;
10'b0100000000:
alu_control = 4'd1;
10'b0000000010:
alu_control = 4'd5;
10'b0000000001:
alu_control = 4'd6;    
10'b0000000101:
alu_control = 4'd7;    
10'b0100000101:
alu_control = 4'd8;   
10'b0000000011:
alu_control = 4'd9;   
endcase
end

7'b0010011: begin   // i-type
alu_src = 0;
reg_write = 1;
branch = 0;
case (funct3)
3'b000:
alu_control = 4'd0;
3'b111:
alu_control = 4'd3;
3'b110:
alu_control = 4'd2;
3'b100:
alu_control = 4'd4;
3'b010: 
alu_control = 4'd5; 
3'b001: 
alu_control = 4'd6; 
3'b011:
alu_control = 4'd9;  
3'b101: begin
if (funct7 == 7'b0000000)
alu_control = 4'd7;  
else if (funct7 == 7'b0100000)
alu_control = 4'd8;  
end
endcase
end
7'b0000011: begin   // load word
mem_read = 1;
mem_write = 0;
mem_to_reg = 1;
reg_write = 1;
alu_control = 4'd0;
alu_src = 0;
branch = 0;
end
7'b0100011: begin     //store word
mem_read = 0;
mem_write = 1;
mem_to_reg = 0;
reg_write = 0;
alu_control = 4'd0;
alu_src = 0;
branch = 0;
end
7'b1100011: begin      // b type
branch = 1;
alu_src = 1;
if (funct3 == 3'b100 || funct3 == 3'b101)      // BLT
alu_control = 4'd5;    // SLT
else if(funct3 == 3'b110 || funct3 == 3'b111)
alu_control = 4'd9;
else 
alu_control = 4'd1;
end
7'b1101111: begin    // j type
jal = 1;
reg_write = 1;
end
7'b1100111: begin    // jalr
reg_write = 1;
jalr = 1;
alu_src = 0;
alu_control = 4'd0;   // add
end
7'b0110111: begin       // lui
reg_write = 1;
lui = 1;
end
7'b0010111: begin           // auipc
reg_write = 1;
auipc = 1;
end
default: begin
reg_write = 0;
alu_src = 0;
alu_control = 4'd0;
branch = 0;
end
endcase
end

endmodule
