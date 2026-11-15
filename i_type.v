`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 19:42:43
// Design Name: 
// Module Name: i_type
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


module i_type(input [31:0] instruction, output reg [31:0] i_imm);

always @(*)
begin
case(instruction[6:0])
7'b0010011:
i_imm = {{20{instruction[31]}}, instruction[31:20]};
default:
i_imm = 32'd0;
endcase
end

endmodule
