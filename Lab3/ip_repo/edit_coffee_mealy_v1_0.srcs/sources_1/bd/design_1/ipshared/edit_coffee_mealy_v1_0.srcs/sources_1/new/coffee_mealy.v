`timescale 1ns / 1ps

module coffee_mealy(input clk,
                    input insert,
                    input reset,
                    input [1:0] coins,
                    output reg coffee,
                    output reg [1:0] state_display);
    
    localparam credit0  = 2'b00;
    localparam credit5  = 2'b01;
    localparam credit10 = 2'b10;
    
    reg [1:0] next_state;
    reg prev_insert;
    reg out;
    
    always @(posedge clk) begin
        if (reset) begin
            state_display <= credit0;
            coffee        <= 0;
        end
        else begin
            if (insert == 1 && prev_insert == 0) begin
                state_display <= next_state;
                coffee        <= out;
            end
            prev_insert <= insert;
        end
        // prev_insert <= insert; should be here...
    end
    
    always @* begin
        case (state_display)
            credit0: begin
                if (coins == 2'b01) begin
                    next_state = credit5;
                end
                else if (coins == 2'b10) begin
                    next_state = credit10;
                end
                else if (coins == 2'b00) begin
                    next_state = credit0;
                end
                out = 0;
            end
            credit5: begin
                if (coins == 2'b01) begin
                    next_state = credit10;
                    out        = 0;
                end
                else if (coins == 2'b10) begin
                    next_state = credit0;
                    out        = 1;
                end
                else if (coins == 2'b00) begin
                    next_state = credit5;
                    out = 0;
                end
            end
            credit10: begin
                if (coins == 2'b01) begin
                    next_state = credit0;
                    out        = 1;
                end
                else if (coins == 2'b10) begin
                    next_state = credit5;
                    out        = 1;
                end
                else if (coins == 2'b00) begin
                    next_state = credit10;
                    out        = 0;
                end
            end
            default: begin
                next_state = credit0;
                out        = 0;
            end
        endcase
    end
    
endmodule