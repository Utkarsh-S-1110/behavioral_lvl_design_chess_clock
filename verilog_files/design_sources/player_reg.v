`timescale 1ns / 1ps

module player_reg(input clk_one,input reset, input start,input s1, input s2, output reg player
    );
    
initial player = 1'b0;

always @(posedge clk_one)
    begin
    if (reset == 1)
        begin
        player <= 0;
        end
    if (((s1|s2) == 1) & start)
        begin
        player <= ~player;
        end
    end
endmodule
