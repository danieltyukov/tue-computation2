`timescale 1ns / 100ps

module fan_controller (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
	input  wire [0:0] down,
	input  wire [0:0] up,
	output reg  [1:0] speed
    );

    /* Define state paramaters */
    localparam
	stop   = 0,
	slow   = 1,
	med    = 2,
	fast   = 3;
    
    localparam
    LOW  = 1'b0,
    HIGH = 1'b1;

    reg [1:0] state;
    reg [1:0] state_next;

    always @(posedge clk) begin
        if (reset == HIGH) begin
            state <= stop;
        end
        else begin
			state <= state_next;
        end
    end

	// State Logic
    always @(*) begin
        state_next = state;
        case (state)
            stop: begin
                if (down == LOW && up == HIGH) begin
                    state_next = slow;
                end
            end
            slow: begin
                if (down == HIGH && up == LOW) begin
                    state_next = stop;
                end
                if (down == HIGH && up == HIGH) begin
                    state_next = stop;
                end
                if (down == LOW && up == HIGH) begin
                    state_next = med;
                end
            end
            med: begin
                if (down == HIGH && up == LOW) begin
                    state_next = slow;
                end
                if (down == HIGH && up == HIGH) begin
                    state_next = stop;
                end
                if (down == LOW && up == HIGH) begin
                    state_next = fast;
                end
            end
            fast: begin
                if (down == HIGH && up == LOW) begin
                    state_next = med;
                end
                if (down == HIGH && up == HIGH) begin
                    state_next = stop;
                end
            end
        endcase
        case (state)
            stop: begin
                speed = stop;
            end
            slow: begin
                speed = slow;
            end
            med: begin
                speed = med;
            end
            fast: begin
                speed = fast;
            end
        endcase 
    end

endmodule
