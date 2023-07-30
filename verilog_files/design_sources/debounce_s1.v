`timescale 1ns / 1ps

module debounce_s1(input clk_one,input s1,output reg Q, output reg Q_bar
    );
    always @(posedge clk_one)
    begin 
    Q <= s1;
    Q_bar<=!Q;
    end
endmodule
