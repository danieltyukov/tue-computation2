`timescale 1ns / 100ps

// command/pump,led

module pump_fsm (
    input  wire [0:0] clk,
    input  wire [0:0] reset,
    input  wire [0:0] update,
    input  wire [1:0] command,
    output reg  [0:0] pump,
    output reg  [0:0] led
    );

    /* Define state parameters */
    localparam
	off     = 0,
	standby = 1,
	working = 2;
    
    /* Define command values */
    localparam
    turnOff   = 2'b00,
    turnOn    = 2'b01,
    stopPump  = 2'b10,
    startPump = 2'b11;

    // Bit definitions
    localparam
    LOW = 1'b0,
    HIGH = 1'b1; 
    
    reg [1:0] state;
    reg [1:0] state_next;
    reg [0:0] pump_next;
    reg [0:0] led_next;
    reg [0:0] update_prev;

    // Timer
    always @(posedge clk) begin
        if (reset == HIGH) begin
            state <= off;
            update_prev <= LOW;
            pump <= LOW;
            led <= LOW;
        end 
        else begin
            update_prev <= update;
            if (update == HIGH && update_prev == LOW) begin
                state <= state_next;
                pump <= pump_next;
                led <= led_next;
            end
        end
    end

    // State Logic
    always @(*) begin
        state_next = state;
        pump_next = pump;
        led_next = led;
        case(state)
            off: begin
                if (command == turnOn) begin
                    state_next = standby;
                    pump_next = LOW;
                    led_next = HIGH;   
                end            
            end
            standby: begin
                if (command == turnOff) begin
                    state_next = off;
                    pump_next = LOW;
                    led_next = LOW; 
                end
                if (command == startPump) begin
                    state_next = working;
                    pump_next = HIGH;
                    led_next = HIGH;
                end 
            end
            working: begin
                if (command == turnOff) begin
                    state_next = off;
                    pump_next = LOW;
                    led_next = LOW;
                end
                if (command == stopPump) begin
                    state_next = standby;
                    pump_next = LOW;
                    led_next = HIGH;
                end
            end
        endcase
    end
endmodule
