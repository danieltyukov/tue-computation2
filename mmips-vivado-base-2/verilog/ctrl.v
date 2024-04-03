////////////////////////////////////////////////
// CTRL.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     Single cycle controller
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module CTRL(
        enable,
        en,
        Opcode,
        FunctionCode,
        RegDst,
        Target,
        Branch,
        MemRead,
        MemtoReg,
        ALUop,
        MemWrite,
        ALUSrc,
        RegWrite,
        SignExtend,
        c4,
        c1,
        c31,
        HiLoWrite,
        AluSel
    );

    input   enable;
    output  [0:0]   en;
    reg     [0:0]   en;
    input   [5:0]   Opcode;
    input   [5:0]   FunctionCode;
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
    output  [0:0]   SignExtend;
    reg     [0:0]   SignExtend;
    output  [31:0]  c4;
    reg     [31:0]  c4;
    output  [0:0]   c1;
    reg     [0:0]   c1;
    output  [4:0]   c31;
    reg     [4:0]   c31;
    output  [0:0]   HiLoWrite;
    reg     [0:0]   HiLoWrite;
    output  [1:0]   AluSel;
    reg     [1:0]   AluSel;

    
    always @(Opcode or FunctionCode or enable)
        begin
            
            //Write constant 4 to output
            c4 = 32'b00000000000000000000000000000100; 
            //Write constant 1 to output
            c1 = 1'b1;
            //Write constant 31 to output
            c31 = 5'b11111;
            
            if (enable == 1)
                en = 1'b1;
            else
                en = 1'b0;
            
            RegDst      = 2'b00;
            Target      = 2'b00;
            ALUSrc      = 1'b0;
            MemtoReg    = 2'b00;
            RegWrite    = 1'b0;
            MemRead     = 2'b00;
            MemWrite    = 2'b00;
            Branch      = 2'b00;
            ALUop       = 5'b00000;
            SignExtend  = 1'b0;
            
            //Determine the output
            case (Opcode)
            0: // R-format instruction: check functioncode
                case (FunctionCode)
                    'h8:  // Instruction: Jr
                        begin
                            RegDst      = 2'b01;
                            Target      = 2'b10;
                            ALUSrc      = 1'b0;
                            MemtoReg    = 2'b00;
                            RegWrite    = 1'b0;
                            MemRead     = 2'b00;
                            MemWrite    = 2'b00;
                            Branch      = 2'b11;
                            ALUop       = 5'b00010;
                            SignExtend  = 1'b1;
                            HiLoWrite   = 1'b0;
                            AluSel      = 2'b00;
                        end
                    'h9:  // Instruction Jalr
                        begin
                            RegDst      = 2'b01;
                            Target      = 2'b10;
                            ALUSrc      = 1'b0;
                            MemtoReg    = 2'b00;
                            RegWrite    = 1'b1;
                            MemRead     = 2'b00;
                            MemWrite    = 2'b00;
                            Branch      = 2'b11;
                            ALUop       = 5'b00010;
                            SignExtend  = 1'b1;
                            HiLoWrite   = 1'b0;
                            AluSel      = 2'b11;
                        end
                    'h10:  // Instruction: Move hi register
                        begin
                            RegDst      = 2'b01;
                            Target      = 2'b00;
                            ALUSrc      = 1'b0;
                            MemtoReg    = 2'b00;
                            RegWrite    = 1'b1;
                            MemRead     = 2'b00;
                            MemWrite    = 2'b00;
                            Branch      = 2'b00;
                            ALUop       = 5'b00010;
                            SignExtend  = 1'b1;
                            HiLoWrite   = 1'b0;
                            AluSel      = 2'b10;
                        end
                    'h12:  // Instruction: Move lo register
                        begin
                            RegDst      = 2'b01;
                            Target      = 2'b00;
                            ALUSrc      = 1'b0;
                            MemtoReg    = 2'b00;
                            RegWrite    = 1'b1;
                            MemRead     = 2'b00;
                            MemWrite    = 2'b00;
                            Branch      = 2'b00;
                            ALUop       = 5'b00010;
                            SignExtend  = 1'b1;
                            HiLoWrite   = 1'b0;
                            AluSel      = 2'b01;
                        end
                    'h19:  // Instruction: Multiply unsigned
                        begin
                            RegDst      = 2'b00; //No destination
                            Target      = 2'b00;
                            ALUSrc      = 1'b0;
                            MemtoReg    = 2'b00;
                            RegWrite    = 1'b1;
                            MemRead     = 2'b00;
                            MemWrite    = 2'b00;
                            Branch      = 2'b00;
                            ALUop       = 5'b00010;
                            SignExtend  = 1'b1;
                            HiLoWrite   = 1'b1;
                            AluSel      = 2'b00;
                        end
                    default: // Others
                        begin 
                            RegDst      = 2'b01;
                            Target      = 2'b00;
                            ALUSrc      = 1'b0;
                            MemtoReg    = 2'b00;
                            RegWrite    = 1'b1;
                            MemRead     = 2'b00;
                            MemWrite    = 2'b00;
                            Branch      = 2'b00;
                            ALUop       = 5'b00010;
                            SignExtend  = 1'b1;
                            HiLoWrite   = 1'b0;
                            AluSel      = 2'b00;
                            end
                    endcase
            2:  // Instruction: J
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b01;
                    ALUSrc      = 1'b0;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b0;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b11;
                    ALUop       = 5'b00010;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            3:  // Instruction; Jal
                begin
                    RegDst      = 2'b10;
                    Target      = 2'b01;
                    ALUSrc      = 1'b0;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b11;
                    ALUop       = 5'b00010;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b11;
                end
            4:  // Instruction: BEQ
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b0;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b0;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b01;
                    ALUop       = 5'b00001;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            5:  // Instruction: BNE
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b0;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b0;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b10;
                    ALUop       = 5'b00001;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            9:  // Instruction: ADDIU
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00011;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            10:  // Instruction: SLTI
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00111;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            11:  // Instruction: SLTUI
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b01000;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            12:  // Instruction: ANDI
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00100;
                    SignExtend  = 1'b0;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            13:  // Instructino: ORI
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00101;
                    SignExtend  = 1'b0;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            14:  // Instruction: XORI
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00110;
                    SignExtend  = 1'b0;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            15:  // Instruction: LUI
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b01001;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            32:  //Instruction: LB
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b10;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b10;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00000;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            35:  // Instruction: LW
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b01;
                    RegWrite    = 1'b1;
                    MemRead     = 2'b01;
                    MemWrite    = 2'b00;
                    Branch      = 2'b00;
                    ALUop       = 5'b00000;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            40:  // Instruction: SB
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b0;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b10;
                    Branch      = 2'b00;
                    ALUop       = 5'b00000;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            43:  // Instruction: SW
                begin
                    RegDst      = 2'b00;
                    Target      = 2'b00;
                    ALUSrc      = 1'b1;
                    MemtoReg    = 2'b00;
                    RegWrite    = 1'b0;
                    MemRead     = 2'b00;
                    MemWrite    = 2'b01;
                    Branch      = 2'b00;
                    ALUop       = 5'b00000;
                    SignExtend  = 1'b1;
                    HiLoWrite   = 1'b0;
                    AluSel      = 2'b00;
                end
            default: //No default case
                begin 
                end
            endcase
        end

endmodule
