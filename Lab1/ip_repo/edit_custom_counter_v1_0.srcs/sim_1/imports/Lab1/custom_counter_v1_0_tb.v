`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Eindhoven University of Technology
// Author: Diederik Markus
// 
// Create Date: 04/12/2018
// Module Name: custom_counter_v1_0_tb 
// Description: 5EIB0 lab 1 IP block testbench. This version should be given to
// 	the students before they start with the assignments.
// 
// Version: 1.1
//////////////////////////////////////////////////////////////////////////////////

module custom_counter_v1_0_tb();
   //clock and reset_n signals
   reg aclk =1'b1;
   reg arstn = 1'b0;
   
   //Write Address channel (AW)
   reg [3:0] write_addr =4'd0;    //Master write address
   reg [2:0] write_prot = 3'd0;    //type of write(leave at 0)
   reg write_addr_valid = 1'b0;    //master indicating address is valid
   wire write_addr_ready;        //slave ready to receive address

   //Write Data Channel (W)
   reg [31:0] write_data = 4'd0;    //Master write data
   reg [3:0] write_strb = 4'd0;    //Master byte-wise write strobe
   reg write_data_valid = 1'b0;    //Master indicating write data is valid
   wire write_data_ready;        //slave ready to receive data

   //Write Response Channel (WR)
   reg write_resp_ready = 1'b0;    //Master ready to receive write response
   wire [1:0] write_resp;        //slave write response
   wire write_resp_valid;        //slave response valid
   
   //Read Address channel (AR)
   reg [3:0] read_addr = 4'd0;    //Master read address
   reg [2:0] read_prot =3'd0;    //type of read(leave at 0)
   reg read_addr_valid = 1'b0;    //Master indicating address is valid
   wire read_addr_ready;        //slave ready to receive address

   //Read Data Channel (R)
   reg read_data_ready = 1'b0;    //Master indicating ready to receive data
   wire [31:0] read_data;        //slave read data
   wire [1:0] read_resp;        //slave read response
   wire read_data_valid;        //slave indicating data in channel is valid

   reg [31:0] output_data = 32'b0;

   wire [3:0] leds;

   custom_counter_v1_0 #(
       .C_S00_AXI_DATA_WIDTH(32),
       .C_S00_AXI_ADDR_WIDTH(4),
       .number_of_clk_cycles(10)
   ) custom_counter_v1_0_inst (
       .leds(leds),
       
       .s00_axi_aclk(aclk),
       .s00_axi_aresetn(arstn),
       
       .s00_axi_awaddr(write_addr),
       .s00_axi_awprot(write_prot),
       .s00_axi_awvalid(write_addr_valid),
       .s00_axi_awready(write_addr_ready),
       
       .s00_axi_wdata(write_data),
       .s00_axi_wstrb(write_strb),
       .s00_axi_wvalid(write_data_valid),
       .s00_axi_wready(write_data_ready),
       
       .s00_axi_bresp(write_resp),
       .s00_axi_bvalid(write_resp_valid),
       .s00_axi_bready(write_resp_ready),
       
       .s00_axi_araddr(read_addr),
       .s00_axi_arprot(read_prot),
       .s00_axi_arvalid(read_addr_valid),
       .s00_axi_arready(read_addr_ready),
       
       .s00_axi_rdata(read_data),
       .s00_axi_rresp(read_resp),
       .s00_axi_rvalid(read_data_valid),
       .s00_axi_rready(read_data_ready)
   );
   
   //
   // ADD YOUR OWN LOGIC HERE.
   always
        #5 aclk <= ~aclk;
    initial
    begin
        arstn = 0;
        #20 arstn = 1; // after 20 sec reset
        
        // counter reset
        #20
        axi_write(32'd4,1'b1); //address to reset register = slv_reg1
        #20
        axi_write(32'd4,1'b0); //address to enable register = slv_reg2
        
        // counter enable
        #20 axi_write(32'd0,1'b1); // write 1 to the slave register = slv_reg0
        
        // read from output of counter => slv_reg2
        #100 axi_read(32'd8,output_data);
        
        #200
        $finish;
    end
   //
   
   task axi_read;
   input [31:0] addr;
   output reg [31:0] data;
   begin
       #3 read_addr <= addr; //puts adress on the bus
       read_addr_valid <= 1'b1; //indicating address is valid
       read_data_ready <= 1'b1; //indicting ready for a response
       
       wait(read_addr_ready); //wait till slave is ready to read the address
       
       @(posedge aclk); //handshake occurs
       read_addr_valid <= 1'b0;
       
       wait(read_data_valid);
       @(posedge aclk);
       data <=read_data;
       @(posedge aclk);
       read_data_ready <= 1'b0;
   end
   endtask;

   task axi_write;
   input [31:0] addr;
   input [31:0] data;
   begin
       #3 write_addr <= addr;    //Put write address on bus
       write_data <= data;    //put write data on bus
       write_addr_valid <= 1'b1;    //indicate address is valid
       write_data_valid <= 1'b1;    //indicate data is valid
       write_resp_ready <= 1'b1;    //indicate ready for a response
       write_strb <= 4'hF;        //writing all 4 bytes

       //wait for one slave ready signal or the other
       wait(write_data_ready || write_addr_ready);
           
       @(posedge aclk); //one or both signals and a positive edge
       if(write_data_ready&&write_addr_ready)//received both ready signals
       begin
           write_addr_valid<=0;
           write_data_valid<=0;
       end
       else    //wait for the other signal and a positive edge
       begin
           if(write_data_ready)    //case data handshake completed
           begin
               write_data_valid<=0;
               wait(write_addr_ready); //wait for address address ready
           end
           else if(write_addr_ready)   //case address handshake completed
           begin
               write_addr_valid<=0;
               wait(write_data_ready); //wait for data ready
           end 
           @ (posedge aclk);// complete the second handshake
           write_addr_valid<=0; //make sure both valid signals are deasserted
           write_data_valid<=0;
       end
           
       //both handshakes have occured
       //deassert strobe
       write_strb<=0;

       //wait for valid response
       wait(write_resp_valid);
       
       //both handshake signals and rising edge
       @(posedge aclk);

       //deassert ready for response
       write_resp_ready<=0;


       //end of write transaction
   end
   endtask;
endmodule
