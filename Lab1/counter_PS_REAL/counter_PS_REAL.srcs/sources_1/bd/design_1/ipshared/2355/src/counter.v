`timescale 1ns / 1ps
module counter #(
    // means it would count every "10" clock cycles - do 1 for fpga
    // parameters allow to pass constants into modules
    parameter integer number_of_clk_cycles = 1
    )
    (
    input clk,
    input enable,
    input reset,
    output reg [3:0] count // count output increased by one every "10" clock cycles
    );
    
reg [31:0] seconds;
wire [31:0] seconds_next;

always @(posedge clk)
begin
    if (reset == 1'b1) begin
        count <= 4'b0;
        seconds <= 32'b0;
    end
    // counter incremented everytime the seconds which align with clock cycles reaches 9 so on the 10th peak counter is incremented seconds is reset and starts counting again. Since the clock runs continuously.
    else if(enable == 1'b1 && seconds == number_of_clk_cycles-1'd1) begin
        seconds <= 32'b0;
        count    <= (count + 1); // % 16 ==> max count ==> so not exceeding 4 bits;
    end
    else if(enable == 1'b1) begin
        seconds <= seconds_next;
    end
end

adder adder_cnt(
    .a(seconds),
    .b(32'b1),
    .c(seconds_next)
);
    
endmodule

// 1'b1 represents a 1-bit wide binary value of 1.
// 1'b0 represents a 1-bit wide binary value of 0.
// 1'd1 represents a 1-bit wide decimal value of 1.

// The #( and ) enclose the parameter declarations.
// The ( and ) after the parameter block enclose the module's port declarations (inputs and outputs).