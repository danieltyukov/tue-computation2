-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Sat Mar 23 11:01:41 2024
-- Host        : computation-virtual-machine running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_debounce_0_2_sim_netlist.vhdl
-- Design      : design_1_debounce_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_debounce is
  port (
    button_out : out STD_LOGIC;
    button_in : in STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_debounce;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_debounce is
  signal \^button_out\ : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter[0]_i_7_n_0\ : STD_LOGIC;
  signal \counter[0]_i_8_n_0\ : STD_LOGIC;
  signal \counter[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter[12]_i_5_n_0\ : STD_LOGIC;
  signal \counter[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter[16]_i_4_n_0\ : STD_LOGIC;
  signal \counter[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter[8]_i_5_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \counter_reg_n_0_[18]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \counter_reg_n_0_[9]\ : STD_LOGIC;
  signal last_state : STD_LOGIC;
  signal last_state_i_1_n_0 : STD_LOGIC;
  signal out_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal stable_i_1_n_0 : STD_LOGIC;
  signal stable_reg_n_0 : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \NLW_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of last_state_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of stable_i_1 : label is "soft_lutpair0";
begin
  button_out <= \^button_out\;
\counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"60FF"
    )
        port map (
      I0 => last_state,
      I1 => button_in,
      I2 => stable_reg_n_0,
      I3 => reset,
      O => \counter[0]_i_1_n_0\
    );
\counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stable_reg_n_0,
      O => p_0_in1_in
    );
\counter[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      I1 => p_0_in,
      O => \counter[0]_i_4_n_0\
    );
\counter[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[3]\,
      I1 => p_0_in,
      O => \counter[0]_i_5_n_0\
    );
\counter[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[2]\,
      I1 => p_0_in,
      O => \counter[0]_i_6_n_0\
    );
\counter[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[1]\,
      I1 => p_0_in,
      O => \counter[0]_i_7_n_0\
    );
\counter[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      I1 => p_0_in,
      O => \counter[0]_i_8_n_0\
    );
\counter[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[15]\,
      I1 => p_0_in,
      O => \counter[12]_i_2_n_0\
    );
\counter[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[14]\,
      I1 => p_0_in,
      O => \counter[12]_i_3_n_0\
    );
\counter[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[13]\,
      I1 => p_0_in,
      O => \counter[12]_i_4_n_0\
    );
\counter[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[12]\,
      I1 => p_0_in,
      O => \counter[12]_i_5_n_0\
    );
\counter[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[18]\,
      I1 => p_0_in,
      O => \counter[16]_i_2_n_0\
    );
\counter[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[17]\,
      I1 => p_0_in,
      O => \counter[16]_i_3_n_0\
    );
\counter[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[16]\,
      I1 => p_0_in,
      O => \counter[16]_i_4_n_0\
    );
\counter[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[7]\,
      I1 => p_0_in,
      O => \counter[4]_i_2_n_0\
    );
\counter[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[6]\,
      I1 => p_0_in,
      O => \counter[4]_i_3_n_0\
    );
\counter[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[5]\,
      I1 => p_0_in,
      O => \counter[4]_i_4_n_0\
    );
\counter[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[4]\,
      I1 => p_0_in,
      O => \counter[4]_i_5_n_0\
    );
\counter[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[11]\,
      I1 => p_0_in,
      O => \counter[8]_i_2_n_0\
    );
\counter[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[10]\,
      I1 => p_0_in,
      O => \counter[8]_i_3_n_0\
    );
\counter[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[9]\,
      I1 => p_0_in,
      O => \counter[8]_i_4_n_0\
    );
\counter[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \counter_reg_n_0_[8]\,
      I1 => p_0_in,
      O => \counter[8]_i_5_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[0]_i_3_n_7\,
      Q => \counter_reg_n_0_[0]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_3_n_0\,
      CO(2) => \counter_reg[0]_i_3_n_1\,
      CO(1) => \counter_reg[0]_i_3_n_2\,
      CO(0) => \counter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \counter[0]_i_4_n_0\,
      O(3) => \counter_reg[0]_i_3_n_4\,
      O(2) => \counter_reg[0]_i_3_n_5\,
      O(1) => \counter_reg[0]_i_3_n_6\,
      O(0) => \counter_reg[0]_i_3_n_7\,
      S(3) => \counter[0]_i_5_n_0\,
      S(2) => \counter[0]_i_6_n_0\,
      S(1) => \counter[0]_i_7_n_0\,
      S(0) => \counter[0]_i_8_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[8]_i_1_n_5\,
      Q => \counter_reg_n_0_[10]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[8]_i_1_n_4\,
      Q => \counter_reg_n_0_[11]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[12]_i_1_n_7\,
      Q => \counter_reg_n_0_[12]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3) => \counter[12]_i_2_n_0\,
      S(2) => \counter[12]_i_3_n_0\,
      S(1) => \counter[12]_i_4_n_0\,
      S(0) => \counter[12]_i_5_n_0\
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[12]_i_1_n_6\,
      Q => \counter_reg_n_0_[13]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[12]_i_1_n_5\,
      Q => \counter_reg_n_0_[14]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[12]_i_1_n_4\,
      Q => \counter_reg_n_0_[15]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[16]_i_1_n_7\,
      Q => \counter_reg_n_0_[16]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \NLW_counter_reg[16]_i_1_CO_UNCONNECTED\(2),
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_counter_reg[16]_i_1_O_UNCONNECTED\(3),
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3) => '1',
      S(2) => \counter[16]_i_2_n_0\,
      S(1) => \counter[16]_i_3_n_0\,
      S(0) => \counter[16]_i_4_n_0\
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[16]_i_1_n_6\,
      Q => \counter_reg_n_0_[17]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[16]_i_1_n_5\,
      Q => \counter_reg_n_0_[18]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[16]_i_1_n_0\,
      Q => p_0_in,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[0]_i_3_n_6\,
      Q => \counter_reg_n_0_[1]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[0]_i_3_n_5\,
      Q => \counter_reg_n_0_[2]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[0]_i_3_n_4\,
      Q => \counter_reg_n_0_[3]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[4]_i_1_n_7\,
      Q => \counter_reg_n_0_[4]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_3_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => \counter[4]_i_2_n_0\,
      S(2) => \counter[4]_i_3_n_0\,
      S(1) => \counter[4]_i_4_n_0\,
      S(0) => \counter[4]_i_5_n_0\
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[4]_i_1_n_6\,
      Q => \counter_reg_n_0_[5]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[4]_i_1_n_5\,
      Q => \counter_reg_n_0_[6]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[4]_i_1_n_4\,
      Q => \counter_reg_n_0_[7]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[8]_i_1_n_7\,
      Q => \counter_reg_n_0_[8]\,
      R => \counter[0]_i_1_n_0\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3) => \counter[8]_i_2_n_0\,
      S(2) => \counter[8]_i_3_n_0\,
      S(1) => \counter[8]_i_4_n_0\,
      S(0) => \counter[8]_i_5_n_0\
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => p_0_in1_in,
      D => \counter_reg[8]_i_1_n_6\,
      Q => \counter_reg_n_0_[9]\,
      R => \counter[0]_i_1_n_0\
    );
last_state_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CA00"
    )
        port map (
      I0 => last_state,
      I1 => button_in,
      I2 => stable_reg_n_0,
      I3 => reset,
      O => last_state_i_1_n_0
    );
last_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => last_state_i_1_n_0,
      Q => last_state,
      R => '0'
    );
out_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BA8A0000"
    )
        port map (
      I0 => \^button_out\,
      I1 => stable_reg_n_0,
      I2 => p_0_in,
      I3 => last_state,
      I4 => reset,
      O => out_i_1_n_0
    );
out_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => out_i_1_n_0,
      Q => \^button_out\,
      R => '0'
    );
stable_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E22EFFFF"
    )
        port map (
      I0 => p_0_in,
      I1 => stable_reg_n_0,
      I2 => button_in,
      I3 => last_state,
      I4 => reset,
      O => stable_i_1_n_0
    );
stable_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => stable_i_1_n_0,
      Q => stable_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    button_in : in STD_LOGIC;
    button_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_debounce_0_2,debounce,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "debounce,Vivado 2018.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_debounce
     port map (
      button_in => button_in,
      button_out => button_out,
      clk => clk,
      reset => reset
    );
end STRUCTURE;
