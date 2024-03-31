`timescale 1ns / 1ps

module ElevatorFSM(
    input clk,
    input reset,
    input update,
    input  [1:0] motor_control, // MSB is 'up'm LSB is 'down'
    output reg [1:0] floor, // 00 for floor 0, 01 for floor 1, 10 for floor 2
    output reg [1:0] movement // 00 for stay, 01 for down, 10 for up
    );
    
    // state encoding
    localparam F0S = 3'b000; // Floor 0, Stay
    localparam F0D = 3'b001; // Floor 0, Down
    localparam F1U = 3'b010; // Floor 1, Up
    localparam F1D = 3'b011; // Floor 1, Down
    localparam F1S = 3'b100; // Floor 1, Stay
    localparam F2U = 3'b101; // Floor 2, Up
    localparam F2S = 3'b110; // Floor 2, Stay
    
    // state management
    reg [2:0] currentState, nextState, prevState;
    
    // state transition
    always @(posedge clk) begin
        if (reset) begin
            currentState <= F0S;
        end
        else if (update == 1 && prevState == 0) begin
            currentState <= nextState; 
        end
        prevState <= update;
    end
    
    // Next State Logic
    always @(*) begin
        case (currentState)
            F0S: begin
                if (motor_control == 2'b10) nextState = F1U;
                else if (motor_control == 2'b01) nextState = F0S;
                else if (motor_control == 2'b00) nextState = F0S;
                else nextState = F0S;
            end
            F0D: begin
                if (motor_control == 2'b10) nextState = F1U;
                else if (motor_control == 2'b01) nextState = F0S;
                else if (motor_control == 2'b00) nextState = F0S;
                else nextState = F0S;
            end
            F1U: begin
                if (motor_control == 2'b10) nextState = F2U;
                else if (motor_control == 2'b01) nextState = F0D;
                else if (motor_control == 2'b00) nextState = F1S;
                else nextState = F1S;
            end
            F1D: begin
                if (motor_control == 2'b10) nextState = F2U;
                else if (motor_control == 2'b01) nextState = F0D;
                else if (motor_control == 2'b00) nextState = F1S;
                else nextState = F1S;
            end
            F1S: begin
                if (motor_control == 2'b10) nextState = F2U;
                else if (motor_control == 2'b01) nextState = F0D;
                else if (motor_control == 2'b00) nextState = F1S;
                else nextState = F1S;
            end
            F2U: begin
                if (motor_control == 2'b10) nextState = F2S;
                else if (motor_control == 2'b01) nextState = F1D;
                else if (motor_control == 2'b00) nextState = F2S;
                else nextState = F2U;
            end
            F2S: begin
                if (motor_control == 2'b10) nextState = F2S;
                else if (motor_control == 2'b01) nextState = F1D;
                else if (motor_control == 2'b00) nextState = F2S;
                else nextState = F2U;
            end
            default: nextState = F0S;
        endcase
    end

    // Output Logic
    always @(currentState) begin
        case (currentState)
            F0S: begin
                floor = 2'b00;
                movement = 2'b00;
            end
            F0D: begin
                floor = 2'b00;
                movement = 2'b01;
            end
            F1U: begin
                floor = 2'b01;
                movement = 2'b10;
            end
            F1D: begin
                floor = 2'b01;
                movement = 2'b01;
            end
            F1S: begin
                floor = 2'b01;
                movement = 2'b00;
            end
            F2U: begin
                floor = 2'b10;
                movement = 2'b10;
            end
            F2S: begin
                floor = 2'b10;
                movement = 2'b00;
            end
            default: begin
                floor = 2'b00;
                movement = 2'b00;
            end
        endcase
    end
        
endmodule
