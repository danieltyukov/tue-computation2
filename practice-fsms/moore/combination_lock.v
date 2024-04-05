`timescale 1ns / 100ps

// FIXED

module combination_lock (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
    input  wire [0:0] key,
    output reg  [0:0] unlock
    );

    /* Define state paramaters */
    localparam
	st_reset = 0,
	st_0     = 1,
	st_01    = 2,
	st_010   = 3,
	st_0101  = 4,
	st_01011 = 5;

	// Bit Definitions
	localparam
	LOW   = 1'b0,
	HIGH  = 1'b1;
    
    /* Internal state registers */
    reg [2:0] state;
	reg [2:0] state_next;
	reg [0:0] update_prev;
    
    always @(posedge clk) begin
		if (reset == HIGH) begin
			state <= st_reset;
			update_prev <= LOW;
		end
		else begin
			update_prev <= update;
			if (update == HIGH && update_prev == LOW) begin
				state <= state_next;
			end
		end
    end
    
    always @(*) begin
		state_next = state;
		case (state)
			st_reset: begin
				if (key == LOW) begin
					state_next = st_0;
				end
			end
			st_0: begin
				if (key == HIGH) begin
					state_next = st_01;
				end
			end
			st_01: begin
				if (key == HIGH) begin
					state_next = st_reset;
				end
				if (key == LOW) begin
					state_next = st_010;
				end
			end
			st_010: begin
				if (key == HIGH) begin
					state_next = st_0101;
				end 
				if (key == LOW) begin
					state_next = st_0;
				end
			end
			st_0101: begin
				if (key == LOW) begin
					state_next = st_010;
				end 
				if (key == HIGH) begin
					state_next = st_01011;
				end
			end
			st_01011: begin
				if (key == LOW) begin
					state_next = st_0;
				end 
				if (key == HIGH) begin
					state_next = st_reset;
				end
			end            
		endcase
		case(state)
			st_01011: begin
				unlock = HIGH;
			end
			default: begin
				unlock = LOW;
			end
		endcase
	end
endmodule
