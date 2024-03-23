-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Sat Mar 23 11:01:03 2024
-- Host        : computation-virtual-machine running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /media/sf_SharedWork/Lab2/ip_repo/edit_coffee_moore_v1_0.srcs/sources_1/bd/design_1/ip/design_1_debounce_0_0/design_1_debounce_0_0_stub.vhdl
-- Design      : design_1_debounce_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_debounce_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    button_in : in STD_LOGIC;
    button_out : out STD_LOGIC
  );

end design_1_debounce_0_0;

architecture stub of design_1_debounce_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,button_in,button_out";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "debounce,Vivado 2018.2";
begin
end;
