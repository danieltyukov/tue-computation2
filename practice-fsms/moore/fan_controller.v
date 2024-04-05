`timescale 1ns / 100ps
// [down,up]
module fan_controller (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
	input  wire [0:0] down,
	input  wire [0:0] up,
	output reg  [1:0] speed
    );

    /* Define state paramaters */
    localparam
	stop   = 0,
	slow   = 1,
	med    = 2,
	fast   = 3;
    
    localparam
    LOW  = 1'b0,
    HIGH = 1'b1;

    reg [1:0] state;

    always @(*) begin
        case (state)
            stop: begin
                speed = 2'b00;
            end
            slow: begin
                speed = 2'b01;
            end
            med: begin
                speed = 2'b10;
            end
            fast: begin
                speed = 2'b11;
            end
            default: begin
                speed = 2'b00;
            end
        endcase
    end

    // State Logic
    always @(posedge clk) begin
        if (update == HIGH) begin
            case (state)
                stop: begin
                    if (down == LOW && up == HIGH) begin
                        state <= slow;
                    end
                end
                slow: begin
                    if (down == HIGH && up == LOW) begin
                        state <= stop;
                    end
                    if (down == HIGH && up == HIGH) begin
                        state <= stop;
                    end
                    if (down == LOW && up == HIGH) begin
                        state <= med;
                    end
                end
                med: begin
                    if (down == HIGH && up == LOW) begin
                        state <= slow;
                    end
                    if (down == HIGH && up == HIGH) begin
                        state <= stop;
                    end
                    if (down == LOW && up == HIGH) begin
                        state <= fast;
                    end
                end
                fast: begin
                    if (down == HIGH && up == LOW) begin
                        state <= med;
                    end
                    if (down == HIGH && up == HIGH) begin
                        state <= stop;
                    end
                end
            endcase
        end
        if (reset == HIGH) begin
            state <= stop;
        end
    end
endmodule
