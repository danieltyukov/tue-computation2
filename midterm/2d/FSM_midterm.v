module seq_top(

input in,
input clk,
input reset,
input next,
output wire out,

output wire [2:0] state_display

);

parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6;

reg prev_next;

reg [2:0] state, next_state;


always@(posedge clk)begin

    if(reset==1)begin
        prev_next<=0;
        state<=S0;
    end
    
    else begin
        state<=next_state;
        prev_next<=next;
    end
end

always@(*)begin


    next_state=state;
    
    if(~prev_next&& next)begin
        case(state)
        
        S0:if(in==0)begin
                next_state=S1;
            end
            
            else if(in==1)begin
                next_state=S4;
            end
            
            else begin
                next_state=S0;
            end
        
        S1: if(in==0)begin
                next_state=S1;
            end
            
            else if (in==1)begin
                next_state=S2;
            end
            
            else begin
                next_state=S1;
            end
        
        S2: if(in==0)begin
                next_state=S3;
            end
            
            else if (in==1)begin
                next_state=S4;
            end
            
            else begin
                next_state=S2;
            end
        
        S3: if(in==0)begin
                next_state=S6;
            end
            
            else if (in==1)begin
                next_state=S2;
            end
            
            else begin
                next_state=S3;
            end
        
        S4: if(in==0)begin
                next_state=S5;
            end
            
            else if (in==1)begin
                next_state=S4;
            end
            
            else begin
                next_state=S4;
            end
        
        S5:if(in==0)begin
                next_state=S6;
            end
            
            else if (in==1)begin
                next_state=S2;
            end
            
            else begin
                next_state=S5;
            end
        
        S6:if(in==0)begin
                next_state=S6;
            end
            
            else if (in==1)begin
                next_state=S6;
            end
            
            else begin
                next_state=S6;
            end
        
        default:next_state=S0;
        endcase
    end
    else begin
        next_state=state;
    end
    
end

assign out=(state==S3)?1:0;

assign state_display=state;

endmodule
