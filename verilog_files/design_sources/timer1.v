`timescale 1ns / 1ps

module timer1(input clk_four,input start,input reset, input player,output reg [2:0] t1, output reg zero1
    );
    
    initial t1 = 3'b111;
    initial zero1 = 1'b0;
    
    always @(posedge clk_four)
    begin
    if (reset == 1)
        begin
        t1 <= 7;
        zero1 <= 0;
        end
    if ((start == 1) & (reset == 0))
        begin
        if (player == 0)
            begin
            t1 <= t1 - 3'b001;
            if (t1 == 0)
                begin
                zero1 <= 1;
                end
            end
        end
    end
endmodule
