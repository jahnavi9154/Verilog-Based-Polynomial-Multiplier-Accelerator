`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 23:37:42
// Design Name: 
// Module Name: alu
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


module alu(input [3:0] alu_control, input [31:0] read_data1, input [31:0] alu_input2, output reg [31:0] alu_result, output zero) ;

always @(*) begin
case(alu_control) 
4'd0: begin
alu_result = read_data1 + alu_input2;  // add operation
end
4'd1: begin
alu_result = read_data1 - alu_input2; // sub operation
end
4'd2: begin
alu_result = read_data1 | alu_input2;  // or operation
end
4'd3: begin
alu_result = read_data1 & alu_input2;  // and operation
end   
4'd4: begin
alu_result = read_data1 ^ alu_input2;   // xor operation
end
4'd5: begin
alu_result = (read_data1 < alu_input2) ? 32'd1 : 32'd0;   // slt
end
4'd6: begin                       // sll
alu_result = read_data1 << alu_input2[4:0] ;   
end
4'd7: begin                       // srl
alu_result = read_data1 >> alu_input2[4:0] ; 
end
4'd8:  begin
alu_result = $signed(read_data1) >>> alu_input2[4:0];
end
4'd9: begin
alu_result = ($unsigned(read_data1) < $unsigned(alu_input2)) ? 32'd1 : 32'd0;  // sltu
end  
default:
alu_result = 32'd0;

endcase
end

assign zero = (alu_result == 32'd0);
endmodule
