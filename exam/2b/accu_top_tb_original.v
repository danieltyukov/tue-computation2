`timescale 1ns / 1ps
module accu_top_tb();

	<<DECLARE SIGNALS TO DRIVE MODULE accu_top>>
   
	accu_top accu_top_inst(
		.clk(clk),
		.reset(reset),
		.next(next),
		.in(in),
		.out(out),
		.state_display(state_display));
   
   <<DECLARE CLOCK>>
   
           
   initial begin
	  $dumpfile("dut.vcd");
   	  $dumpvars(0, accu_top_inst);
	  
	  <<INITIALIZE INPUT SIGNALS>>
	  
	  <<RESET>>
	  #500
	  $display("state %x, out %x", state_display, out);
   
	  
	  <<STIMULI 1>>
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  <<STIMULI 2>>
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  .................. continue for the rest of the stimuli ..............................
	  
	  #100
      $finish;
   end
endmodule