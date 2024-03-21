`timescale 1ns / 1ps

module debounce(
    input wire clk, // Clock input
    input wire reset, // Reset input
    input wire button_in, // Input signal from the button
    output reg button_out // Debounced output signal
    );

    // Use a 20-bit register for the counter
    reg [19:0] counter = 0;
    // Register to hold the stable state of the button
    reg stable_state = 0;
    // Register to track the last read state of the button
    reg last_state = 0;

    always @(posedge clk) begin
        if (reset) begin
            // Reset the debounce logic
            counter <= 0;
            stable_state <= 0;
            button_out <= 0;
            last_state <= 0;
        end else if (button_in != last_state) begin
            // If the current state of the button differs from the last read state,
            // reset the counter and update the last_state
            counter <= 0;
            last_state <= button_in;
        end else if (counter < 20'hFFFFF) begin
            // Increment the counter until it reaches its maximum value
            counter <= counter + 1'b1;
            if (counter == 20'hFFFFE) begin
                // Once the counter is about to reach its maximum value,
                // consider the button state as stable and update the output and stable_state
                button_out <= button_in;
                stable_state <= button_in;
            end
        end
    end
endmodule
