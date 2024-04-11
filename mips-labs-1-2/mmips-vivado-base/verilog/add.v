////////////////////////////////////////////////
// ADD.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     Adder
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module ADD(a, b, r);
    input   [31:0]  a;
    input   [31:0]  b;
    output  [31:0]  r;
    wire signed [31:0] a;
    wire signed [31:0] b;
    wire signed [31:0] r;

    assign r = a + b;

endmodule
