module Mealy (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
	input  wire [1:0] coins,
	output reg  [0:0] coffee
    );

    // State Definitions
    localparam
	st_cent0   = 0,
	st_cent10  = 1,
	st_cent5   = 2;

	// Bit Definitions
	localparam
	LOW   = 1'b0,
	HIGH  = 1'b1;

	// Memory Definitions
	reg [1:0] state;
	reg [1:0] state_next;
	reg [0:0] coffee_next;

	// Clock Timer
	always @(posedge clk) begin
		if(reset == HIGH) begin
            state <= st_cent0;
			coffee <= LOW;
        end 
		else begin
            state <= state_next;
			coffee <= coffee_next;
        end
	end

	always @(*) begin
		state_next = state;
		coffee_next = coffee;
		case(state)
			st_cent0: begin
				if(coins == st_cent0) begin
					state_next = st_cent0;
					coffee_next = LOW;
				end
				if(coins == st_cent5) begin
					state_next = st_cent5;
					coffee_next = LOW;
				end
				if(coins == st_cent10) begin
					state_next = st_cent10;
					coffee_next = LOW;
				end
			end
			st_cent5: begin
				if(coins == st_cent0) begin
					state_next = st_cent5;
					coffee_next = LOW;
				end
				if(coins == st_cent5) begin
					state_next = st_cent10;
					coffee_next = LOW;
				end
				if(coins == st_cent10) begin
					state_next = st_cent0;
					coffee_next = HIGH;
				end
			end
			st_cent10: begin
				if(coins == st_cent0) begin
					state_next = st_cent10;
					coffee_next = LOW;
				end
				if(coins == st_cent5) begin
					state_next = st_cent0;
					coffee_next = HIGH;
				end
				if(coins == st_cent10) begin
					state_next = st_cent5;
					coffee_next = HIGH;
				end
			end
		endcase
	end
endmodule
