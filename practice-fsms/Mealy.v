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

	// Clock Timer
	always @(posedge clk) begin
		if(reset == 1'b1) begin
            state <= st_cent0;
        end else begin
            state <= next_state;
        end
	end

	//  the output changes immediately when coins changes. no waiting for clock
	always @(*) begin
		next_state = state;
		coffee = LOW;
		case(state)
			st_cent0: begin
				if(coins == 2'b00) begin
					next_state = st_cent0;
				end
				if(coins == 2'b10) begin
					next_state = st_cent5;
				end
				if(coins == 2'b01) begin
					next_state = st_cent10;
				end
			end
			st_cent5: begin
				if(coins == 2'b00) begin
					next_state = st_cent5;
				end
				if(coins == 2'b01) begin
					next_state = st_cent0;
					coffee = HIGH;
				end
				if(coins == 2'b10) begin
					next_state = st_cent10;
				end
			end
			st_cent10: begin
				if(coins == 2'b00) begin
					next_state = st_cent10;
				end
				if(coins == 2'b01) begin
					next_state = st_cent5;
					coffee = HIGH;
				end
				if(coins == 2'b10) begin
					next_state = st_cent0;
					coffee = HIGH;
				end
			end
		endcase
	end
endmodule
