`timescale 1ns / 1ps

module zero_reg(input clk_one,input zero1,input zero2,output reg reset
    );
    
initial reset = 1'b0;

always @(posedge clk_one)
    begin
    if (((zero1|zero2) == 1) & (reset == 0))
        begin
        reset <= 1;
        end
    else if (((zero1|zero2) == 0) & (reset == 1))
        begin
        reset <= 0;
        end
    end
endmodule
