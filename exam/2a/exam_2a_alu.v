////////////////////////////////////////////////
// ALU.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//     Arithmetic  Logic Unit
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module ALU(ctrl, a, b, r, r2, z);
    input       [5:0]   ctrl;
    input       [31:0]  a;
    input       [31:0]  b;
    output      [31:0]  r;
    reg         [31:0]  r;
    output      [31:0]  r2;
    reg         [31:0]  r2;
    output      [0:0]   z;
    reg         [0:0]   z;
    reg         [31:0]  s;
    reg         [31:0]  t;
    reg signed  [31:0]  s_int;
    reg signed  [31:0]  t_int;
    reg         [31:0]  result;
    reg         [31:0]  result_hi;
    reg         [0:0]   sign;
    reg signed  [63:0]  c;
    reg         [0:0]   zero;
    
    always @(ctrl or a or b)
        begin : alu_thread
        
            //Read the inputs
            s           = a;
            t           = b;
            s_int       = s;
            t_int       = t;
            result      = 0;
            result_hi   = 0;
            
            // Calculate result using selected operation
            case (ctrl)
                'h0:    // And
                    result = s & t;
                    
                'h1:    // Or
                    result = s | t;
                    
                'h2:    // Add signed
                    result = s_int + t_int;
                    
                'h3:    // Add unsigned
                    result = s + t;
                    
                'h4:    // Xor
                    result = s ^ t;
                    
                'h6:    // Substract signed
                    result = s - t;
                    
                'h7:    // Set-on-less-than
                    if (s_int < t_int)
                        result = 1;
                    else
                        result = 0;
                        
                'h8:    // Set-on-less-than unsigned
                    if (s < t)
                        result = 1;
                    else
                        result = 0;
                        
                'h9:    // Load upper immediate
                    result = (t << 16);
                    
                'hA:    // SLL (1 bit)
                    result = (t << 1);
                    
                'hB:    // SLL (2 bit)
                    result = (t << 2);
                    
                'hC:    // SLL (8 bit)
                    result = (t << 8);
                    
                'hD:    // SRL (1 bit)
                    result = (t >> 1);
                    
                'hE:    // SRL (2 bit)
                    result = (t >> 2);
                    
                'hF:    // SRL (8 bit)
                    result = (t >> 8);
                    
                'h10:   // SRA (1 bit)
                    begin
                        sign = t[31:31];
                        result = (t >> 1);
                        result[31:31] = sign;
                    end
                    
                'h11:   // SRA (2 bit)
                    begin
                        sign = t[31:31];
                        result = (t >> 2);
                        result[31:30] = {sign, sign};
                    end
                    
                'h12:   // SRA (8 bit)
                    begin
                        sign = t[31:31];
                        result = (t >> 8);
                        result[31:24] = {sign, sign, sign, sign, sign, sign, sign, sign};
                    end
                    
                'h13:   //Multu
                    begin
                        c = s * t;
                        result = c[31:0];
                        result_hi = c[63:32];
                    end
                
                'h14:
                    begin
                        if(s>t) result=255;
                        else result=0;
                    end
                
                default: //No default case: invallid opcode! 
                    begin 
                    end
            endcase
            
            // Calculate zero output
            if (result == 0)
                zero = 1;
            else
                zero = 0;
            
            // Write results to output
            r = result;
            r2 = result_hi;
            z = zero;
        end

endmodule
