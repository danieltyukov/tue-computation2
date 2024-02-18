module pipen2 (q3, d, clk);
	output [7:0] q3;
	input  [7:0] d;
	input        clk;
	reg    [7:0] q3, q2, q1;

	always @(posedge clk) begin
		q3 <= q2;
		q2 <= q1;
		q1 <= d;
	end
endmodule
