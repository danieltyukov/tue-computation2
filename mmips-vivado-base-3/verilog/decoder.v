////////////////////////////////////////////////
// DECODER.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     Decoder
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module DECODER(
        instr,
        instr_31_26,
        instr_25_0,
        instr_25_21,
        instr_20_16,
        instr_15_11,
        instr_15_0,
        instr_10_6,
        instr_5_0
    );

    input   [31:0]	instr;
    output  [5:0]	instr_31_26;
    output  [31:0]	instr_25_0;
    output  [4:0]   instr_25_21;
    output  [4:0]	instr_20_16;
    output  [4:0]	instr_15_11;
    output  [15:0]	instr_15_0;
    output  [4:0]	instr_10_6;
    output  [5:0]	instr_5_0;
    

    assign instr_31_26 = instr[31:26];
    assign instr_25_0 = instr[25:0];
    assign instr_25_21 = instr[25:21];
    assign instr_20_16 = instr[20:16];
    assign instr_15_11 = instr[15:11];
    assign instr_15_0 = instr[15:0];
    assign instr_10_6 = instr[10:6];
    assign instr_5_0 = instr[5:0];

endmodule
