`timescale 1ns / 1ps
module clk_four_hz(input clk_one, output reg clk_four);

reg [1:0] cnt = 0;

initial clk_four = 1'b1;

always @(posedge clk_one)
    begin
    cnt <= cnt+1;
    if (cnt == 1)
        begin
        cnt <= 0;
        clk_four <= ~ clk_four;
        end
    
    end
endmodule
