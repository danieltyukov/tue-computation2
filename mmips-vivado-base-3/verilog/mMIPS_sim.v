////////////////////////////////////////////////
// MMIPS_SIM.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//  Combines the mMIPS with simulated RAM, ROM and Device handler
//  for simulation purposes
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

module mMIPS_sim(
        clk,
        en,
        rst,
        dev_dout,
        dev_din,
        dev_r,
        dev_w,
        dev_rdyr,
        dev_rdyw,
        dev_wdata,
        dev_waddr,
        dev_send_eop,
        dev_rcv_eop
    );
    
    input           clk;
    input           en;
    input           rst;
    output  [31:0]  dev_dout;
    input   [31:0]  dev_din;
    output          dev_r;
    output          dev_w;
    input           dev_rdyr;
    input           dev_rdyw;
    output          dev_wdata;
    output          dev_waddr;
    output          dev_send_eop;
    input           dev_rcv_eop;
    
    wire [31:0] rom_dout;
    wire        rom_wait;
    wire [31:0] rom_addr;
    wire [0:0]  rom_r;
    wire [31:0] ram_dout;
    wire        ram_wait;
    wire [31:0] ram_din;
    wire [31:0] ram_addr;
    wire [1:0]  ram_r;
    wire [1:0]  ram_w;

    
    mMIPS mMIPS(
        .clk(clk),
        .enable(en),
        .rst(rst),
        .rom_dout(rom_dout),
        .rom_wait(rom_wait),
        .rom_addr(rom_addr),
        .rom_r(rom_r),
        .ram_dout(ram_dout),
        .ram_wait(ram_wait),
        .ram_din(ram_din),
        .ram_addr(ram_addr),
        .ram_r(ram_r),
        .ram_w(ram_w),
        .dev_dout(dev_dout),
        .dev_din(dev_din),
        .dev_r(dev_r),
        .dev_w(dev_w),
        .dev_rdyr(dev_rdyr),
        .dev_rdyw(dev_rdyw),
        .dev_wdata(dev_wdata),
        .dev_waddr(dev_waddr),
        .dev_send_eop(dev_send_eop),
        .dev_rcv_eop(dev_rcv_eop)
    );
    
    ram #(.RAM_BRAM(`RAM_BRAM))
    dmem(
        .clk(clk),
        .enable(en),
        .ram_dout(ram_dout),
        .ram_wait(ram_wait),
        .ram_din(ram_din),
        .ram_addr(ram_addr),
        .ram_r(ram_r),
        .ram_w(ram_w)
    );
    
    rom #(.ROM_BRAM(`ROM_BRAM))
    imem(
        .clk(clk),
        .enable(en),
        .rom_dout(rom_dout),
        .rom_wait(rom_wait),
        .rom_addr(rom_addr),
        .rom_r(rom_r)
    );

endmodule
