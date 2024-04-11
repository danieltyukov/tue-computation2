////////////////////////////////////////////////
// SHIFTLEFT.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     SHIFTLEFT and SHIFTRIGHT modules
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module SHIFTLEFT(in, out);
    input   [31:0] in;
    output  [31:0] out;
    reg     [31:0] out;
    reg     [31:0] a;
    reg     [31:0] b;
    
    always @(in)
        begin : shiftleft_thread
            a = in;
            b = (a << 2);
            out = b;
        end

endmodule
