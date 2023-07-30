`timescale 1ns / 1ps

module timer2(input clk_four,input start,input reset, input player,output reg [2:0] t2, output reg zero2
    );
    
    initial t2 = 3'b111;
    initial zero2 = 1'b0;
    
    always @(posedge clk_four)
    begin
    if (reset == 1)
        begin
        t2 <= 7;
        zero2 <= 0;
        end
    if ((start == 1) & (reset == 0))
        begin
        if (player == 1)
            begin
            t2 <= t2 - 3'b001;
            if (t2 == 0)
                begin
                zero2 <= 1;
                end
            end
        end
    end
endmodule
