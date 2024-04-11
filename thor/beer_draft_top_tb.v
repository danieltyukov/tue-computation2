`timescale 1ns / 1ps
module beer_draft_top_tb();

	<<DECLARE SIGNALS TO DRIVE MODULE beer_draft_top>>
   
	beer_draft_top beer_draft_top_inst(
		.clk(clk), 
		.reset(reset),
		.next(next),
		.draft(draft), 
		.beer_level(beer_level), 
		.beer(beer), 
		.state_display(state_display));
   <<DECLARE CLOCK>>
   
           
   initial begin
	  $dumpfile("dut.vcd");
   	  $dumpvars(0, beer_draft_top_inst);
	  
	  <<RESET>>
	  #500
	  $display("state %x, beer %b", state_display,beer);
   
	  
	  <<STIMULI 1>>
	  #500
	  $display("state %x, beer %b", state_display,beer);

	  <<STIMULI 2>>
	  #500
	  $display("state %x, beer %b", state_display,beer);
	   
	  ...................  continue for the rest of the stimuli .............................
	  
	  #100
      $finish;
   end
endmodule