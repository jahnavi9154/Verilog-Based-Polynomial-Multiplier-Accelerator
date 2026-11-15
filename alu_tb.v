`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 23:54:54
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
reg [2:0] alu_control;
reg [31:0] read_data1, read_data2;
wire [31:0] alu_result;

alu uut(.alu_control(alu_control), .read_data1(read_data1), .read_data2(read_data2), .alu_result(alu_result));
initial begin

$monitor("Time=%0t Control=%0d A=%0d B=%0d Result=%0d",
          $time, alu_control, read_data1, read_data2, alu_result);
          
alu_control = 0;
read_data1 = 10;
read_data2 = 10;
#10

alu_control = 1;
read_data1 = 15;
read_data2 = 5;
#10

alu_control = 2;
read_data1 = 12;
read_data2 = 10;
#10

alu_control = 3;
read_data1 = 12;
read_data2 = 10;
#10

alu_control = 4;
read_data1 = 12;
read_data2 = 10;
#10

alu_control = 5;
read_data1 = 12;
read_data2 = 10;
#10

alu_control = 7;
read_data1 = 100;
read_data2 = 50;
#10

$finish;
end
endmodule
