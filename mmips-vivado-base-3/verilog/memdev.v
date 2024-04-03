////////////////////////////////////////////////
// MEMDEV.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//  Replacement for 
//  data memory to allow memory-mapped device
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

module MEMDEV(
        clk,
        a_read,
        a_read_reg,
        d_read,
        d_write,
        w,
        r,
        dmem_wait,
        ram_dout,
        ram_wait,
        ram_w,
        ram_r,
        ram_addr,
        ram_din,
        dev_dout,
        dev_rdyr,
        dev_rdyw,
        dev_w,
        dev_r,
        dev_din,
        dev_wdata,
        dev_waddr,
        dev_rcv_eop,
        dev_send_eop
    );

    input   clk;
    input   [31:0]  a_read;
    input   [31:0]  a_read_reg;
    output  [31:0]  d_read;
    reg     [31:0]  d_read;
    input   [31:0]  d_write;
    input   [1:0]   w;
    input   [1:0]   r;
    output          dmem_wait;
    reg             dmem_wait;
    input   [31:0]  ram_dout;
    input           ram_wait;
    output  [1:0]   ram_w;
    reg     [1:0]   ram_w;
    output  [1:0]   ram_r;
    reg     [1:0]   ram_r;
    output  [31:0]  ram_addr;
    reg     [31:0]  ram_addr;
    output  [31:0]  ram_din;
    reg     [31:0]  ram_din;
    input   [31:0]  dev_dout;
    input           dev_rdyr;
    input           dev_rdyw;
    output          dev_w;
    reg             dev_w;
    output          dev_r;
    reg             dev_r;
    output  [31:0]  dev_din;
    reg     [31:0]  dev_din;
    output          dev_wdata;
    reg             dev_wdata;
    output          dev_waddr;
    reg             dev_waddr;
    input           dev_rcv_eop;
    output          dev_send_eop;
    reg             dev_send_eop;
    reg     [31:0]  dev_buffer;
    reg             bufw;
    reg             sending;
    reg             n_sending;
    reg             dev_select;
    reg             reg_dev_select;
    reg             addr;
    reg             addr_reg;
    reg             send;
    reg             eop;
    reg             wr;
    reg             rd;
    reg             ss;
    reg             rr;
    reg     [31:0]  status;


    
    always @(posedge clk)
        begin : buffer
            if (bufw)
                dev_buffer <= dev_dout;
            sending <= n_sending;
        end

    
    always @(a_read or 
                a_read_reg or 
                d_write or 
                w or 
                r or 
                sending or 
                ram_dout or 
                ram_wait or 
                dev_rdyw or 
                dev_rdyr or 
                dev_buffer or 
                dev_rcv_eop
            )
        begin : memdev_process
            // device is selected by setting the 31st bit of the address (address 0x80000000)
            dev_select = (a_read[31] == 1);
            reg_dev_select = (a_read_reg[31] == 1);
            
            // the control word is at address 0x80000004 - hence testing bit 2
            addr = (a_read[2] == 1);
            addr_reg = (a_read_reg[2] == 1);
            
            // send action is triggered by writing bit #17 to control word (0x80000004)
            send = (d_write[17] == 1);
            
            // packet is closed by asserting bit #20 together with send (#17)
            eop = (d_write[17] == 1);
            
            // just forward data and address to memory
            ram_addr = a_read;
            ram_din = d_write;
            
            // ... but switch-off writing and reading in the device-access-mode
            if (!dev_select)
            begin
                ram_w = w;
                ram_r = r;
            end
            else
            begin
                ram_w = 2'b00;
                ram_r = 2'b00;
            end
            
            // if device is selected, register its output
            bufw = dev_select;
            
            
            dev_din = d_write;
            wr = (dev_select && (w[1'b0] != 0));
            rd = (dev_select && (r[1'b0] != 0));
            // we're sending (ss) if the device is selected, control word is written and the 
            // value of bit #17 is one
            // we're reading (rr) if the read request for address 0x80000000 is present
            ss = wr && send && addr;
            rr = rd && !addr;
            
            dev_w = ss;
            dev_r = rr;
            dev_send_eop = ss && eop;
            
            dev_wdata = wr && !addr;
            dev_waddr = wr && addr;
            
            // 'ss' triggers 'sending' state, which lasts until device-write-ready appears
            n_sending = ss || sending && !dev_rdyw;
            
            // when reading control word (0x80000004) you get only three bits set:
            // #16 - device has new data, #18 - device is ready to send, 
            // #19 - with #16 (new data) means it's the last data word of a packet
            status = 32'b0;
            status[16] = dev_rdyr;
            status[18] = !sending;
            status[19] = dev_rcv_eop;
            
            // select output - device data (buffered), device status, or regular memory
            if (reg_dev_select)
            begin
                if (addr_reg)
                    d_read = status;
                else
                    d_read = dev_buffer;
            end
            else
                d_read = ram_dout;
            
            // we can only wait for regular memory - the device access is non-blocking 
            // (if you're not careful, i.e. reading when status[16] is zero or writing
            // when status[18] is zero,  you may overwrite data or read garbage)
            dmem_wait = !reg_dev_select && ram_wait;
        end

endmodule
