`timescale 1ns / 100ps

module edge_detector (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
	input  wire [0:0] level,
	output reg  [0:0] tick
    );

    localparam
    one         = 0,
    zero        = 1,
    rising_edge = 2;

    localparam
    LOW  = 1'b0,
    HIGH = 1'b1;

    reg [1:0] state;

    always @(*) begin
        case (state)
            rising_edge: begin
                tick = HIGH;
            end
            default: begin
                tick = LOW;
            end
        endcase
    end

    always @(posedge clk) begin
        if (update == HIGH) begin
            case(state)
                one: begin
                    if (level == LOW) begin
                        state <= zero;
                    end
                end
                zero: begin
                    if (level == HIGH) begin
                        state <= rising_edge;
                    end
                end
                rising_edge: begin
                    if (level == HIGH) begin
                        state <= one;
                    end 
                    if (level == LOW) begin
                        state <= zero;
                    end
                end
            endcase
        end
        if (reset == HIGH) begin
            state <= one;
        end
    end
endmodule

// same but mealy
`timescale 1ns / 100ps

module edge_detector (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
    input  wire [0:0] level,
    output reg  [0:0] tick
    );

    // State Parameters
    localparam
	one         = 0,
	zero        = 1,
	rising_edge = 2;
	
	// Bit Definitions
	localparam
	LOW   = 1'b0,
	HIGH  = 1'b1;

    // Memory Registers
    reg [1:0] state;
    reg [1:0] next_state;

    // Clock Logic
    always @(posedge clk) begin
        if(reset == HIGH) begin
            state <= zero;
        end else begin
            state <= next_state;
        end
    end

    // State logic
    always @(*) begin
        next_state = state;
        if(update ==  HIGH) begin
            case (state)
		        one: begin
			        if (level == LOW) begin
				        next_state = zero;
			        end
		        end
		        zero: begin
			        if (level == HIGH) begin
				        next_state = rising_edge;
			        end
		        end
		        rising_edge: begin
			        if (level == HIGH) begin
				        next_state = one;
			        end
			        if (level == LOW) begin
				        next_state = zero;
			        end
		        end
            endcase
        end

        case (state)
		    rising_edge: begin
			    tick = HIGH;
		    end
		    default: begin
			    tick = LOW;
		    end
        endcase
    end

endmodule


// why does this not work:
    // always @(*) begin
    //     next_state = state;
    //     tick = LOW;
    //     if(update ==  HIGH) begin
    //         case (state)
	// 	        one: begin
	// 		        if (level == LOW) begin
	// 			        next_state = zero;
	// 		        end
	// 	        end
	// 	        zero: begin
	// 		        if (level == HIGH) begin
	// 			        next_state = rising_edge;
	// 		        end
	// 	        end
	// 	        rising_edge: begin
	// 		        if (level == HIGH) begin
	// 			        next_state = one;
	// 		        end
	// 		        if (level == LOW) begin
	// 			        next_state = zero;
	// 		        end
    // 		        tick = HIGH;
	// 	        end
    //         endcase
    //     end
    // end