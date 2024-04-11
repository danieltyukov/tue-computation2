////////////////////////////////////////////////
// SIGNEXTEND.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     Sign extension
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module SIGNEXTEND_BYTE(in, out);
    input   [31:0] in;
    output  [31:0] out;
    
    
    // Note: The GNU assembler assumes that signextension is not done on a LB instruction,
    // altough the MIPS instruction set description describes this. But as we use the GNU
    // tools we skip sign extension and make the upper 24 bits always 0. If we wouldn't
    // do this, the program will run into problems.
    assign out = {24'b0, in[7:0]};

endmodule
