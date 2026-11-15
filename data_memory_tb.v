`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2026 13:16:45
// Design Name: 
// Module Name: data_memory_tb
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


module data_memory_tb;

reg clk;
reg mem_write;
reg mem_read;
reg [31:0] address;
reg [31:0] write_data;
wire [31:0] read_data;

data_memory uut(
    .clk(clk),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

initial begin

    clk = 0;

    // Write 25 to address 16
    mem_write = 1;
    mem_read = 0;
    address = 16;
    write_data = 25;

    #10;

    // Read from address 16
    mem_write = 0;
    mem_read = 1;
    address = 16;

    #10;

    $finish;

end

initial begin
    $monitor("time=%0t address=%0d read_data=%0d",
              $time, address, read_data);
end

endmodule
