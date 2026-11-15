`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 19:11:47
// Design Name: 
// Module Name: top_module
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


module top_module(input clk, input reset);
wire [31:0] pc;
wire [31:0] instruction;
wire [6:0] opcode;
wire [4:0] rd;
wire [2:0] funct3;
wire [4:0] rs1;
wire [4:0] rs2;
wire [6:0] funct7;
wire [31:0] write_data;
wire reg_write;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [3:0] alu_control;
wire [31:0] alu_result;
wire alu_src;
wire [31:0] alu_input2;
wire [31:0] immediate;
wire mem_read;
wire mem_write;
wire mem_to_reg;
wire [31:0] read_data;
wire [31:0] i_imm;
wire [31:0] s_imm;
wire [31:0] b_imm;
wire [31:0] j_imm;
wire [31:0] u_imm;
wire pc_src;
wire branch;
wire zero;
wire jal;
wire jalr;
wire lui;
wire [31:0] pc_plus4;
assign pc_plus4 = pc + 32'd4;
wire [31:0] normal_write_data;
wire auipc;
wire [31:0] auipc_data;
assign auipc_data = pc + u_imm;
assign pc_src = (funct3 == 3'b000)? (branch&zero) : (funct3 == 3'b001)? (branch& ~zero) : (funct3 == 3'b100)? (branch & alu_result[0]) : (funct3 == 3'b101) ? (branch & ~alu_result[0]) : (funct3 == 3'b110) ? (branch & alu_result[0]) : (funct3 == 3'b111) ? (branch & ~alu_result[0]) : 1'b0;
assign immediate = (opcode == 7'b0100011) ? s_imm : i_imm;
assign write_data =(jal || jalr) ? pc_plus4 : (lui)? u_imm : (auipc)? auipc_data : normal_write_data;


pc PC (.clk(clk), .reset(reset), .pc_src(pc_src), .jal(jal), .jalr(jalr), .alu_result(alu_result), .j_imm(j_imm), .b_imm(b_imm), .pc(pc));
instructionmemory IM (.pc(pc), .instruction(instruction));
instruction_decoder ID (.instruction(instruction), .opcode(opcode), .rd(rd), .funct3(funct3), .rs1(rs1), .rs2(rs2), .funct7(funct7));
register_file RF (.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .write_data(write_data), .reg_write(reg_write), .read_data1(read_data1), .read_data2(read_data2));
alu ALU(.alu_control(alu_control), .read_data1(read_data1), .alu_input2(alu_input2), .alu_result(alu_result), .zero(zero));
control_unit CU(.opcode(opcode), .funct3(funct3), .funct7(funct7), .alu_src(alu_src), .reg_write(reg_write), .alu_control(alu_control), .mem_read(mem_read), .mem_write(mem_write), .mem_to_reg(mem_to_reg), .branch(branch), .jal(jal), .jalr(jalr), .lui(lui), .auipc(auipc));
i_type IT(.instruction(instruction), .i_imm(i_imm));
s_type ST(.instruction(instruction), .s_imm(s_imm));
b_type BT(.instruction(instruction), .b_imm(b_imm));
j_type JT(.instruction(instruction), .j_imm(j_imm));
u_type UT(.instruction(instruction), .u_imm(u_imm));
mux MUX(.read_data2(read_data2), .alu_src(alu_src), .immediate(immediate), .alu_input2(alu_input2));
data_memory DM (.clk(clk), .mem_write(mem_write), .mem_read(mem_read), .address(alu_result), .write_data(read_data2), .read_data(read_data), .funct3(funct3));
mem_to_reg_mux MEM_MUX ( .mem_to_reg(mem_to_reg), .read_data(read_data), .alu_result(alu_result), .write_data(normal_write_data) );

endmodule
