`timescale 1ns / 1ps


module atm_top(clk,cancel,next,pin,cash_in,success,cash_out,state_display);

input clk, cancel, next; // Assume synchronous cancel;
input [15:0] pin;
input [13:0] cash_in;
output success;
output [13:0] cash_out;
output [2:0] state_display;

parameter S_SCAN_CARD = 0; 
parameter S_CHECK_PIN = 1; // state assignments
parameter S_WITHDRAW_AMT = 2; 
parameter S_VERIFY_BALANCE = 3;
parameter S_DISPENSE_CASH = 4; 

reg [15:0] ACCOUNT_PIN = 16'h9953;
reg [13:0] ACCOUNT_BALANCE = 14'd5000;
reg [13:0] ATM_OUT_LIMIT = 14'd10000;

always @(posedge clk) begin
	ACCOUNT_PIN <= ACCOUNT_PIN;
	ACCOUNT_BALANCE <= ACCOUNT_BALANCE;
	ATM_OUT_LIMIT <= ATM_OUT_LIMIT;
end

reg [2:0] curr_state,next_state; 
reg next_reg1, next_reg2;
wire next_reg;

always @(posedge clk) begin
    next_reg1 <= next;
    next_reg2 <= next_reg1;
end
    
assign next_reg = next_reg1 && !next_reg2;

always @(*) begin // implement state transition diagram
if (cancel) begin 
	next_state = S_SCAN_CARD;
	end
else case (curr_state)
S_SCAN_CARD: next_state = (next_reg == 1'b1) ? S_CHECK_PIN : curr_state;
S_CHECK_PIN: next_state = (next_reg == 1'b1) ? S_WITHDRAW_AMT : curr_state;
S_WITHDRAW_AMT: next_state = (next_reg == 1'b1) ? S_VERIFY_BALANCE : curr_state ;		
S_VERIFY_BALANCE: next_state = (next_reg == 1'b1) ? S_DISPENSE_CASH : (next_reg == 1'b1) ? S_SCAN_CARD : curr_state;
S_DISPENSE_CASH: next_state = (next_reg == 1'b1) ? S_SCAN_CARD : curr_state;
default: next_state = S_SCAN_CARD; // handle unused states
endcase
end

always @ (posedge clk) curr_state <= next_state;

assign success = (curr_state == S_DISPENSE_CASH); // assign output: Moore machine
assign cash_out = (curr_state == S_DISPENSE_CASH) ? cash_in : 14'd0;
assign state_display = curr_state; // debugging

endmodule