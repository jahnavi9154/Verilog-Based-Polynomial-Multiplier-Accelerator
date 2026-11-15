`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 22:52:42
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;
reg clk;
reg [4:0]rs1;
reg [4:0]rs2;
reg [4:0]rd;
reg [31:0] write_data;
reg reg_write;
wire [31:0] read_data1;
wire [31:0] read_data2;

register_file uut(.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .write_data(write_data), .reg_write(reg_write), .read_data1(read_data1), .read_data2(read_data2));

always #5 clk = ~clk;
initial begin
    $monitor("Time=%0t rs1=%0d rs2=%0d rd=%0d write_data=%0d read_data1=%0d read_data2=%0d",
              $time, rs1, rs2, rd, write_data, read_data1, read_data2);

    // Test 1
    clk = 0;
    reg_write = 1;
    rd = 5;
    write_data = 100;
    rs1 = 0;
    rs2 = 0;
    #10;

    // Test 2
    rs1 = 5;
    rs2 = 0;
    #10;

    // Test 3
    rd = 8;
    write_data = 250;
    #10;

    // Test 4
    rs1 = 5;
    rs2 = 8;
    #10;
    
    // Test 5
    rd = 0;
    write_data = 999;
    reg_write = 1;
    #10;
    
    rs1 = 0;
    #10;

    $finish;
end
endmodule
