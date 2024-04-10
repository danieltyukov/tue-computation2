/* Top-level module for crosswalk control unit */
module ccu_top (
    input  clk,
    input  reset,
    output green_walk,
    output orange_walk,
    output red_hand
);

// Number of cycles for each signal
localparam tvalue = ...; // TODO: replace this with the correct value

/* Use these wires for the signals between ccu and parametrized counter.
Do not change the names of these signals, as the testbench will
inspect them. */
wire tr;
wire cf;
wire [1:0] multiplier;
wire proceed;

/* TODO: Assign proceed to be high iff cf is high and tr is low. */
assign proceed = ...;

/* TODO: Instantiate parametrized_counter module (provided for you).
Make sure the instance is called parametrized_counter_inst. */

/* TODO: Instantiate FSM module (which you have to implement in ccu.v).
Make sure the instance is called ccu_inst. */

endmodule
