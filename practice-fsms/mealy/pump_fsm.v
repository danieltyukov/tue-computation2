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
    reg [1:0] next_state;

    // Timer
    always @(posedge clk) begin
        if (reset == HIGH) begin
            state <= off;
        end else begin
            state <= next_state;
        end
    end

    // State Logic
    always @(*) begin
        next_state = state;
        if (update == HIGH) begin    
            case(state)
                off: begin
                    if (command == turnOn) begin
                        next_state = standby;
                    end
                end
                standby: begin
                    if (command == turnOff) begin
                        next_state = off;
                    end
                    if (command == startPump) begin
                        next_state = working;
                    end
                end
                working: begin
                    if (command == turnOff) begin
                        next_state = off;
                    end
                    if (command == stopPump) begin
                        next_state = standby;
                    end
                end
            endcase
        end
        case(state)
            off: begin
                pump = LOW;
                led = LOW;
            end
            standby: begin
                pump = LOW;
                led = HIGH;
            end
            working: begin
                pump = HIGH;
                led = HIGH;
            end
        endcase
    end
endmodule
