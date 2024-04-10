// 0 => 1  => 0  => 1  => 1 => 0  => 1 => 0  => 0  => 1 =>  0
`timescale 1ns / 1ps
module seq_top_tb();


	// <<DECLARE SIGNALS TO DRIVE MODULE seq_top>>
	reg clk;
	reg reset;
	reg next;
	reg in;
	wire out;
	wire [2:0] state_display;
   
	seq_top seq_top_inst(
		.clk(clk),
		.reset(reset),
		.next(next),
		.in(in),
		.out(out),
		.state_display(state_display));

        always #10 clk=~clk; // Every 10 ns the clock will be inversed

   
           
   initial begin
	  $dumpfile("dut.vcd");
   	  $dumpvars(0, seq_top_inst);
	  
	  //   <<RESET>>
	  clk=0;
	  next=0;
	  in=0;
	  reset=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  reset=0;
	  
	  //   <<STIMULI 1>>
	  in=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  //   <<STIMULI 2>>
	  in=1;
	  next=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
      in=0;
      next=0;
	  #50 next=1;
	  #500 
	  $display("state %x, out %x", state_display, out);
	  
	  in=1;
	  next=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  in=1;
	  next=0;
	  #50 next=1;
	  #500 
	  $display("state %x, out %x", state_display, out);
	  
	  in=0;
	  next=0;
	  #50 next=1;
	  #500 
	  $display("state %x, out %x", state_display, out);
	  
	  in=1;
	  next=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  in=0;
	  next=0;
	  #50 next=1;
	  #500 
	  $display("state %x, out %x", state_display, out);
	  
	  in=0;
	  next=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  in=1;
	  next=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  in=0;
	  next=0;
	  #50 next=1;
	  #500
	  $display("state %x, out %x", state_display, out);
	  
	  #100
      $finish;

   end
endmodule