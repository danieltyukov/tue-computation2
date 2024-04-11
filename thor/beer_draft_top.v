`timescale 1ns / 1ps

module beer_draft_top(
  input wire [0:0] clk,
  input wire [0:0] reset,
  input wire [0:0] next,
  input wire [0:0] draft,
  input wire [1:0] beer_level,

  output reg [0:0] beer, 
  output reg [1:0] state_display
  );

  // states
  localparam
  s_off = 0,
  s_foam = 1,
  s_beer = 2;

  localparam
  LOW = 1'b0,
  HIGH = 1'b1;

  // memory
  reg [1:0] state;
  reg [1:0] state_next;
  reg [0:0] next_prev;

  always @(posedge clk) begin
    // reset on 1 means reset on 0
    if (reset == HIGH) begin
        state <= s_off;
        next_prev <= LOW;
    end
    else begin
      if (next == HIGH && next_prev == LOW) begin
        state <= state_next;
      end
      next_prev <= next;
    end
  end

  always @(*) begin
    state_next = state;
    case (state)
      s_off: begin
        if (draft == HIGH && beer_level == 0) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 0) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 1) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 2) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 3) begin
          state_next = s_off;
        end

        if (draft == HIGH && beer_level == 1) begin
          state_next = s_foam;
        end
        if (draft == HIGH && beer_level == 2) begin
          state_next = s_foam;
        end
        if (draft == HIGH && beer_level == 3) begin
          state_next = s_foam;
        end
      end
      s_foam: begin
        if (draft == HIGH && beer_level == 1) begin
          state_next = s_foam;
        end
        if (draft == HIGH && beer_level == 3) begin
          state_next = s_foam;
        end

        if (draft == HIGH && beer_level == 2) begin
          state_next = s_beer;
        end

        if (draft == HIGH && beer_level == 0) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 0) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 1) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 2) begin
          state_next = s_off;
        end
        if (draft == LOW && beer_level == 3) begin
          state_next = s_off;
        end
      end
      s_beer: begin
        if (draft == HIGH && beer_level == 2) begin
          state_next = s_beer;
        end

        if (draft == LOW && beer_level == 1) begin
          state_next = s_foam;
        end
        if (draft == LOW && beer_level == 2) begin
          state_next = s_foam;
        end
        if (draft == HIGH && beer_level == 1) begin
          state_next = s_foam;
        end
      end
    endcase
    case (state)
      s_off: begin
        state_display = s_off;
        beer = LOW;
      end
      s_foam: begin
        state_display = s_foam;
        beer = LOW;
      end
      s_beer: begin
        state_display = s_beer;
        beer = HIGH;
      end
    endcase
  end
endmodule
