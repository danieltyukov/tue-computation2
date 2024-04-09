

module atm_top(

    input wire [0:0]clk,
    input wire [0:0] cancel,
    input wire [0:0]next,
    input wire [13:0]cash_in,
    input wire [15:0]pin,
    
    output reg [0:0] success,
    output reg [13:0] cash_out,
    output reg [2:0] state_display // CHECK OUT THE VARIABLES
);

    reg [2:0]state=0,next_state;
    
    reg [0:0]prev_next=0;
    
    localparam SCAN_CARD=0,CHECK_PIN=1,WITHDRAW_AMT=2,VERIFY_BALANCE=3,DISPENSE_CASH=4;
    
    wire [15:0] ACCOUNT_PIN=16'b001001000110100;
    
    wire [13:0] ACCOUNT_BALANCE=3000;
    
    wire [13:0] ATM_OUT_LIMIT=7000;
    
    reg [13:0]saved_cash_in=0;
    
    
    
    always @(posedge clk)begin
    
        if(cancel==1)begin
            state<=SCAN_CARD;
            prev_next<=0;
        end
        else begin
            state<=next_state;
            prev_next<=next;
        end
        
        if(state==WITHDRAW_AMT)begin
        saved_cash_in<=cash_in;
        end
    
    end
    
    always@(*)begin
    
        next_state=state;
        
        if(next==1&&prev_next==0)begin
            case(state)
                
                SCAN_CARD:next_state=CHECK_PIN;
                
                CHECK_PIN: if(pin==ACCOUNT_PIN)begin
                                next_state=WITHDRAW_AMT;
                           end
                           
                           else begin
                                next_state=CHECK_PIN;
                           end
                
                WITHDRAW_AMT: begin
                
                          if (cash_in>ATM_OUT_LIMIT)begin
                                next_state=WITHDRAW_AMT;
                          end
                          else begin
                                //saved_cash_in=cash_in;
                                next_state=VERIFY_BALANCE;
                          end
                 end
                
                VERIFY_BALANCE: if (saved_cash_in>ACCOUNT_BALANCE) begin
                                    next_state=SCAN_CARD;
                                end
                                
                                else begin
                                next_state=DISPENSE_CASH;
                                end
                
                DISPENSE_CASH: next_state=SCAN_CARD; 
                
                default:next_state=SCAN_CARD;
            endcase
            
            
        
        end
        state_display=state;
        
        success=(state==DISPENSE_CASH)?1:0;
        
        
        cash_out=(state==DISPENSE_CASH)?saved_cash_in:0;
    end
    

endmodule





