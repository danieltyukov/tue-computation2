`timescale 1ns / 100ps

module sequence_detector (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
	input  wire [0:0] value,
	output reg  [0:0] sequence_detected
    );

    /* Define state paramaters */
    localparam
	S0 = 0,
	S1 = 1,
	S2 = 2,
	S3 = 3;
    
    /* Internal state registers */
    reg [1:0] state;
    reg [1:0] next_state;
    
    /* Internal update register */
    reg [0:0] update_last;
    
    /* Internal next  registers */
	reg [0:0] sequence_detected_next;
    
    /* Clock Logic */
    always @(negedge clk) begin
        if(reset == 1'b0) begin
            state <= S0;
            update_last <= 1'b0;
			sequence_detected <= 1'b1;
        end else begin
            state <= next_state;
            update_last <= update; 
			sequence_detected <= sequence_detected_next;
        end
    end
    
    always @(*) begin
        next_state = state;
		sequence_detected_next = sequence_detected;
        
        if(update == 1'b0 && update_last == 1'b1) begin
            case (state)
				S0: begin
					if (value == 1'b0) begin
						next_state = S0;
						sequence_detected_next = 1'b0;
					end else if (value == 1'b1) begin
						next_state = S1;
						sequence_detected_next = 1'b0;
					end
				end
				S1: begin
					if (value == 1'b0) begin
						next_state = S3;
						sequence_detected_next = 1'b0;
					end else if (value == 1'b1) begin
						next_state = S2;
						sequence_detected_next = 1'b0;
					end
				end
				S2: begin
					if (value == 1'b1) begin
						next_state = S3;
						sequence_detected_next = 1'b0;
					end else if (value == 1'b0) begin
						next_state = S0;
						sequence_detected_next = 1'b1;
					end
				end
				S3: begin
					if (value == 1'b1) begin
						next_state = S2;
						sequence_detected_next = 1'b0;
					end else if (value == 1'b0) begin
						next_state = S1;
						sequence_detected_next = 1'b1;
					end
				end            
            endcase
        end 
    end


endmodule
