`timescale 1ns / 1ps
module seq_top_tb();


	<<DECLARE SIGNALS TO DRIVE MODULE seq_top>>
   
	seq_top seq_top_inst(
		.clk(clk),
		.reset(reset),
		.next(next),
		.in(in),
		.out(out),
		.state_display(state_display));

        <<DECLARE CLOCK>>

   
           
   initial begin
	  $dumpfile("dut.vcd");
   	  $dumpvars(0, seq_top_inst);
	  
	  <<RESET>>
	  #500
	  $display("state %x, out %x", state_display, out);
   
	  
	  <<STIMULI 1>>
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  <<STIMULI 2>>
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  ................................................
	  
	  #100
      $finish;

   end
endmodule