module ccu (
    input wire clk,
    input wire reset,
    input wire proceed,
    output reg green_walk,
    output reg orange_walk,
    output reg red_hand,
    output reg [1:0] multiplier,
    output reg tr
);
    
    reg [1:0] state;
    reg [1:0] next_state;
    
    reg next_green_walk;
    reg next_orange_walk;
    reg next_red_hand;
    reg [1:0] next_multiplier;
    reg next_tr;
    
    localparam
    walk = 0, //green
    caution = 1,
    hand = 2;
    
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            green_walk <= 1;
            orange_walk <= 0;
            red_hand <= 0;
            multiplier <= 2'b01;
            tr <= 1;
            state <= walk;
        end
        else begin
            state <= next_state;
            tr <= next_tr;
            green_walk <= next_green_walk;
            orange_walk <= next_orange_walk;
            red_hand <= next_red_hand;
            multiplier <= next_multiplier;
        end
    end
    
    always @(*) begin
        next_green_walk = green_walk;
        next_orange_walk = orange_walk;
        next_red_hand = red_hand;
        next_multiplier = multiplier;
        next_state = state;
        
        case(state)
            walk: begin
                if (proceed == 1'b1) begin
                    next_green_walk = 0;
                    next_orange_walk = 1;
                    next_red_hand = 0;
                    next_multiplier = 2'b00;
                    next_tr = 1'b1;
                    next_state = caution;
                end
                else if (proceed == 1'b0) begin
                    next_green_walk = 1;
                    next_orange_walk = 0;
                    next_red_hand = 0;
                    next_multiplier = 2'b00;
                    next_tr = 1'b0;
                    next_state = walk;
                end
            end
            caution: begin
                if (proceed == 1'b1) begin
                    next_green_walk = 0;
                    next_orange_walk = 0;
                    next_red_hand = 1;
                    next_multiplier = 2'b11;
                    next_tr = 1'b1;
                    next_state = hand;
                end
                else if (proceed == 1'b0) begin
                    next_green_walk = 0;
                    next_orange_walk = 1;
                    next_red_hand = 0;
                    next_multiplier = 2'b11;
                    next_tr = 1'b0;
                    next_state = caution;
                end
            end
            hand: begin
                if (proceed == 1'b1) begin
                    next_green_walk = 1;
                    next_orange_walk = 0;
                    next_red_hand = 0;
                    next_multiplier = 2'b01;
                    next_tr = 1'b1;
                    next_state = walk;
                end
                else if (proceed == 1'b0) begin
                    next_green_walk = 0;
                    next_orange_walk = 0;
                    next_red_hand = 1;
                    next_multiplier = 2'b01;
                    next_tr = 1'b0;
                    next_state = hand;
                end
            end
        endcase
    end

endmodule
