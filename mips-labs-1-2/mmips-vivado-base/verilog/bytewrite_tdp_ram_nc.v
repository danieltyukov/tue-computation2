//
// True-Dual-Port BRAM with Byte-wide Write Enable
//      No-Change mode
//
// bytewrite_tdp_ram_nc.v
//
// ByteWide Write Enable, - NO_CHANGE mode template - Vivado recomended
module bytewrite_tdp_ram_nc
  #(
    //---------------------------------------------------------------
    parameter   NUM_COL                 =   4,
    parameter   COL_WIDTH               =   8,
    parameter   ADDR_WIDTH              =  10, // Addr  Width in bits : 2**ADDR_WIDTH = RAM Depth
    parameter   DATA_WIDTH              =  NUM_COL*COL_WIDTH,  // Data  Width in bits
    parameter   INIT_FILE               =  "NONE"
    //---------------------------------------------------------------
    ) (
       input clkA,
       input enaA, 
       input [NUM_COL-1:0] weA,
       input [ADDR_WIDTH-1:0] addrA,
       input [DATA_WIDTH-1:0] dinA,
       output reg [DATA_WIDTH-1:0] doutA,
       
       input clkB,
       input enaB,
       input [NUM_COL-1:0] weB,
       input [ADDR_WIDTH-1:0] addrB,
       input [DATA_WIDTH-1:0] dinB,
       output reg [DATA_WIDTH-1:0] doutB
       );

   
   // Core Memory  
   reg [DATA_WIDTH-1:0]            ram_block [(2**ADDR_WIDTH)-1:0];

   initial begin
     if (INIT_FILE != "NONE") begin
         $readmemh(INIT_FILE, ram_block, 0, 2**ADDR_WIDTH-1);
     end else begin : indexy
       integer ram_index;
         for (ram_index = 0; ram_index < 2**ADDR_WIDTH; ram_index = ram_index + 1)
           ram_block[ram_index] = {(NUM_COL*COL_WIDTH){1'b0}};
     end
   end
   
   // Port-A Operation
   generate
      genvar                       i;
      for(i=0;i<NUM_COL;i=i+1) begin
         always @ (posedge clkA) begin
            if(enaA) begin
               if(weA[i]) begin
                  ram_block[addrA][i*COL_WIDTH +: COL_WIDTH] <= dinA[i*COL_WIDTH +: COL_WIDTH];
               end
            end
         end
      end
   endgenerate
   
   always @ (posedge clkA) begin
      if(enaA) begin
         if (~|weA)
           doutA <= ram_block[addrA];
      end
   end
   
   
   // Port-B Operation:
   generate
      for(i=0;i<NUM_COL;i=i+1) begin
         always @ (posedge clkB) begin
            if(enaB) begin
               if(weB[i]) begin
                  ram_block[addrB][i*COL_WIDTH +: COL_WIDTH] <= dinB[i*COL_WIDTH +: COL_WIDTH];
               end
            end
         end
      end
   endgenerate
   
   always @ (posedge clkB) begin
      if(enaB) begin
         if (~|weB)
           doutB <= ram_block[addrB];
      end
   end
   
endmodule // bytewrite_tdp_ram_nc
