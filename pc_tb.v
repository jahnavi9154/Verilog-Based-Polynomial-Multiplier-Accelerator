`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 21:37:46
// Design Name: 
// Module Name: pc_tb
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


module pc_tb;
reg clk;
reg reset;
wire [31:0] pc;

pc uut(.clk(clk), .reset(reset), .pc(pc));

always #5 clk = ~clk;

initial 
begin
clk = 0;
reset = 1;
#10  reset = 0;
#100;
$finish;
end
endmodule
