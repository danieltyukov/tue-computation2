`timescale 1ns / 1ps


module atm_top(
	input wire [0:0] clk,
	input wire [0:0] cancel,
	input wire [0:0] next,

	input wire [15:0] pin,
	input wire [13:0] cash_in,

	output reg [0:0] success,
	output reg [13:0] cash_out,
	output reg [2:0] state_display
	);

	// State Definitions
    localparam
	S_SCAN_CARD = 0, 
	S_CHECK_PIN = 1,
	S_WITHDRAW_AMT = 2, 
	S_VERIFY_BALANCE = 3,
	S_DISPENSE_CASH = 4;

    // Bit Definitions
    localparam
    LOW  = 1'b0,
    HIGH = 1'b1;

	// Statics
	reg [15:0] ACCOUNT_PIN = 16'h9284; // hexadecimal
	reg [13:0] ACCOUNT_BALANCE = 14'd5000; // decimal - preset account balance
	reg [13:0] ATM_OUT_LIMIT = 14'd10000; // limt to cash out

    // State Control
    reg [2:0] state;
    reg [2:0] state_next;
    reg [0:0] next_prev;

    always @(posedge clk) begin
        if (cancel == HIGH) begin
            state <= S_SCAN_CARD;
            next_prev <= LOW;
        end
        else begin
            next_prev <= next;
            if (next == HIGH && next_prev == LOW) begin
                state <= state_next;
            end
        end
    end

    // State Logic
    always @(*) begin
        state_next = state;
        case (state)
            S_SCAN_CARD: begin
                if (next == HIGH) begin
                    state_next = S_CHECK_PIN;
                end
            end
            S_CHECK_PIN: begin
                if (next == HIGH && pin == ACCOUNT_PIN) begin
                    state_next = S_WITHDRAW_AMT;
                end
                if (next == HIGH && pin != ACCOUNT_PIN) begin
                    state_next = S_CHECK_PIN;
                end
            end
            S_WITHDRAW_AMT: begin
                if (next == HIGH && cash_in <= ATM_OUT_LIMIT) begin
                    state_next = S_VERIFY_BALANCE;
                end
                if (next == HIGH && cash_in > ATM_OUT_LIMIT) begin
                    state_next = S_WITHDRAW_AMT;
                end
            end
            S_VERIFY_BALANCE: begin
                if (next == HIGH && cash_in > ACCOUNT_BALANCE) begin
                    state_next = S_SCAN_CARD;
                end
                if (next == HIGH && cash_in <= ACCOUNT_BALANCE) begin
                    state_next = S_DISPENSE_CASH;
                end
            end
            S_DISPENSE_CASH: begin
                if (next == HIGH) begin
                    state_next = S_SCAN_CARD;
                end
            end
            default begin
                state_next = S_SCAN_CARD;
            end
        endcase
        case (state)
            S_SCAN_CARD: begin
                success = LOW;
                cash_out = 14'd0;
                state_display = S_SCAN_CARD;
            end
            S_CHECK_PIN: begin
                success = LOW;
                cash_out = 14'd0;
                state_display = S_CHECK_PIN;
            end
            S_WITHDRAW_AMT: begin
                success = LOW;
                cash_out = 14'd0;
                state_display = S_WITHDRAW_AMT;
            end
            S_VERIFY_BALANCE: begin
                success = LOW;
                cash_out = 14'd0;
                state_display = S_VERIFY_BALANCE;
            end
            S_DISPENSE_CASH: begin
                success = HIGH;
                cash_out = cash_in;
                state_display = S_DISPENSE_CASH;
            end
        endcase
    end
endmodule
