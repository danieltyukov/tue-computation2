`timescale 1ns / 1ps

// Define the module for a Coffee Vending Machine using a Moore FSM
module coffee_moore(
    input clk,           // Clock input for synchronous logic
    input reset,         // Reset input to initialize the machine state
    input [1:0] coins,   // Input representing coins inserted (2-bit for simplicity)
    output coffee        // Output signal to dispense coffee
);

    // State definition using local parameters for readability
    localparam cent0  = 3'd0; // State: No coin inserted
    localparam cent5  = 3'd1; // State: 5 cents inserted
    localparam cent10 = 3'd2; // State: 10 cents inserted
    localparam cent5c = 3'd3; // State: 15 cents inserted, ready to dispense coffee (change from 5)
    localparam cent0c = 3'd4; // State: Coffee dispensed, no change (exact amount)

    // Register declaration for current and next states, and coffee output
    reg [2:0] state_r, state_nxt;
    reg coffee_r, coffee_nxt;

    // Synchronous block to handle state and output updates on the clock's rising edge
    always @(posedge clk)
    begin
        if(reset)
        begin
            state_r  <= cent0;  // Initialize state to cent0 upon reset
            coffee_r <= 1'b0;   // Ensure coffee is not dispensed upon reset
        end
        else
        begin
            state_r  <= state_nxt; // Update current state to next state
            coffee_r <= coffee_nxt; // Update coffee dispensing signal
        end
    end

    // Combinatorial block to determine the next state and coffee output
    always @(*)
    begin
        // Default behavior to prevent latching
        state_nxt  = state_r;    // Assume state remains unchanged
        coffee_nxt = coffee_r;   // Assume coffee output remains unchanged
        
        // State transition logic based on current state and input coins
        case(state_r)
            cent0:
            begin
                coffee_nxt = 1'b0; // No coffee dispensed in cent0 state
                if(coins == 2'b01) // If 10 cents inserted
                begin
                    state_nxt = cent10; // Move to cent10 state
                end
                else if(coins == 2'b10) // If 5 cents inserted
                begin
                    state_nxt = cent5; // Move to cent5 state
                end
            end
            
            cent5:
            begin
                coffee_nxt = 1'b0; // No coffee dispensed in cent5 state
                if(coins == 2'b01) // If 10 cents inserted
                begin
                    state_nxt = cent0c; // Move to cent0c (exact amount for coffee, no change)
                end
                else if(coins == 2'b10) // If another 5 cents inserted
                begin
                    state_nxt = cent10; // Move to cent10 state
                end
            end
            
            cent10:
            begin
                coffee_nxt = 1'b0; // No coffee dispensed in cent10 state
                if(coins == 2'b01) // If 10 cents inserted
                begin
                    state_nxt = cent5c; // Move to cent5c (coffee ready, 5 cents change)
                end
                else if(coins == 2'b10) // If 5 cents inserted
                begin
                    state_nxt = cent0c; // Move to cent0c (exact amount for coffee, no change)
                end
            end
            
            cent5c:
            begin
                coffee_nxt = 1'b1; // Coffee dispensed in cent5c state
                // Transition logic after dispensing coffee
                if(coins == 2'b01) // If 10 cents inserted
                begin
                    state_nxt = cent0c; // Move to cent0c (new transaction, exact amount)
                end
                else if(coins == 2'b10) // If 5 cents inserted
                begin
                    state_nxt = cent10; // Move to cent10 state (new transaction)
                end
                else if(coins == 2'b00) // No coin inserted
                begin
                    state_nxt = cent5; // Return change and wait for new coins
                end
            end
            
            cent0c:
            begin
                coffee_nxt = 1'b1; // Coffee dispensed in cent0c state
                // Transition logic after dispensing coffee
                if(coins == 2'b01) // If 10 cents inserted
                begin
                    state_nxt = cent10; // Move to cent10 state (new transaction)
                end
                else if(coins == 2'b10) // If 5 cents inserted
                begin
                    state_nxt = cent5; // Move to cent5 state (new transaction)
                end
                else if(coins == 2'b00) // No coin inserted
                begin
                    state_nxt = cent0; // No action, wait for new coins
                end
            end
            
            default:
            begin
                coffee_nxt = 1'b0; // Default behavior, no coffee dispensed
                state_nxt  = cent0; // Return to initial state
            end
        endcase
    end
    
    // Assign the current coffee output to the module output
    assign coffee = coffee_nxt;
    
endmodule