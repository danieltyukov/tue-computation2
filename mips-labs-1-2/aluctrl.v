////////////////////////////////////////////////
// ALUCTRL.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     ALU controller
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module ALUCTRL(functionCode, ALUop, Shamt, ALUctrl);
    input   [5:0]   functionCode;
    input   [4:0]   ALUop;
    input   [4:0]   Shamt;
    output  [5:0]   ALUctrl;
    reg     [5:0]   ALUctrl;
    
    always @(functionCode or ALUop or Shamt)
        begin : aluctrl_thread
            case (ALUop) //synopsys parallel_case
                'h0:    // Add signed
                    ALUctrl = 'h2;
                    
                'h1:    // Subtract unsigned
                    ALUctrl = 'h6;
                    
                'h2:    // R-type instruction, look to functionCode
                    begin
                        case (functionCode)
                            'h0:    // SLL
                                case (Shamt) //Check shift amount
                                    1:
                                        ALUctrl = 'hA;
                                    2:
                                        ALUctrl = 'hB;
                                    8:
                                        ALUctrl = 'hC;
                                    default:
                                        ALUctrl = 'h0;
                                endcase
                                
                            'h2:    // SRL
                                case (Shamt) //Check shift amount
                                    1:
                                        ALUctrl = 'hD;
                                    2:
                                        ALUctrl = 'hE;
                                    8:
                                        ALUctrl = 'hF;
                                    default:
                                        ALUctrl = 'h0;
                                endcase
                                
                            'h3:    // SRA
                                case (Shamt) //Check shift amount
                                    1:
                                        ALUctrl = 'h10;
                                    2:
                                        ALUctrl = 'h11;
                                    8:
                                        ALUctrl = 'h12;
                                    default:
                                        ALUctrl = 'h0;
                                endcase
                                
                            'h10:   // Move hi register (nop in ALU)
                                ALUctrl = 'h0;
                                
                            'h12:   // Move hi register (nop in ALU)
                                ALUctrl = 'h0;
                                
                            'h19:   // Multiply unsigned
                                ALUctrl = 'h13;
                                
                            'h20:   // Add signed
                                ALUctrl = 'h2;
                                
                            'h21:   // Add unsigned
                                ALUctrl = 'h3;
                                
                            'h23:   // Subtract unsigned
                                ALUctrl = 'h6;
                                
                            'h24:   // And
                                ALUctrl = 'h0;
                                
                            'h25:   // Or
                                ALUctrl = 'h1;
                                
                            'h26:  // Xor
                                ALUctrl = 'h4;
                                
                            'h2A:   //Set-on-less-than (2's complement)
                                ALUctrl = 'h7;
                                
                            'h2B:   //Set-on-less-than (unsigned)
                                ALUctrl = 'h8;
                            // ! Modified
                            'h30:
                                ALUctrl = 'h14;
                            default:
                                ALUctrl = 'h0;
                        endcase
                    end
                'h3:    // Add unsigned
                    ALUctrl = 6'b000011;
                    
                'h4:    // And
                    ALUctrl = 6'b000000;
                    
                'h5:    // Or
                    ALUctrl = 6'b000001;
                    
                'h6:    // Xor
                    ALUctrl = 6'b000100;
                    
                'h7:    //Slt
                    ALUctrl = 6'b000111;
                    
                'h8:    //Sltu
                    ALUctrl = 6'b001000;
                    
                'h9:    //Load upper immediate
                    ALUctrl = 6'b001001;
                    
                default:
                    ALUctrl = 6'b000000;
            endcase
        end

endmodule
