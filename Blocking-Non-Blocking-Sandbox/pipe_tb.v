module pipe_tb;

reg clk;
reg [7:0] d;
wire [7:0] dutpb1_behav_q3;
wire [7:0] dutpb2_behav_q3;
wire [7:0] dutpb3_behav_q3;
wire [7:0] dutpb4_behav_q3;
wire [7:0] dutpn1_behav_q3;
wire [7:0] dutpn2_behav_q3;
wire [7:0] dutpn3_behav_q3;
wire [7:0] dutpn4_behav_q3;
wire [7:0] dutpb1_synth_q3;
wire [7:0] dutpb2_synth_q3;
wire [7:0] dutpb3_synth_q3;
wire [7:0] dutpb4_synth_q3;
wire [7:0] dutpn1_synth_q3;
wire [7:0] dutpn2_synth_q3;
wire [7:0] dutpn3_synth_q3;
wire [7:0] dutpn4_synth_q3;

initial begin
	$dumpfile("dut.vcd");
    $dumpvars(0,pipe_tb);
	#100
	$finish;
end

initial begin
	clk = 1'b0;
	d = 8'b0;
end

always #2 clk <= ~clk;
always #5 d <= d+1;

pipeb1 DUTPB1B (
	.q3(dutpb1_behav_q3),
	.d(d),
	.clk(clk)
);

pipeb2 DUTPB2B (
	.q3(dutpb2_behav_q3),
	.d(d),
	.clk(clk)
);

pipeb3 DUTPB3B (
	.q3(dutpb3_behav_q3),
	.d(d),
	.clk(clk)
);

pipeb4 DUTPB4B (
	.q3(dutpb4_behav_q3),
	.d(d),
	.clk(clk)
);

pipen1 DUTPN1B (
	.q3(dutpn1_behav_q3),
	.d(d),
	.clk(clk)
);

pipen2 DUTPN2B (
	.q3(dutpn2_behav_q3),
	.d(d),
	.clk(clk)
);

pipen3 DUTPN3B (
	.q3(dutpn3_behav_q3),
	.d(d),
	.clk(clk)
);

pipen4 DUTPN4B (
	.q3(dutpn4_behav_q3),
	.d(d),
	.clk(clk)
);

// The modules below are synthesised verilog netlists
// generated from the behavioural descriptions. They
// will automatically update if you modify the associated
// behavioural verilog file.

pipeb1_syn DUTPB1S (
	.q3(dutpb1_synth_q3),
	.d(d),
	.clk(clk)
);

pipeb2_syn DUTPB2S (
	.q3(dutpb2_synth_q3),
	.d(d),
	.clk(clk)
);

pipeb3_syn DUTPB3S (
	.q3(dutpb3_synth_q3),
	.d(d),
	.clk(clk)
);

pipeb4_syn DUTPB4S (
	.q3(dutpb4_synth_q3),
	.d(d),
	.clk(clk)
);

pipen1_syn DUTPN1S (
	.q3(dutpn1_synth_q3),
	.d(d),
	.clk(clk)
);

pipen2_syn DUTPN2S (
	.q3(dutpn2_synth_q3),
	.d(d),
	.clk(clk)
);

pipen3_syn DUTPN3S (
	.q3(dutpn3_synth_q3),
	.d(d),
	.clk(clk)
);

pipen4_syn DUTPN4S (
	.q3(dutpn4_synth_q3),
	.d(d),
	.clk(clk)
);

endmodule
