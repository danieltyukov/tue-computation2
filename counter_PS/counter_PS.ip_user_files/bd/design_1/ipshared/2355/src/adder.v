`timescale 1ns / 1ps
module adder(
    // 32 bit vectors -> starts count from 0
    input [31:0] a,
    input [31:0] b,
    output [31:0] c
    );
    
wire [31:0] carry;

// generation is needed for the for loop in HDL
genvar i;

generate
for (i=0;i<32;i=i+1)
    begin: generate_32_bit_adder
        // LSB for the first bit uses a half adder since there is no carry-in bit since is the first one
        if (i==0)
            half_adder F(
            .a(a[0]),
            .b(b[0]),
            .s(c[0]),
            .c(carry[0])
            );
        else
            full_adder F(
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i-1]),
            .s(c[i]),
            .cout(carry[i])
            );
        end
        
endgenerate
endmodule