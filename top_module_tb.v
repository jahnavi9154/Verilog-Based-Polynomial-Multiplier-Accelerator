`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 23:24:51
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb;

reg clk;
reg reset;


top_module uut(.clk(clk), .reset(reset));

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    #10
    reset = 0;

    // Wait for processor to execute instructions
    #70

    $finish;

end

endmodule
