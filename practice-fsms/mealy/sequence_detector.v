`timescale 1ns / 100ps

module sequence_detector (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
	input  wire [0:0] value, //input
	output reg  [0:0] sequence_detected //output
    );

    /* Define state paramaters */
    localparam
	S0 = 0,
	S1 = 1,
	S2 = 2,
	S3 = 3;

	localparam
	LOW = 1'b0,
	HIGH = 1'b1;
    
    /* Internal state registers */
    reg [1:0] state;
    reg [1:0] next_state;
	reg [0:0] update_prev;
	reg [0:0] sequence_detected_next;
    
    /* Clock Logic */
    always @(posedge clk) begin
        if(reset == HIGH) begin
            state <= S0;
			update_prev <= LOW;
			sequence_detected <= LOW;
        end 
		else begin
			update_prev <= update;
			if (update == HIGH && update_prev == LOW) begin
				state <= next_state;
				sequence_detected <= sequence_detected_next;
			end
        end
    end
    
    always @(*) begin
        next_state = state;
		sequence_detected_next = sequence_detected;     
		case (state)
			S0: begin
				if (value == LOW) begin
					next_state = S0;
					sequence_detected_next = LOW;
				end
				if (value == HIGH) begin
					next_state = S1;
					sequence_detected_next = LOW;
				end
			end
			S1: begin
				if (value == LOW) begin
					next_state = S2;
					sequence_detected_next = LOW;
				end 
				if (value == HIGH) begin
					next_state = S1;
					sequence_detected_next = LOW;
				end
			end
			S2: begin
				if (value == LOW) begin
					next_state = S0;
					sequence_detected_next = LOW;
				end 
				if (value == HIGH) begin
					next_state = S3;
					sequence_detected_next = LOW;
				end
			end
			S3: begin
				if (value == LOW) begin
					next_state = S2;
					sequence_detected_next = LOW;
				end 
				if (value == HIGH) begin
					next_state = S1;
					sequence_detected_next = HIGH;
				end
			end            
		endcase
	end
endmodule
