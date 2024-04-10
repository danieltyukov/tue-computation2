module vending_machine (
	input wire [0:0] clk,
	input wire [0:0] reset,
	input wire [1:0] coin_in,
	
    output reg [0:0] soda,
	output reg [1:0] coin_out
);

// define unique constants to identify each state
localparam
PUT_COIN = 0,
INPUT1 = 1,
INPUT5 = 2,
INPUT6 = 3,
INPUT3 = 4,
RETURN1 = 5,
SODA_OUT = 6;

// declare verilog variables of type reg for use in always blocks
// <name>_r is used to infer a register in the clocked always block
// <name>_nxt is used assign the next state of the register in the combinational always block
reg [2:0] state_r;
reg [2:0] state_nxt;

reg [0:0] soda_r;
reg [0:0] soda_nxt;

reg [1:0] coin_out_r;
reg [1:0] coin_out_nxt;

// clock synchronous always block will only be evaluated on the positive edge of the clock
// only use non-blocking assignments (<=) in this block
always @(posedge clk) begin
	// check for the reset signal on the clk edge, infering a synchronous reset
	// if the module is not being reset, assign all of the derived combinational <name>_nxt values to <name>_r
	// if the module is being reset, assign initial constant values to the <name>_r variables
	// this will infer a register for <name>_r if it is assigned defined values at all times
	// otherwise an unintentional latch will be inferred
	if (reset == 1'b1) begin
		// module is not being reset
		// assign all of the derived combinational <name>_nxt values to the respective <name>_r
		state_r <= state_nxt;
		soda_r <= soda_nxt;
		coin_out_r <= coin_out_nxt;
	end else begin
		// module is being reset
		// assign constant values to each <name>_r variable
		state_r <= PUT_COIN;
		soda_r <= 1'b0;
		coin_out_r <= 2'b00;
	end
end

// combinational always block will evaluate whenever any signal in its sensitivity list changes
// here we use the wildcard * sensitivity list, which means that the list will be inferred from the assignments in the block
// only use blocking assignments (=) in this block
always @(*) begin
	// make sure that <name>_nxt signals are always defined to avoid latches
	// to ensure register elements minimally retain their last value, assign each <name>_nxt its respective <name>_r value
    state_nxt=state_r;
	coin_out_nxt=coin_out_r;
    soda_nxt=soda_r;
	// case statement is used to perform different logical derivations depending on current state
	// state_r stores the current state of this FSM
	// the unique state identifiers that were defined near the top of this file are used to identify the current state
	case (state_r)
		// state_r will remain constant between positive clock edges
		// only one unique state can match at any time
		PUT_COIN: // evaluate logic for state PUT_COIN
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b00;
			if (coin_in == 2'b00)
			begin
				state_nxt = PUT_COIN;
			end
			else if (coin_in == 2'b01)
			begin
				state_nxt = INPUT1;
			end
			else if (coin_in == 2'b10)
			begin
				state_nxt = SODA_OUT;
			end
			else if (coin_in == 2'b11)
			begin
				state_nxt = INPUT5;
			end
		end

		INPUT1: // evaluate logic for state INPUT1
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b00;
			if (coin_in == 2'b00)
			begin
				state_nxt = INPUT1;
			end
			else if (coin_in == 2'b01)
			begin
				state_nxt = SODA_OUT;
			end
			else if (coin_in == 2'b10)
			begin
				state_nxt = INPUT3;
			end
			else if (coin_in == 2'b11)
			begin
				state_nxt = INPUT6;
			end
		end

		INPUT5: // evaluate logic for state INPUT5
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b10;
			state_nxt = RETURN1;
		end

		INPUT6: // evaluate logic for state INPUT6
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b01;
			state_nxt = INPUT5;
		end

		INPUT3: // evaluate logic for state INPUT3
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b01;
			state_nxt = SODA_OUT;
		end

		RETURN1: // evaluate logic for state RETURN1
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b01;
			state_nxt = SODA_OUT;
		end

		SODA_OUT: // evaluate logic for state SODA_OUT
		begin
			soda_nxt = 1'b1;
			coin_out_nxt = 2'b00;
			state_nxt = PUT_COIN;
		end

		default: // should not be reachable if the state register is initialised and updated correctly
		begin
			soda_nxt = 1'b0;
			coin_out_nxt = 2'b00;
			state_nxt = PUT_COIN;
		end
	endcase
end

// assign values to output ports
assign soda = soda_nxt;
assign coin_out = coin_out_nxt;
endmodule
