////////////////////////////////////////////////
// REGISTER.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

module REGISTER (in, w, out, rst, clk);
    parameter WIDTH = `DWORD;
    input   [WIDTH-1:0] in;
    input   [0:0]       w;
    output  [WIDTH-1:0] out;
    reg     [WIDTH-1:0] out;
    input               rst;
    input               clk;
    
    always @(posedge clk or posedge rst)
        begin
            if (rst == 1)
                out <= 0;
            else
            begin
                if (w == 1)
                    out <= in;
            end
        end

endmodule
