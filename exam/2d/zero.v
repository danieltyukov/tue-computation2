// in   :     0 0 1 0 1 1 0 1 1 1 0 1 0 ...
// out  :     0 0 0 1 0 0 0 0 0 0 0 0 1 ...

module zero (
    input wire [0:0] clk,
    input wire [0:0] reset,
    input wire [0:0] in,

    output reg [0:0] out
    );

    localparam
    START = 0,
    FIRST0 = 1,
    SECOND0 = 2,
    THIRD0 = 3;

    localparam
    LOW = 1'b0,
    HIGH = 1'b1;

    reg [1:0] state;
    reg [1:0] state_next;

    always @(posedge clk) begin
        if (reset == HIGH) begin
            state <= START;
        end
        else begin
            state <= state_next;
        end
    end

    always @(*) begin
        state_next = state;
        case (state)
            START: begin
                if (in == HIGH) begin
                    state_next = START;
                    out = LOW;
                end
                if (in == LOW) begin
                    state_next = FIRST0;
                    out = LOW;
                end
            end
            FIRST0: begin
                if (in == HIGH) begin
                    state_next = FIRST0;
                    out = LOW;
                end
                if (in == LOW) begin
                    state_next = SECOND0;
                    out = LOW;
                end
            end
            SECOND0: begin
                if (in == HIGH) begin
                    state_next = SECOND0;
                    out = LOW;
                end
                if (in == LOW) begin
                    state_next = THIRD0;
                    out = HIGH;
                end
            end
            THIRD0: begin
                if (in == HIGH) begin
                    state_next = START;
                    out = LOW;
                end
                if (in == LOW) begin
                    state_next = FIRST0;
                    out = LOW;
                end
            end
            default: begin
                state_next = START;
                out = LOW;
            end
        endcase
    end
endmodule
