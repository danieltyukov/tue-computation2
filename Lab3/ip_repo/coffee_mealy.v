`timescale 1ns / 1ps

// Mealy Coffee Machine Implementation
module coffee_mealy(
    input clk, // Clock signal
    input insert, // Insert coin button
    input reset, // Reset signal
    input [1:0] coins, // Input for coins (2-bit wide for 5c and 10c)
    output reg coffee, // Output signal for coffee ready
    output reg [1:0] state_display // Output for current state (for debugging/visualization)
);

    // Define the next state display as a register
    reg [1:0] next_state_display;
    // Register to keep track of the previous insert value
    reg prev_insert;

    // State definitions using local parameters
    localparam A = 2'b00, B = 2'b01, C = 2'b10;

    // State shift on the positive edge of the clock
    always @(posedge clk) begin
        // Shift to the next state
        state_display <= next_state_display;
        // Update previous insert value
        prev_insert <= insert;
    end

    // Main Mealy FSM logic
    always @(*) begin
        // Debugging statement - remove in synthesis
//        $display("prev insert %b current insert %b coins %b", prev_insert, insert, coins);

        if (reset) begin
            // Reset state to A and turn off coffee output
            next_state_display = A;
            coffee = 0;
        end else if (~prev_insert && insert) // Detecting rising edge of insert
            case (state_display)
                A: begin
                    // Transition logic from state A
                    if (coins == 2'b01) begin
                        next_state_display = C;
                        coffee = 0;
                    end else if (coins == 2'b10) begin
                        next_state_display = B;
                        coffee = 0;
                    end else begin
                        next_state_display = A;
                        coffee = 0;
                    end
                end
                B: begin
                    // Transition logic from state B
                    if (coins == 2'b01) begin
                        next_state_display = A;
                        coffee = 1; // Coffee is ready on this transition
                    end else if (coins == 2'b10) begin
                        next_state_display = C;
                        coffee = 0;
                    end else begin
                        next_state_display = B;
                        coffee = 0;
                    end
                end
                C: begin
                    // Transition logic from state C
                    if (coins == 2'b01) begin
                        next_state_display = B;
                        coffee = 1; // Coffee is ready on this transition
                    end else if (coins == 2'b10) begin
                        next_state_display = A;
                        coffee = 1; // Coffee is ready on this transition
                    end else begin
                        next_state_display = C;
                        coffee = 0;
                    end
                end
                default: begin
                    // Fallback for any unused states
                    next_state_display = 2'b11; // This state should not be encountered
                    coffee = 0;
                end
            endcase
    end
    // No need to separately assign outputs; handled in the always blocks
endmodule
