module vending_machine (
	input wire [0:0] clk,
	input wire [0:0] reset,
	input wire [1:0] coin_in,
	
    output reg [0:0] soda,
	output reg [1:0] coin_out
);

localparam
PUT_COIN = 0,
INPUT1 = 1,
INPUT5 = 2,
INPUT6 = 3,
INPUT3 = 4,
RETURN1 = 5,
SODA_OUT = 6;

reg [2:0] state_r;
reg [2:0] state_nxt;

always @(posedge clk) begin
	if (reset == 1'b1) begin
		state_r <= state_nxt;
	end else begin
		state_r <= PUT_COIN;
	end
end

always @(*) begin
    state_nxt=state_r;
	case (state_r)
		PUT_COIN:
		begin
			soda = 1'b0;
			coin_out = 2'b00;
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

		INPUT1:
		begin
			soda = 1'b0;
			coin_out = 2'b00;
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

		INPUT5:
		begin
			soda = 1'b0;
			coin_out = 2'b10;
			state_nxt = RETURN1;
		end

		INPUT6:
		begin
			soda = 1'b0;
			coin_out = 2'b01;
			state_nxt = INPUT5;
		end

		INPUT3:
		begin
			soda = 1'b0;
			coin_out = 2'b01;
			state_nxt = SODA_OUT;
		end

		RETURN1:
		begin
			soda = 1'b0;
			coin_out = 2'b01;
			state_nxt = SODA_OUT;
		end

		SODA_OUT:
		begin
			soda = 1'b1;
			coin_out = 2'b00;
			state_nxt = PUT_COIN;
		end

		default:
		begin
			soda = 1'b0;
			coin_out = 2'b00;
			state_nxt = PUT_COIN;
		end
	endcase
end
endmodule
