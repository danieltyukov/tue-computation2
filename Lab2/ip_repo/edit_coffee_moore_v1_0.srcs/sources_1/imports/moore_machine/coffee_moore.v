`timescale 1ns / 1ps

// Module definition for the Moore Coffee Machine
module coffee_moore(
    input clk, // Clock signal
    input insert, // Signal indicating coin insertion
    input reset, // Reset signal to initialize the machine state
    input [1:0] coins, // 2-bit input representing the value of the coin inserted (01 for 10c, 10 for 5c)
    output coffee, // Output signal to indicate coffee is ready
    output [2:0] state_display // 3-bit output representing the current state for debugging
);

// Internal registers for handling insert signal detection and coffee output
reg insert_previous;
reg insert_current; // To detect rising edge of insert signal
reg coffee_output; // Indicates whether coffee is ready

// State definition using local parameters for readability
localparam [2:0]
    zerocnoC = 3'b000, // Zero cents, no coffee
    fivecnoC = 3'b001, // Five cents, no coffee
    tencnoC = 3'b010, // Ten cents, no coffee
    zerocyesC = 3'b011, // Zero cents, coffee ready
    fivecyesC = 3'b100; // Five cents, coffee ready
    
// State registers to hold the current and next state of the FSM
reg[2:0] stateMoore_reg, stateMoore_next;

// Synchronous block to handle state transitions and reset
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset state to initial state and turn off coffee signal
        stateMoore_reg <= zerocnoC;
        coffee_output <= 1'b0;
    end else begin
        // Update state to the next calculated state
        stateMoore_reg <= stateMoore_next;
    end
end

// Combinatorial block to calculate the next state based on current state and inputs
always @(*) begin
    // Default behavior is to stay in the current state
    stateMoore_next = stateMoore_reg;
    insert_previous = insert_current;
    insert_current = insert;
    
    // Set coffee_output based on states that indicate coffee is ready
    coffee_output = (stateMoore_reg == zerocyesC || stateMoore_reg == fivecyesC);

    // Transition logic on rising edge of insert
    if (insert_current == 1'b1 && insert_previous == 1'b0) begin
        case (stateMoore_reg)
            // State transition logic based on current state and coin value
            zerocnoC:
                if (coins == 2'b01) stateMoore_next = tencnoC;
                else if (coins == 2'b10) stateMoore_next = fivecnoC;
            fivecnoC:
                if (coins == 2'b01) stateMoore_next = zerocyesC;
                else if (coins == 2'b10) stateMoore_next = tencnoC;
            tencnoC:
                if (coins == 2'b01) stateMoore_next = fivecyesC;
                else if (coins == 2'b10) stateMoore_next = zerocyesC;
            zerocyesC:
                // Transitions from coffee ready states depend on the inserted coin
                if (coins == 2'b01) stateMoore_next = tencnoC;
                else if (coins == 2'b10) stateMoore_next = fivecnoC;
                else stateMoore_next = zerocnoC;
            fivecyesC:
                if (coins == 2'b01) stateMoore_next = zerocyesC;
                else if (coins == 2'b10) stateMoore_next = tencnoC;
                else stateMoore_next = fivecnoC;
        endcase
    end
end

// Output assignments
assign coffee = coffee_output; // Connect internal coffee output signal to module output
assign state_display = stateMoore_reg; // Display current state for debugging purposes

endmodule
