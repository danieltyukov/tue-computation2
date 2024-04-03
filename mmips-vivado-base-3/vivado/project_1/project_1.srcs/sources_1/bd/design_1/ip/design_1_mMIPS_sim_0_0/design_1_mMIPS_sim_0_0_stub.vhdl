-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Apr  3 16:51:33 2024
-- Host        : computation-virtual-machine running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/sf_SharedWork/mmips-vivado-base/vivado/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_mMIPS_sim_0_0/design_1_mMIPS_sim_0_0_stub.vhdl
-- Design      : design_1_mMIPS_sim_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_mMIPS_sim_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    rst : in STD_LOGIC;
    dev_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dev_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dev_r : out STD_LOGIC;
    dev_w : out STD_LOGIC;
    dev_rdyr : in STD_LOGIC;
    dev_rdyw : in STD_LOGIC;
    dev_wdata : out STD_LOGIC;
    dev_waddr : out STD_LOGIC;
    dev_send_eop : out STD_LOGIC;
    dev_rcv_eop : in STD_LOGIC
  );

end design_1_mMIPS_sim_0_0;

architecture stub of design_1_mMIPS_sim_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,en,rst,dev_dout[31:0],dev_din[31:0],dev_r,dev_w,dev_rdyr,dev_rdyw,dev_wdata,dev_waddr,dev_send_eop,dev_rcv_eop";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "mMIPS_sim,Vivado 2018.2";
begin
end;
