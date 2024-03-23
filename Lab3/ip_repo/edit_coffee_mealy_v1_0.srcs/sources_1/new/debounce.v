`timescale 1ns / 1ps

module debounce(input clk,
                input reset,
                input button_in,
                output button_out);
    // Use a 20-bit register for the counter
    reg [19:0] counter = 0;
    // Register to hold the stable state of the button
    reg stable = 1;
    // Register to track the last read state of the button
    reg last_state = 0;
    reg out;
    
    always @(posedge clk) begin
        if (~reset) begin
            // Reset the debounce logic
            counter    <= 0;
            stable     <= 1;
            out <= 0;
            last_state <= 0;
        end
        else if (stable == 1) begin
            if (button_in != last_state) begin
                // If the current state of the button differs from the last read state
                // reset the counter and update the last_state
                counter    <= 0;
                last_state <= button_in;
                stable     <= 0;
            end
        end
        else begin
            // If the button state is stable, update the button_out
            if (counter[19] == 1) begin
                out <= last_state;
                stable     <= 1;
                counter    <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
    
    assign button_out = out;
endmodule