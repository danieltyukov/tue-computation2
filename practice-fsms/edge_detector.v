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
        case(state)
            one: begin
                if (level == LOW && update == HIGH) begin
                    state <= zero;
                end
            end
            zero: begin
                if (level == HIGH && update == HIGH) begin
                    state <= rising_edge;
                end
            end
            rising_edge: begin
                if (level == HIGH && update == HIGH) begin
                    state <= one;
                end 
                if (level == LOW && update == HIGH) begin
                    state <= zero;
                end
            end
        endcase
        if (reset == HIGH) begin
            state <= zero;
        end
    end
endmodule
