`timescale 1ns / 100ps

// This is a buggy implementation of the combination lock FSM. Fix the bugs and make it pass the testbench!

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
    
    /* Internal state registers */
    reg [2:0] state;
    reg [2:0] next_state;
    
    /* Internal update register */
    reg [0:0] update_last;
    
    /* Clock Logic */
    always @(negedge clk) begin
        if(reset == 1'b1) begin
            state <= st_reset;
            update_last <= 1'b0;
        end else begin
            state <= next_state;
            update_last <= update;       
        end
    end
    
    always @(*) begin
        next_state = state;
        
        if(update == 1'b0 && update_last == 1'b1) begin
            case (state)
		st_reset: begin
			if (key == 1'b0) begin
				next_state = st_0;
			end
		end
		st_0: begin
			if (key == 1'b1) begin
				next_state = st_01;
			end
		end
		st_01: begin
			if (key == 1'b1) begin
				next_state = st_reset;
			end else if (key == 1'b0) begin
				next_state = st_010;
			end
		end
		st_010: begin
			if (key == 1'b1) begin
				next_state = st_0;
			end else if (key == 1'b0) begin
				next_state = st_0101;
			end
		end
		st_0101: begin
			if (key == 1'b0) begin
				next_state = st_010;
			end else if (key == 1'b1) begin
				next_state = st_01011;
			end
		end
		st_01011: begin
			if (key == 1'b0) begin
				next_state = st_0;
			end else if (key == 1'b1) begin
				next_state = st_reset;
			end
		end            
            endcase
        end 
        
        case (state)
		st_0101: begin
			unlock = 1'b1;
		end
		default: begin
			unlock = 1'b0;
		end        
        endcase
    end
    
endmodule
