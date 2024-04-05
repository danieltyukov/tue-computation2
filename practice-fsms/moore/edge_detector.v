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
    reg [1:0] state_next;
    reg [0:0] update_prev;

    always @(posedge clk) begin
        if (reset == HIGH) begin
            state <= one;
            update_prev <= LOW;
        end
        else begin
            update_prev <= update;
            if (update == HIGH && update_prev == LOW) begin
                state <= state_next;
            end
        end
    end

    always @(*) begin
        state_next = state;
        case(state)
            one: begin
                if (level == LOW) begin
                    state_next = zero;
                end
            end
            zero: begin
                if (level == HIGH) begin
                    state_next = rising_edge;
                end
            end
            rising_edge: begin
                if (level == HIGH) begin
                    state_next = one;
                end 
                if (level == LOW) begin
                    state_next = zero;
                end
            end
        endcase
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
