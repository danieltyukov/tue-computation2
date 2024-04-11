////////////////////////////////////////////////
// MUX.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//  Multiplexers
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

//Multiplexer with two inputs, DWORD width
module MUX2(in0, in1, sel, out);
    input   [`DWORD-1:0]    in0;
    input   [`DWORD-1:0]    in1;
    input   [0:0]           sel;
    output  [`DWORD-1:0]    out;
    reg     [`DWORD-1:0]    out;
 
    always @(in0 or in1 or sel)
        begin : mux_thread
            if (sel == 1'b0)
                out = in0;
            else
                out = in1;
        end

endmodule

//Multiplexer with three inputs
module MUX3(in0, in1, in2, sel, out);
    parameter WIDTH = `DWORD;
    input   [WIDTH-1:0] in0;
    input   [WIDTH-1:0] in1;
    input   [WIDTH-1:0] in2;
    input   [1:0]       sel;
    output  [WIDTH-1:0] out;
    reg     [WIDTH-1:0] out;
    
    always @(in0 or in1 or in2 or sel)
        begin : mux_thread
            if (sel == 2'b00)
                out = in0;
            else if (sel == 2'b01)
                out = in1;
            else
                out = in2;
        end
endmodule

//Multiplexer with four inputs
module MUX4(in0, in1, in2, in3, sel, out);
    parameter WIDTH = `DWORD;
    input   [WIDTH-1:0] in0;
    input   [WIDTH-1:0] in1;
    input   [WIDTH-1:0] in2;
    input   [WIDTH-1:0] in3;
    input   [1:0]       sel;
    output  [WIDTH-1:0] out;
    reg     [WIDTH-1:0] out;
    
    always @(in0 or in1 or in2 or in3 or sel)
        begin : mux_thread
            if (sel == 2'b00)
                out = in0;
            else if (sel == 2'b01)
                out = in1;
            else if (sel == 2'b10)
                out = in2;
            else
                out = in3;
        end
endmodule
