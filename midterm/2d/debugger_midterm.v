
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

reg [15:0] ACCOUNT_PIN = 16'h9284;
reg [13:0] ACCOUNT_BALANCE = 14'd5000;
reg [13:0] ATM_OUT_LIMIT = 14'd10000;

reg [13:0] save_cash;



reg [2:0] state,next_state; 
reg prev_next;


always @(posedge clk) begin

    if (cancel==1) begin 
    	state <= S_SCAN_CARD;
    	prev_next<=0;
        save_cash<=0;

	end
	
	else begin
    	state<=next_state;
    	prev_next<=next;
	end

    if(state==S_WITHDRAW_AMT)begin
        save_cash<=cash_in;
    end
   
end
    

always @(*) begin // implement state transition diagram

    next_state=state;

    if(~prev_next&&next)begin
        case (state)
        S_SCAN_CARD: next_state = S_CHECK_PIN;
        
        // S_CHECK_PIN: next_state = (next_reg == 1'b1) ? S_WITHDRAW_AMT : state;
        
        S_CHECK_PIN: if(pin==ACCOUNT_PIN)begin
                            next_state=S_WITHDRAW_AMT;
                        end
                    else if (pin!=ACCOUNT_PIN) begin
                            next_state=S_CHECK_PIN;
                        end
                    else begin
                        next_state=S_CHECK_PIN;
                        end
        // S_WITHDRAW_AMT: next_state = (next_reg == 1'b1) ? S_VERIFY_BALANCE : state ;
        
        S_WITHDRAW_AMT:if(save_cash>ATM_OUT_LIMIT)begin
                            next_state=S_WITHDRAW_AMT;
                        end
                        
                        else if (save_cash<=ATM_OUT_LIMIT)begin
                            next_state=S_VERIFY_BALANCE;
                        end
                    else begin
                            next_state=S_WITHDRAW_AMT;
                        end
        
        // S_VERIFY_BALANCE: next_state = (next_reg == 1'b1) ? S_DISPENSE_CASH : (next_reg == 1'b1) ? S_SCAN_CARD : state;
        
        S_VERIFY_BALANCE: if(save_cash>ACCOUNT_BALANCE)begin
                            next_state=S_SCAN_CARD;
                        end
                        
                        else if(save_cash<=ACCOUNT_BALANCE)begin
                            next_state=S_DISPENSE_CASH;
                        end
                    else begin
                            next_state=S_VERIFY_BALANCE;
                        end
        
        S_DISPENSE_CASH: next_state = S_SCAN_CARD;
        
        default: next_state = S_SCAN_CARD; // handle unused states
        endcase
    end
    
    else begin
        next_state=state;
    end
end



assign success = (state == S_DISPENSE_CASH)?1:0; // assign output: Moore machine
assign cash_out = (state == S_DISPENSE_CASH) ? save_cash : 0;


assign state_display = state; // debugging

endmodule

