`timescale 1ns / 1ps
module chess_clock(input button1, input button2, input start_button,output a_to_g_1, output a_to_g_2);
 
    wire clk_one;                 // 1GHz clock
    wire clk_four;                // 0.25 Ghz clock
    wire start;                   //when 1, start executing
    wire reset;                   // if 1, reset
    wire zero1;                   // if 1, Timer1 has reached 0
    wire zero2 ;                  // if 1, Timer2 has reacged 0
    wire player;                  // 0 --> White, 1--> Black
    wire [2:0] time1;                // O/P of Timer1
    wire [2:0] time2;                // O/P of Timer2
    wire q11,q12,q21,q22,deb_button1,deb_button2;   // For Debouncing switches
    wire ss1 = button1;                // Assigning reg variables to wire type
    wire ss2 = button2;
    wire ssb = start_button;
    
    wire dp = 1;                      //off
    wire [7:0] an1 = 8'b11111110;
    wire [7:0] an2 = 8'b11101111;
    wire [6:0] a_to_g_1;
    wire [6:0] a_to_g_2;    
    
    clk_one_hz f1(clk_one);
    clk_four_hz f2(clk_one,clk_four);
    player_reg f3(clk_one,reset,start,deb_button1,deb_button2,player);
    start_reg f4(clk_one,reset,ssb,start);
    zero_reg f5(clk_one,zero1,zero2,reset);
    timer1 f6(clk_four,start,reset,player,time1,zero1);
    timer2 f7(clk_four,start,reset,player,time2,zero2);
    debounce_s1 d1 (clk_one,ss1,q11);
    debounce_s1 d2 (clk_one,q11,q12);
    assign deb_button1 = q11 & (~q12);
    debounce_s1 d3 (clk_one,ss2,q21);
    debounce_s1 d4 (clk_one,q21,q22);
    assign deb_button2 = q21 & (~q22);
    hex7seg hs1 (time1,a_to_g_1);
    hex7seg hs2 (time2,a_to_g_2);
    
endmodule

