`timescale 1ns / 1ps
module clk_one_hz(output reg clk_one);
initial clk_one = 1'b1;
always #1 clk_one = ~clk_one;
endmodule
