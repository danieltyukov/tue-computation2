`timescale 1ns / 1ps

module coffee_moore(input clk,
                    input insert,
                    input reset,
                    input [1:0] coins,
                    output coffee,
                    output reg [2:0] state_display);
    
    localparam credit0  = 3'b000;
    localparam credit5  = 3'b001;
    localparam credit10 = 3'b010;
    localparam credit15 = 3'b011;
    localparam credit20 = 3'b100;
    
    reg [2:0] next_state;
    reg prev_insert;
    
    
    always @(posedge clk) begin
        if (reset) begin
            state_display <= credit0;
        end
        else begin
            if (insert == 1 && prev_insert == 0) begin
                state_display <= next_state;
            end
        end
        prev_insert = insert;
    end
    
    always @(*) begin
        case (state_display)
            credit0: begin
                if (coins[1]) next_state      = credit5;
                else if (coins[0]) next_state = credit10;
            end
            credit5: begin
                if (coins[1]) next_state      = credit10;
                else if (coins[0]) next_state = credit15;
            end
            credit10: begin
                if (coins[1]) next_state      = credit15;
                else if (coins[0]) next_state = credit20;
            end
            credit15: begin
                if (coins[1]) next_state      = credit5;
                else if (coins[0]) next_state = credit10;
                else if (coins[1:0] == 2'b00) next_state           = credit0;
            end
            credit20: begin
                if (coins[1]) next_state      = credit10;
                else if (coins[0]) next_state = credit15;
                else if (coins[1:0] == 2'b00) next_state           = credit5;
            end
            default: next_state = credit0;
        endcase
        
    end
    
    assign coffee = (state_display == credit15) | (state_display == credit20);
endmodule
