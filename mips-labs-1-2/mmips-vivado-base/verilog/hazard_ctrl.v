////////////////////////////////////////////////
// HAZARD_CTRL.V
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

module HAZARD_CTRL(
        Hazard,
        CtrlRegDst,
        CtrlTarget,
        CtrlBranch,
        CtrlMemRead,
        CtrlMemtoReg,
        CtrlALUop,
        CtrlMemWrite,
        CtrlALUSrc,
        CtrlRegWrite,
        CtrlHiLoWrite,
        CtrlAluSel,
        RegDst,
        Target,
        Branch,
        MemRead,
        MemtoReg,
        ALUop,
        MemWrite,
        ALUSrc,
        RegWrite,
        HiLoWrite,
        AluSel
    );

    input   [0:0]   Hazard;
    input   [1:0]   CtrlRegDst;
    input   [1:0]   CtrlTarget;
    input   [1:0]   CtrlBranch;
    input   [1:0]   CtrlMemRead;
    input   [1:0]   CtrlMemtoReg;
    input   [4:0]   CtrlALUop;
    input   [1:0]   CtrlMemWrite;
    input   [0:0]   CtrlALUSrc;
    input   [0:0]   CtrlRegWrite;
    input   [0:0]   CtrlHiLoWrite;
    input   [1:0]   CtrlAluSel;
    output  [1:0]   RegDst;
    reg     [1:0]   RegDst;
    output  [1:0]   Target;
    reg     [1:0]   Target;
    output  [1:0]   Branch;
    reg     [1:0]   Branch;
    output  [1:0]   MemRead;
    reg     [1:0]   MemRead;
    output  [1:0]   MemtoReg;
    reg     [1:0]   MemtoReg;
    output  [4:0]   ALUop;
    reg     [4:0]   ALUop;
    output  [1:0]   MemWrite;
    reg     [1:0]   MemWrite;
    output  [0:0]   ALUSrc;
    reg     [0:0]   ALUSrc;
    output  [0:0]   RegWrite;
    reg     [0:0]   RegWrite;
    output  [0:0]   HiLoWrite;
    reg     [0:0]   HiLoWrite;
    output  [1:0]   AluSel;
    reg     [1:0]   AluSel;
    
    always @(Hazard or 
                CtrlRegDst or 
                CtrlBranch or 
                CtrlMemRead or 
                CtrlMemtoReg or 
                CtrlALUop or 
                CtrlMemWrite or 
                CtrlALUSrc or 
                CtrlRegWrite or 
                CtrlTarget or 
                CtrlHiLoWrite or 
                CtrlAluSel)
        
        begin : hazard_ctrl_thread
            
            if (Hazard == 1'b0)
            begin
                RegDst      = CtrlRegDst;
                Target      = CtrlTarget;
                Branch      = CtrlBranch;
                MemRead     = CtrlMemRead;
                MemtoReg    = CtrlMemtoReg;
                ALUop       = CtrlALUop;
                MemWrite    = CtrlMemWrite;
                ALUSrc      = CtrlALUSrc;
                RegWrite    = CtrlRegWrite;
                HiLoWrite   = CtrlHiLoWrite;
                AluSel      = CtrlAluSel;
            end
            else
            begin
                RegDst      = 0;
                Target      = 0;
                Branch      = 0;
                MemRead     = 0;
                MemtoReg    = 0;
                ALUop       = 0;
                MemWrite    = 0;
                ALUSrc      = 0;
                RegWrite    = 0;
                HiLoWrite   = 0;
                AluSel      = 0;
            end
        end

endmodule
