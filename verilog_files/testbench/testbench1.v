`timescale 1ns / 1ps

module testbench1(
    );
 wire clk_one,clk_four,reset,start,player,zero1,zero2,deb_button1,deb_button2;
 wire [2:0]timer1;
 wire [2:0] timer2;
 reg start_button = 0;
 reg button1 = 0;
 reg button2 = 0;
 chess_clock cc (button1,button2,start_button,clk_one,clk_four,start,reset,player,zero1,
                  zero2,timer1,timer2,deb_button1,deb_button2);
 
 initial
    begin
    //This is the test table
    #6 start_button = 1;    // wait for 6 ns         
    #3 start_button = 0;    // START button pressed for 5 ns
    #8 button1 = 1;         // wait for 8 ns
    #9 button1 = 0;         // BUTTON1 pressed for 9 ns
    #10 button2 = 1;        // wait for 10 ns
    #1.3 button2 = 0;       // BUTTON2 pressed for 1.3 ns
    #71.4 button1 = 1;      // wait for 71.4 ns
    #1.3 button1 = 0;       // BUTTON1 pressed for 1.3 ns
    #4 start_button =1;     // wait for 4 ns
    #20 $finish;            // END SIMULATION
    end
endmodule
