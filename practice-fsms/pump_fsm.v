`timescale 1ns / 100ps

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
    
    // Add your own code here

endmodule
