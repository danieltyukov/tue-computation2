////////////////////////////////////////////////
// REGFILE16.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//  Xilinx-Block-RAM-based register file
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

module REGFILE16(
        r_addr_reg1,
        r_data_reg1,
        r_addr_reg2,
        r_data_reg2,
        w_addr_reg,
        w_data_reg,
        w,
        clk
    );
    input   [4:0]   r_addr_reg1;
    output  [31:0]  r_data_reg1;
    reg     [31:0]  r_data_reg1;
    input   [4:0]   r_addr_reg2;
    output  [31:0]  r_data_reg2;
    reg     [31:0]  r_data_reg2;
    input   [4:0]   w_addr_reg;
    input   [31:0]  w_data_reg;
    input   [0:0]   w;
    input           clk;
    
    reg     [`DWORD-1:0]    regs [31:0];
    integer i; //Used for resetting the registers
    
    initial
    begin
        
        for (i=0; i<32; i = i+1)
            regs[i] = 0;
        r_data_reg1 = 0;
        r_data_reg2 = 0;
    end    
    
    always @(posedge(clk))
    begin
        if (w == 1'b1)
            if (w_addr_reg != 5'b00000) //Can't write to zero register
                regs[w_addr_reg] = w_data_reg;
    end
    
    always @(r_addr_reg1 or regs[r_addr_reg1])
        r_data_reg1 = regs[r_addr_reg1];
    always @(r_addr_reg2 or regs[r_addr_reg2])
        r_data_reg2 = regs[r_addr_reg2];
    
endmodule
