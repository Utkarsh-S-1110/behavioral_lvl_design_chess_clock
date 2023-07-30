`timescale 1ns / 1ps

module start_reg(input clk_one,input reset, input start_button, output reg start
    );
    
initial start = 1'b0; 
   
always @(posedge clk_one)
    begin
    if (reset == 1)
        begin
        start <= 0;
        end
    else if (start_button == 1)
        begin
        start <= 1;
        end
    end
endmodule
