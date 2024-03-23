`timescale 1ns / 1ps

module coffee_mealy(input clk,
                    input insert,
                    input reset,
                    input [1:0] coins,
                    output reg coffee, // coffee is now a reg since it's updated conditionally within always blocks
                    output reg [2:0] state_display);

    localparam credit0  = 3'b000;
    localparam credit5  = 3'b001;
    localparam credit10 = 3'b010;
    
    reg [2:0] next_state;
    reg prev_insert;

    // Initialize coffee output to off in case of reset
    always @(posedge clk) begin
        if (reset) begin
            state_display <= credit0;
            coffee <= 0; // Ensure coffee LED is off on reset
        end
        else begin
            if (insert == 1 && prev_insert == 0) begin
                state_display <= next_state;
                // Update the coffee output based on transitions, not states
                coffee <= (next_state == credit0 && (coins == 2'b01 || coins == 2'b10 )) || (next_state == credit5 && coins == 2'b01);
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
                else if (coins[0]) next_state = credit0;
            end
            credit10: begin
                if (coins[1]) next_state      = credit0;
                else if (coins[0]) next_state = credit5;
            end
            default: next_state = credit0;
        endcase
        
    end
    
    // Unlike Moore machine, coffee output is updated in the clk-triggered always block
    // based on the transitions rather than being directly assigned from the current state.
endmodule
