module ccu (
    input  clk,
    input  reset,
    input  proceed,
    output green_walk,
    output orange_walk,
    output red_hand,
    output [1:0] multiplier,
    output tr
);

reg [1:0] multiplier_next,multiplier_current,next_state,current_state;
reg green_walk_next, green_walk_current, orange_walk_next, orange_walk_current, red_hand_next, red_hand_current,tr_next,tr_current;

always @(posedge clk)
begin
    if(reset)
    begin
        tr_current<=1;
        multiplier_current<=1;
        green_walk_current<=1;
        orange_walk_current<=0;
        red_hand_current<=0;
        current_state<=0;
    end
    else
    begin
        tr_current<=tr_next;
        multiplier_current<=multiplier_next;
        green_walk_current<=green_walk_next;
        orange_walk_current<=orange_walk_next;
        red_hand_current<=red_hand_next;
        current_state<=next_state;
    end
end

always @(*)
begin
        tr_next=tr_current;
        multiplier_next=multiplier_current;
        green_walk_next=green_walk_current;
        orange_walk_next=orange_walk_current;
        red_hand_next=red_hand_current;
        next_state=current_state;
        case(current_state)
        0:
        begin
            if(proceed)
            begin
                tr_next=1;
                multiplier_next=0;
                green_walk_next=0;
                orange_walk_next=1;
                red_hand_next=0;
                next_state=1;
            end
            else
            begin
                tr_next=0;
                multiplier_next=0;
                green_walk_next=1;
                orange_walk_next=0;
                red_hand_next=0;
                next_state=0;
            end
        end
        1:
        begin
            if(proceed)
            begin
                tr_next=1;
                multiplier_next=3;
                green_walk_next=0;
                orange_walk_next=0;
                red_hand_next=1;
                next_state=2;
            end
            else
            begin
                tr_next=0;
                multiplier_next=3;
                green_walk_next=0;
                orange_walk_next=1;
                red_hand_next=0;
                next_state=1;
            end
        end
        2:
        begin
            if(proceed)
            begin
                tr_next=1;
                multiplier_next=1;
                green_walk_next=1;
                orange_walk_next=0;
                red_hand_next=0;
                next_state=0;
            end
            else
            begin
                tr_next=0;
                multiplier_next=1;
                green_walk_next=0;
                orange_walk_next=0;
                red_hand_next=1;
                next_state=2;
            end
        end
        default:
        begin
            tr_next=1;
            multiplier_next=1;
            green_walk_next=1;
            orange_walk_next=0;
            red_hand_next=0;
            next_state=0;
        end
        endcase
end

assign green_walk=green_walk_current;
assign orange_walk=orange_walk_current;
assign red_hand=red_hand_current;
assign multiplier=multiplier_current;
assign tr=tr_current;

endmodule
