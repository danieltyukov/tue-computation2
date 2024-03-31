-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Mon Apr  1 01:16:24 2024
-- Host        : computation-virtual-machine running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /media/sf_SharedWork/Lab4/ip_repo/edit_ElevatorFSM_v1_0.srcs/sources_1/bd/design_1/ip/design_1_ElevatorFSM_0_0/design_1_ElevatorFSM_0_0_sim_netlist.vhdl
-- Design      : design_1_ElevatorFSM_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ElevatorFSM_0_0_ElevatorFSM is
  port (
    movement : out STD_LOGIC_VECTOR ( 1 downto 0 );
    floor : out STD_LOGIC_VECTOR ( 1 downto 0 );
    update : in STD_LOGIC;
    slv_reg3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    motor_control : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ElevatorFSM_0_0_ElevatorFSM : entity is "ElevatorFSM";
end design_1_ElevatorFSM_0_0_ElevatorFSM;

architecture STRUCTURE of design_1_ElevatorFSM_0_0_ElevatorFSM is
  signal \FSM_onehot_currentState[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[6]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[0]\ : signal is "yes";
  signal \FSM_onehot_currentState_reg_n_0_[1]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[1]\ : signal is "yes";
  signal \FSM_onehot_currentState_reg_n_0_[2]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[2]\ : signal is "yes";
  signal \FSM_onehot_currentState_reg_n_0_[3]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[3]\ : signal is "yes";
  signal \FSM_onehot_currentState_reg_n_0_[4]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[4]\ : signal is "yes";
  signal \FSM_onehot_currentState_reg_n_0_[5]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[5]\ : signal is "yes";
  signal \FSM_onehot_currentState_reg_n_0_[6]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[6]\ : signal is "yes";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[0]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_currentState_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[1]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP of \FSM_onehot_currentState_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[2]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP of \FSM_onehot_currentState_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[3]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP of \FSM_onehot_currentState_reg[3]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[4]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP of \FSM_onehot_currentState_reg[4]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[5]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP of \FSM_onehot_currentState_reg[5]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[6]\ : label is "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000";
  attribute KEEP of \FSM_onehot_currentState_reg[6]\ : label is "yes";
begin
\FSM_onehot_currentState[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F3A2"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => motor_control(1),
      I2 => motor_control(0),
      I3 => \FSM_onehot_currentState_reg_n_0_[6]\,
      O => \FSM_onehot_currentState[0]_i_1_n_0\
    );
\FSM_onehot_currentState[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C08"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => motor_control(1),
      I2 => motor_control(0),
      I3 => \FSM_onehot_currentState_reg_n_0_[6]\,
      O => \FSM_onehot_currentState[1]_i_1_n_0\
    );
\FSM_onehot_currentState[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F00FE00E"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[2]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[1]\,
      I2 => motor_control(1),
      I3 => motor_control(0),
      I4 => \FSM_onehot_currentState_reg_n_0_[5]\,
      O => \FSM_onehot_currentState[2]_i_1_n_0\
    );
\FSM_onehot_currentState[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => motor_control(0),
      I1 => motor_control(1),
      I2 => \FSM_onehot_currentState_reg_n_0_[4]\,
      I3 => \FSM_onehot_currentState[3]_i_2_n_0\,
      O => \FSM_onehot_currentState[3]_i_1_n_0\
    );
\FSM_onehot_currentState[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAFF0000AAFC0000"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[3]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[5]\,
      I2 => \FSM_onehot_currentState_reg_n_0_[1]\,
      I3 => motor_control(0),
      I4 => motor_control(1),
      I5 => \FSM_onehot_currentState_reg_n_0_[2]\,
      O => \FSM_onehot_currentState[3]_i_2_n_0\
    );
\FSM_onehot_currentState[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[3]\,
      I1 => motor_control(0),
      I2 => \FSM_onehot_currentState_reg_n_0_[4]\,
      O => \FSM_onehot_currentState[4]_i_1_n_0\
    );
\FSM_onehot_currentState[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C08"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[3]\,
      I1 => motor_control(0),
      I2 => motor_control(1),
      I3 => \FSM_onehot_currentState_reg_n_0_[4]\,
      O => \FSM_onehot_currentState[5]_i_1_n_0\
    );
\FSM_onehot_currentState[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => update,
      I1 => slv_reg3(0),
      O => \FSM_onehot_currentState[6]_i_1_n_0\
    );
\FSM_onehot_currentState[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F000E00"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[2]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[1]\,
      I2 => motor_control(1),
      I3 => motor_control(0),
      I4 => \FSM_onehot_currentState_reg_n_0_[5]\,
      O => \FSM_onehot_currentState[6]_i_2_n_0\
    );
\FSM_onehot_currentState_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[0]_i_1_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[0]\,
      S => reset
    );
\FSM_onehot_currentState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[1]_i_1_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[1]\,
      R => reset
    );
\FSM_onehot_currentState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[2]_i_1_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[2]\,
      R => reset
    );
\FSM_onehot_currentState_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[3]_i_1_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[3]\,
      R => reset
    );
\FSM_onehot_currentState_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[4]_i_1_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[4]\,
      R => reset
    );
\FSM_onehot_currentState_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[5]_i_1_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[5]\,
      R => reset
    );
\FSM_onehot_currentState_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => \FSM_onehot_currentState[6]_i_1_n_0\,
      D => \FSM_onehot_currentState[6]_i_2_n_0\,
      Q => \FSM_onehot_currentState_reg_n_0_[6]\,
      R => reset
    );
\floor[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[2]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[1]\,
      I2 => \FSM_onehot_currentState_reg_n_0_[5]\,
      O => floor(0)
    );
\floor[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[3]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[4]\,
      O => floor(1)
    );
\movement[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[5]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[6]\,
      O => movement(0)
    );
\movement[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[1]\,
      I1 => \FSM_onehot_currentState_reg_n_0_[3]\,
      O => movement(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI is
  port (
    movement : out STD_LOGIC_VECTOR ( 1 downto 0 );
    floor : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wready : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    reset : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    motor_control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    update : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI : entity is "ElevatorFSM_v1_0_S00_AXI";
end design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI;

architecture STRUCTURE of design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awready0__0\ : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_wready0__0\ : STD_LOGIC;
  signal \^floor\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^movement\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rdata\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slv_reg1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slv_reg2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal slv_reg3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_awready0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \axi_rdata[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_wready0 : label is "soft_lutpair1";
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  floor(1 downto 0) <= \^floor\(1 downto 0);
  movement(1 downto 0) <= \^movement\(1 downto 0);
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rdata(1 downto 0) <= \^s00_axi_rdata\(1 downto 0);
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
ElevatorFSM_inst: entity work.design_1_ElevatorFSM_0_0_ElevatorFSM
     port map (
      floor(1 downto 0) => \^floor\(1 downto 0),
      motor_control(1 downto 0) => motor_control(1 downto 0),
      movement(1 downto 0) => \^movement\(1 downto 0),
      reset => reset,
      s00_axi_aclk => s00_axi_aclk,
      slv_reg3(0) => slv_reg3(1),
      update => update
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFF700F700F700"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => axi_awready_i_1_n_0
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => axi_awready_i_1_n_0
    );
axi_awready0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => \^s_axi_awready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \axi_awready0__0\
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awready0__0\,
      Q => \^s_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFF0800"
    )
        port map (
      I0 => reg_data_out(0),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => \^s_axi_arready\,
      I4 => \^s00_axi_rdata\(0),
      O => \axi_rdata[0]_i_1_n_0\
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => slv_reg1(0),
      I1 => slv_reg0(0),
      I2 => slv_reg3(0),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg2(0),
      O => reg_data_out(0)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFF0800"
    )
        port map (
      I0 => reg_data_out(1),
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => \^s_axi_arready\,
      I4 => \^s00_axi_rdata\(1),
      O => \axi_rdata[1]_i_1_n_0\
    );
\axi_rdata[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => slv_reg1(1),
      I1 => slv_reg0(1),
      I2 => slv_reg3(1),
      I3 => axi_araddr(3),
      I4 => axi_araddr(2),
      I5 => slv_reg2(1),
      O => reg_data_out(1)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_rdata[0]_i_1_n_0\,
      Q => \^s00_axi_rdata\(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_rdata[1]_i_1_n_0\,
      Q => \^s00_axi_rdata\(1),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \axi_wready0__0\
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_wready0__0\,
      Q => \^s00_axi_wready\,
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => motor_control(0),
      Q => slv_reg0(0),
      R => '0'
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => motor_control(1),
      Q => slv_reg0(1),
      R => '0'
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \^floor\(0),
      Q => slv_reg1(0),
      R => '0'
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \^floor\(1),
      Q => slv_reg1(1),
      R => '0'
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \^movement\(0),
      Q => slv_reg2(0),
      R => '0'
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \^movement\(1),
      Q => slv_reg2(1),
      R => '0'
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => reset,
      Q => slv_reg3(0),
      R => '0'
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => update,
      Q => slv_reg3(1),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0 is
  port (
    movement : out STD_LOGIC_VECTOR ( 1 downto 0 );
    floor : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wready : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    reset : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    motor_control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    update : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0 : entity is "ElevatorFSM_v1_0";
end design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0;

architecture STRUCTURE of design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0 is
begin
ElevatorFSM_v1_0_S00_AXI_inst: entity work.design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI
     port map (
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      floor(1 downto 0) => floor(1 downto 0),
      motor_control(1 downto 0) => motor_control(1 downto 0),
      movement(1 downto 0) => movement(1 downto 0),
      reset => reset,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(1 downto 0) => s00_axi_rdata(1 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid,
      update => update
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ElevatorFSM_0_0 is
  port (
    reset : in STD_LOGIC;
    update : in STD_LOGIC;
    motor_control : in STD_LOGIC_VECTOR ( 1 downto 0 );
    movement : out STD_LOGIC_VECTOR ( 1 downto 0 );
    floor : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_ElevatorFSM_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_ElevatorFSM_0_0 : entity is "design_1_ElevatorFSM_0_0,ElevatorFSM_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_ElevatorFSM_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_ElevatorFSM_0_0 : entity is "ElevatorFSM_v1_0,Vivado 2018.2";
end design_1_ElevatorFSM_0_0;

architecture STRUCTURE of design_1_ElevatorFSM_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^s00_axi_rdata\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn:reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rdata(31) <= \<const0>\;
  s00_axi_rdata(30) <= \<const0>\;
  s00_axi_rdata(29) <= \<const0>\;
  s00_axi_rdata(28) <= \<const0>\;
  s00_axi_rdata(27) <= \<const0>\;
  s00_axi_rdata(26) <= \<const0>\;
  s00_axi_rdata(25) <= \<const0>\;
  s00_axi_rdata(24) <= \<const0>\;
  s00_axi_rdata(23) <= \<const0>\;
  s00_axi_rdata(22) <= \<const0>\;
  s00_axi_rdata(21) <= \<const0>\;
  s00_axi_rdata(20) <= \<const0>\;
  s00_axi_rdata(19) <= \<const0>\;
  s00_axi_rdata(18) <= \<const0>\;
  s00_axi_rdata(17) <= \<const0>\;
  s00_axi_rdata(16) <= \<const0>\;
  s00_axi_rdata(15) <= \<const0>\;
  s00_axi_rdata(14) <= \<const0>\;
  s00_axi_rdata(13) <= \<const0>\;
  s00_axi_rdata(12) <= \<const0>\;
  s00_axi_rdata(11) <= \<const0>\;
  s00_axi_rdata(10) <= \<const0>\;
  s00_axi_rdata(9) <= \<const0>\;
  s00_axi_rdata(8) <= \<const0>\;
  s00_axi_rdata(7) <= \<const0>\;
  s00_axi_rdata(6) <= \<const0>\;
  s00_axi_rdata(5) <= \<const0>\;
  s00_axi_rdata(4) <= \<const0>\;
  s00_axi_rdata(3) <= \<const0>\;
  s00_axi_rdata(2) <= \<const0>\;
  s00_axi_rdata(1 downto 0) <= \^s00_axi_rdata\(1 downto 0);
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      floor(1 downto 0) => floor(1 downto 0),
      motor_control(1 downto 0) => motor_control(1 downto 0),
      movement(1 downto 0) => movement(1 downto 0),
      reset => reset,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(1 downto 0) => \^s00_axi_rdata\(1 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid,
      update => update
    );
end STRUCTURE;
