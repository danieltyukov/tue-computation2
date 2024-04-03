// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Wed Apr  3 16:51:33 2024
// Host        : computation-virtual-machine running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /media/sf_SharedWork/mmips-vivado-base/vivado/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_mMIPS_sim_0_0/design_1_mMIPS_sim_0_0_stub.v
// Design      : design_1_mMIPS_sim_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mMIPS_sim,Vivado 2018.2" *)
module design_1_mMIPS_sim_0_0(clk, en, rst, dev_dout, dev_din, dev_r, dev_w, 
  dev_rdyr, dev_rdyw, dev_wdata, dev_waddr, dev_send_eop, dev_rcv_eop)
/* synthesis syn_black_box black_box_pad_pin="clk,en,rst,dev_dout[31:0],dev_din[31:0],dev_r,dev_w,dev_rdyr,dev_rdyw,dev_wdata,dev_waddr,dev_send_eop,dev_rcv_eop" */;
  input clk;
  input en;
  input rst;
  output [31:0]dev_dout;
  input [31:0]dev_din;
  output dev_r;
  output dev_w;
  input dev_rdyr;
  input dev_rdyw;
  output dev_wdata;
  output dev_waddr;
  output dev_send_eop;
  input dev_rcv_eop;
endmodule
