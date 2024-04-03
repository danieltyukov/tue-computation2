////////////////////////////////////////////////
// IMM2WORD.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     Immediate to word conversion (with or withour sign)
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module IMM2WORD(
        in,
        signextend,
        out
    );
    
    input   [15:0]  in;
    input   [0:0]   signextend;
    output  [31:0]  out;
    reg     [31:0]  out;
    reg     [15:0]  sign;
    
    always @(in or signextend)
        begin : imm2word_thread
            //Check for sign extension
            if (signextend == 1'b1 && in[15] == 1)
                sign = 16'b1111111111111111;
            else
                sign = 16'b0000000000000000;
            out = {sign, in};
        end

endmodule
