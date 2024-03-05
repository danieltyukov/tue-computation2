`timescale 1ns / 1ps // 1 nano second with resolution of a picosecond
module counter_tb(

    );
    
    reg clk = 0;
    reg reset = 0;
    reg enable = 0;
    wire[3:0] count;
    
    always 
    // every 5 nanoseconds the clock will be (not clock)
    #5 clk <= ~clk;
    
    counter #(.number_of_clock_cycles(10)) counter_UUT (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .count(count)
    );
    
        initial
    begin
        #20 reset = 1'b1;
        #20 reset = 1'b0;
        #10 enable = 1'b1;
        #220 reset = 1'b1;
        #20 reset = 1'b0;
        #130 enable = 1'b0;
        #20 enable = 1'b1;
        #1000
            
        $finish;
    end
    
endmodule
