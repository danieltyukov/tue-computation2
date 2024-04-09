// all input output 1 bit
// state_display 3 bit
// input: clk, reset, in, next
// output: out, state_display

`timescale 1ns / 1ps

module seq_top(
    input wire [0:0] clk,
    input wire [0:0] reset,
    input wire [0:0] in,
    input wire [0:0] next,

    output reg [0:0] out,
    output reg [2:0] state_display
    );

    // state defintions
    localparam
    S0 = 0,
    S1 = 1,
    S2 = 2,
    S3 = 3,
    S4 = 4,
    S5 = 5,
    S6 = 6;

    // defitnions
    localparam
    LOW = 1'b0,
    HIGH = 1'b1;

    // state control
    reg [2:0] state;
    reg [2:0] state_next;
    reg [0:0] next_prev;

    always @(posedge clk) begin
        if (reset == HIGH) begin
            state <= S0;
            next_prev <= LOW;
        end
        else begin
            if (next == HIGH && next_prev == LOW) begin
                state <= state_next;
            end
            next_prev <= next;
        end
    end

    // state logic
    always @(*) begin
        state_next = state;
        case (state)
            S0: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S1;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S4;
                end
            end
            S1: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S1;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S2;
                end
            end
            S2: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S3;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S4;
                end
            end
            S3: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S6;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S2;
                end
            end
            S4: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S5;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S4;
                end
            end
            S5: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S6;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S2;
                end
            end
            S6: begin
                if (next == HIGH && in == LOW) begin
                    state_next = S6;
                end
                if (next == HIGH && in == HIGH) begin
                    state_next = S6;
                end
            end
        endcase
        case (state)
            S0: begin
                out = LOW;
                state_display = S0;
            end
            S1: begin
                out = LOW;
                state_display = S1;
            end
            S2: begin
                out = LOW;
                state_display = S2;
            end
            S3: begin
                out = HIGH;
                state_display = S3;
            end
            S4: begin
                out = LOW;
                state_display = S4;
            end
            S5: begin
                out = LOW;
                state_display = S5;
            end
            S6: begin
                out = LOW;
                state_display = S6;
            end
        endcase
    end
endmodule
