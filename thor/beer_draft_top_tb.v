// state 0, beer 0
// state 1, beer 0
// state 1, beer 0
// state 2, beer 1
// state 2, beer 1
// state 0, beer 0
// state 1, beer 0
// state 0, beer 0

`timescale 1ns / 1ps
module beer_draft_top_tb();

	// <<DECLARE SIGNALS TO DRIVE MODULE beer_draft_top>>
	reg clk;
	reg reset;
	reg next;
	reg draft;
	reg [1:0] beer_level;
	wire beer;
	wire [1:0] state_display;
   
	beer_draft_top beer_draft_top_inst(
		.clk(clk), 
		.reset(reset),
		.next(next),
		.draft(draft), 
		.beer_level(beer_level), 
		.beer(beer), 
		.state_display(state_display));

	//    <<DECLARE CLOCK>>
	always #10 clk=~clk;
   
           
   initial begin
	  $dumpfile("dut.vcd");
   	  $dumpvars(0, beer_draft_top_inst);
	  
	  //   <<RESET>>
	  //   <<STIMULI 1>>
	  clk = 0;
	  next = 0;
	  draft = 0;
	  beer_level = 0;
	  reset = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);
	  reset = 0;

	  //   <<STIMULI 2>>
	  draft = 1;
	  beer_level = 1;
	  next = 0;
	  #50 next = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);
	   
	  //   ...................  continue for the rest of the stimuli .............................
	  draft = 1;
	  beer_level = 1;
	  next = 0;
	  #50 next = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);

	  draft = 1;
	  beer_level = 2;
	  next = 0;
	  #50 next = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);

	  draft = 1;
	  beer_level = 2;
	  next = 0;
	  #50 next = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);

	  clk = 0;
	  next = 0;
	  draft = 0;
	  beer_level = 0;
	  reset = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);
	  reset = 0;

	  draft = 1;
	  beer_level = 1;
	  next = 0;
	  #50 next = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);

	  draft = 1;
	  beer_level = 0;
	  next = 0;
	  #50 next = 1;
	  #500
	  $display("state %x, beer %b", state_display,beer);

	  #100
      $finish;
   end
endmodule