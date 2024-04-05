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
    
    always @(*) begin
		case(state)
			st_01011: begin
				unlock = HIGH;
			end
			default: begin
				unlock = LOW;
			end
		endcase
    end
    
    always @(posedge clk) begin        
        if(update == HIGH) begin
			case (state)
				st_reset: begin
					if (key == LOW) begin
						state <= st_0;
					end
				end
				st_0: begin
					if (key == HIGH) begin
						state <= st_01;
					end
				end
				st_01: begin
					if (key == HIGH) begin
						state <= st_reset;
					end
					if (key == LOW) begin
						state <= st_010;
					end
				end
				st_010: begin
					if (key == HIGH) begin
						state <= st_0101;
					end 
					if (key == LOW) begin
						state <= st_0;
					end
				end
				st_0101: begin
					if (key == LOW) begin
						state <= st_010;
					end 
					if (key == HIGH) begin
						state <= st_01011;
					end
				end
				st_01011: begin
					if (key == LOW) begin
						state <= st_0;
					end 
					if (key == HIGH) begin
						state <= st_reset;
					end
				end            
            endcase
        end
		if (reset == HIGH) begin
			state <= st_reset;
		end
    end
endmodule
