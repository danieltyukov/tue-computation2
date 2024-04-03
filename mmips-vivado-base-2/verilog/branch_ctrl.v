////////////////////////////////////////////////
// BRANCH_CTRL.V
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

module BRANCH_CTRL(BranchOp, AluZero, Branch);
    input   [1:0]   BranchOp;
    input   [0:0]   AluZero;
    output  [0:0]   Branch;
    reg     [0:0]   Branch;
    
    always @(BranchOp or AluZero)
        begin : branch_ctrl_thread
            case (BranchOp)
            0:  // No branch
                Branch = 1'b0;
                
            1:  // Branch on equal
                begin
                    if (AluZero == 1)
                        Branch = 1'b1;
                    else
                        Branch = 1'b0;
                end
                
            2:  // Branch on non equal
                begin
                    if (AluZero != 1'b1)
                        Branch = 1'b1;
                    else
                        Branch = 1'b0;
                end
                
            3:  // Jump
                Branch = 1'b1;
                
            endcase
        end

endmodule
