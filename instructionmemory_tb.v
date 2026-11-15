`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 22:15:45
// Design Name: 
// Module Name: instructionmemory_tb
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


module instructionmemory_tb;
reg [31:0] pc;
wire [31:0] instruction;
instructionmemory uut(.pc(pc), .instruction(instruction));

initial begin
$monitor("Time=%0t PC=%d Instruction=%h",
          $time, pc, instruction);
pc = 32'h0;
#10
pc =32'h4;
#10 
pc =32'h8;
#10 
pc =32'hC;
#10

$finish;
end
endmodule


