module Moore (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
	input  wire [1:0] coins,
	output reg  [0:0] coffee
    );

    // State Definitions
    localparam
	st_cent0   = 0,
	st_cent5   = 1,
	st_cent10  = 2,
	st_cent5c  = 3,
	st_cent0c  = 4;

	// Bit Definitions
	localparam
	LOW   = 1'b0,
	HIGH  = 1'b1;

	// Memory Definitions
	reg [2:0] state;
	/*
		This FSM does not depend on the 'update' line, so the state is updated every clock cycle instead.
	*/


	// State Logic
	always @(posedge clk) begin
		case(state)
			st_cent0: begin
				if(coins == 2'b01) begin
					state <= st_cent10;
				end
				if(coins == 2'b10) begin
					state <= st_cent5;
				end
			end
			st_cent5: begin
				if(coins == 2'b01) begin
					state <= st_cent0c;
				end
				if(coins == 2'b10) begin
					state <= st_cent10;
				end
			end
			st_cent10: begin
				if(coins == 2'b01) begin
					state <= st_cent5c;
				end
				if(coins == 2'b10) begin
					state <= st_cent0c;
				end
			end
			st_cent5c: begin
				if(coins == 2'b00) begin
					state <= st_cent5;
				end
				if(coins == 2'b01) begin
					state <= st_cent0c;
				end
				if(coins == 2'b10) begin
					state <= st_cent10;
				end
			end
			st_cent0c: begin
				if(coins == 2'b00) begin
					state <= st_cent0;
				end
				if(coins == 2'b01) begin
					state <= st_cent10;
				end
				if(coins == 2'b10) begin
				    state <= st_cent5;
				end
			end
		endcase

	    if (reset == HIGH) begin
	        state <= st_cent0;
	    end
	end

	// Write Output Depending On State
	always @(*) begin
	    case(state)
	        st_cent5c: begin
	            coffee = HIGH;
	        end
	        st_cent0c: begin
	            coffee = HIGH;
	        end
	        default: begin
				coffee = LOW;
	        end
	    endcase
	end

endmodule
