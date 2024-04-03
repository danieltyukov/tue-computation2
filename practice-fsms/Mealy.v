module Mealy (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
	input  wire [1:0] coins,
	output reg  [0:0] coffee
    );

    // State Definitions
    localparam
	st_cent0   = 0,
	st_cent5   = 1,
	st_cent10  = 2;

	// Bit Definitions
	localparam
	LOW   = 1'b0,
	HIGH  = 1'b1;

	// Memory Definitions
	reg [1:0] state;
	reg [1:0] next_state;
	reg [0:0] coffee_next;

	// Clock Timer
	always @(posedge clk) begin
		if(reset == 1'b1) begin
            state <= st_cent0;
			coffee <= LOW;
        end else begin
            state <= next_state;
			coffee <= coffee_next;
        end
	end

	/*
	THIS IMPLEMENTATION DOES NOT WORK ON ONCOURSE RIGHT NOW
	It should work as it is functionally identical to the Moore implementation, and the output of the reference model does match in the debugger.
	Except the evaluation fails for some unknown reason.
	*/

	// State Implementation
	always @(*) begin
		next_state = state;
		coffee_next = coffee;
		case(state)
			st_cent0: begin
				if(coins == 2'b00) begin
					next_state = st_cent0;
					coffee_next = LOW;
				end
				if(coins == 2'b10) begin
					next_state = st_cent5;
					coffee_next = LOW;
				end
				if(coins == 2'b01) begin
					next_state = st_cent10;
					coffee_next = LOW;
				end
			end
			st_cent5: begin
				if(coins == 2'b00) begin
					next_state = st_cent5;
					coffee_next = LOW;
				end
				if(coins == 2'b01) begin
					next_state = st_cent0;
					coffee_next = HIGH;
				end
				if(coins == 2'b10) begin
					next_state = st_cent10;
				    coffee_next = LOW;
				end
			end
			st_cent10: begin
				if(coins == 2'b00) begin
					next_state = st_cent10;
					coffee_next = LOW;
				end
				if(coins == 2'b01) begin
					next_state = st_cent5;
					coffee_next = HIGH;
				end
				if(coins == 2'b10) begin
					next_state = st_cent0;
					coffee_next = HIGH;
				end
			end
		endcase
	end
endmodule
