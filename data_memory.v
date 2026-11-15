`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 13:06:51
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk, input mem_write, input mem_read, input [31:0] address, input[31:0] write_data, input funct3, output reg [31:0] read_data);
reg [31:0] memory [255:0];
wire [31:0] word;
assign word = memory[address >> 2];
initial begin
memory[0] = 32'd50;
end
always @(posedge clk) begin
if (mem_write)
memory[address>>2] <= write_data;
end
always @(*) begin
if (mem_read)
read_data = memory[address >> 2];
else
read_data = 32'd0;
case(funct3)
3'b010:   // LW
read_data = word;
3'b000:   // LB
read_data = {{24{word[7]}},word[7:0]};
3'b001:   // LH
read_data = {{16{word[15]}},word[15:0]};
3'b100:   // LBU
read_data = {24'b0,word[7:0]};
3'b101:   // LHU
read_data = {16'b0,word[15:0]};
endcase

end
endmodule
