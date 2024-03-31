// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Mon Apr  1 01:16:24 2024
// Host        : computation-virtual-machine running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /media/sf_SharedWork/Lab4/ip_repo/edit_ElevatorFSM_v1_0.srcs/sources_1/bd/design_1/ip/design_1_ElevatorFSM_0_0/design_1_ElevatorFSM_0_0_sim_netlist.v
// Design      : design_1_ElevatorFSM_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_ElevatorFSM_0_0,ElevatorFSM_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ElevatorFSM_v1_0,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module design_1_ElevatorFSM_0_0
   (reset,
    update,
    motor_control,
    movement,
    floor,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW" *) input reset;
  input update;
  input [1:0]motor_control;
  output [1:0]movement;
  output [1:0]floor;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn:reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire [1:0]floor;
  wire [1:0]motor_control;
  wire [1:0]movement;
  wire reset;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [1:0]\^s00_axi_rdata ;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire update;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rdata[31] = \<const0> ;
  assign s00_axi_rdata[30] = \<const0> ;
  assign s00_axi_rdata[29] = \<const0> ;
  assign s00_axi_rdata[28] = \<const0> ;
  assign s00_axi_rdata[27] = \<const0> ;
  assign s00_axi_rdata[26] = \<const0> ;
  assign s00_axi_rdata[25] = \<const0> ;
  assign s00_axi_rdata[24] = \<const0> ;
  assign s00_axi_rdata[23] = \<const0> ;
  assign s00_axi_rdata[22] = \<const0> ;
  assign s00_axi_rdata[21] = \<const0> ;
  assign s00_axi_rdata[20] = \<const0> ;
  assign s00_axi_rdata[19] = \<const0> ;
  assign s00_axi_rdata[18] = \<const0> ;
  assign s00_axi_rdata[17] = \<const0> ;
  assign s00_axi_rdata[16] = \<const0> ;
  assign s00_axi_rdata[15] = \<const0> ;
  assign s00_axi_rdata[14] = \<const0> ;
  assign s00_axi_rdata[13] = \<const0> ;
  assign s00_axi_rdata[12] = \<const0> ;
  assign s00_axi_rdata[11] = \<const0> ;
  assign s00_axi_rdata[10] = \<const0> ;
  assign s00_axi_rdata[9] = \<const0> ;
  assign s00_axi_rdata[8] = \<const0> ;
  assign s00_axi_rdata[7] = \<const0> ;
  assign s00_axi_rdata[6] = \<const0> ;
  assign s00_axi_rdata[5] = \<const0> ;
  assign s00_axi_rdata[4] = \<const0> ;
  assign s00_axi_rdata[3] = \<const0> ;
  assign s00_axi_rdata[2] = \<const0> ;
  assign s00_axi_rdata[1:0] = \^s00_axi_rdata [1:0];
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .floor(floor),
        .motor_control(motor_control),
        .movement(movement),
        .reset(reset),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(\^s00_axi_rdata ),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid),
        .update(update));
endmodule

(* ORIG_REF_NAME = "ElevatorFSM" *) 
module design_1_ElevatorFSM_0_0_ElevatorFSM
   (movement,
    floor,
    update,
    slv_reg3,
    reset,
    s00_axi_aclk,
    motor_control);
  output [1:0]movement;
  output [1:0]floor;
  input update;
  input [0:0]slv_reg3;
  input reset;
  input s00_axi_aclk;
  input [1:0]motor_control;

  wire \FSM_onehot_currentState[0]_i_1_n_0 ;
  wire \FSM_onehot_currentState[1]_i_1_n_0 ;
  wire \FSM_onehot_currentState[2]_i_1_n_0 ;
  wire \FSM_onehot_currentState[3]_i_1_n_0 ;
  wire \FSM_onehot_currentState[3]_i_2_n_0 ;
  wire \FSM_onehot_currentState[4]_i_1_n_0 ;
  wire \FSM_onehot_currentState[5]_i_1_n_0 ;
  wire \FSM_onehot_currentState[6]_i_1_n_0 ;
  wire \FSM_onehot_currentState[6]_i_2_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[4] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[5] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_currentState_reg_n_0_[6] ;
  wire [1:0]floor;
  wire [1:0]motor_control;
  wire [1:0]movement;
  wire reset;
  wire s00_axi_aclk;
  wire [0:0]slv_reg3;
  wire update;

  LUT4 #(
    .INIT(16'hF3A2)) 
    \FSM_onehot_currentState[0]_i_1 
       (.I0(\FSM_onehot_currentState_reg_n_0_[0] ),
        .I1(motor_control[1]),
        .I2(motor_control[0]),
        .I3(\FSM_onehot_currentState_reg_n_0_[6] ),
        .O(\FSM_onehot_currentState[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C08)) 
    \FSM_onehot_currentState[1]_i_1 
       (.I0(\FSM_onehot_currentState_reg_n_0_[0] ),
        .I1(motor_control[1]),
        .I2(motor_control[0]),
        .I3(\FSM_onehot_currentState_reg_n_0_[6] ),
        .O(\FSM_onehot_currentState[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF00FE00E)) 
    \FSM_onehot_currentState[2]_i_1 
       (.I0(\FSM_onehot_currentState_reg_n_0_[2] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[1] ),
        .I2(motor_control[1]),
        .I3(motor_control[0]),
        .I4(\FSM_onehot_currentState_reg_n_0_[5] ),
        .O(\FSM_onehot_currentState[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF80)) 
    \FSM_onehot_currentState[3]_i_1 
       (.I0(motor_control[0]),
        .I1(motor_control[1]),
        .I2(\FSM_onehot_currentState_reg_n_0_[4] ),
        .I3(\FSM_onehot_currentState[3]_i_2_n_0 ),
        .O(\FSM_onehot_currentState[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAFF0000AAFC0000)) 
    \FSM_onehot_currentState[3]_i_2 
       (.I0(\FSM_onehot_currentState_reg_n_0_[3] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[5] ),
        .I2(\FSM_onehot_currentState_reg_n_0_[1] ),
        .I3(motor_control[0]),
        .I4(motor_control[1]),
        .I5(\FSM_onehot_currentState_reg_n_0_[2] ),
        .O(\FSM_onehot_currentState[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h32)) 
    \FSM_onehot_currentState[4]_i_1 
       (.I0(\FSM_onehot_currentState_reg_n_0_[3] ),
        .I1(motor_control[0]),
        .I2(\FSM_onehot_currentState_reg_n_0_[4] ),
        .O(\FSM_onehot_currentState[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C08)) 
    \FSM_onehot_currentState[5]_i_1 
       (.I0(\FSM_onehot_currentState_reg_n_0_[3] ),
        .I1(motor_control[0]),
        .I2(motor_control[1]),
        .I3(\FSM_onehot_currentState_reg_n_0_[4] ),
        .O(\FSM_onehot_currentState[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_currentState[6]_i_1 
       (.I0(update),
        .I1(slv_reg3),
        .O(\FSM_onehot_currentState[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0F000E00)) 
    \FSM_onehot_currentState[6]_i_2 
       (.I0(\FSM_onehot_currentState_reg_n_0_[2] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[1] ),
        .I2(motor_control[1]),
        .I3(motor_control[0]),
        .I4(\FSM_onehot_currentState_reg_n_0_[5] ),
        .O(\FSM_onehot_currentState[6]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_currentState_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[0]_i_1_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[0] ),
        .S(reset));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_currentState_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[1]_i_1_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[1] ),
        .R(reset));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_currentState_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[2]_i_1_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[2] ),
        .R(reset));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_currentState_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[3]_i_1_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[3] ),
        .R(reset));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_currentState_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[4]_i_1_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[4] ),
        .R(reset));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_currentState_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[5]_i_1_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[5] ),
        .R(reset));
  (* FSM_ENCODED_STATES = "F0S:0000001,F1U:0000010,F1S:0000100,F0D:1000000,F2U:0001000,F1D:0100000,F2S:0010000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_currentState_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\FSM_onehot_currentState[6]_i_1_n_0 ),
        .D(\FSM_onehot_currentState[6]_i_2_n_0 ),
        .Q(\FSM_onehot_currentState_reg_n_0_[6] ),
        .R(reset));
  LUT3 #(
    .INIT(8'hFE)) 
    \floor[0]_INST_0 
       (.I0(\FSM_onehot_currentState_reg_n_0_[2] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[1] ),
        .I2(\FSM_onehot_currentState_reg_n_0_[5] ),
        .O(floor[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \floor[1]_INST_0 
       (.I0(\FSM_onehot_currentState_reg_n_0_[3] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[4] ),
        .O(floor[1]));
  LUT2 #(
    .INIT(4'hE)) 
    \movement[0]_INST_0 
       (.I0(\FSM_onehot_currentState_reg_n_0_[5] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[6] ),
        .O(movement[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \movement[1]_INST_0 
       (.I0(\FSM_onehot_currentState_reg_n_0_[1] ),
        .I1(\FSM_onehot_currentState_reg_n_0_[3] ),
        .O(movement[1]));
endmodule

(* ORIG_REF_NAME = "ElevatorFSM_v1_0" *) 
module design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0
   (movement,
    floor,
    s00_axi_wready,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rvalid,
    s00_axi_rdata,
    s00_axi_bvalid,
    reset,
    s00_axi_aclk,
    motor_control,
    s00_axi_araddr,
    s00_axi_arvalid,
    update,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [1:0]movement;
  output [1:0]floor;
  output s00_axi_wready;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output s00_axi_rvalid;
  output [1:0]s00_axi_rdata;
  output s00_axi_bvalid;
  input reset;
  input s00_axi_aclk;
  input [1:0]motor_control;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input update;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire [1:0]floor;
  wire [1:0]motor_control;
  wire [1:0]movement;
  wire reset;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [1:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire update;

  design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI ElevatorFSM_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .floor(floor),
        .motor_control(motor_control),
        .movement(movement),
        .reset(reset),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid),
        .update(update));
endmodule

(* ORIG_REF_NAME = "ElevatorFSM_v1_0_S00_AXI" *) 
module design_1_ElevatorFSM_0_0_ElevatorFSM_v1_0_S00_AXI
   (movement,
    floor,
    s00_axi_wready,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rvalid,
    s00_axi_rdata,
    s00_axi_bvalid,
    reset,
    s00_axi_aclk,
    motor_control,
    s00_axi_araddr,
    s00_axi_arvalid,
    update,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [1:0]movement;
  output [1:0]floor;
  output s00_axi_wready;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output s00_axi_rvalid;
  output [1:0]s00_axi_rdata;
  output s00_axi_bvalid;
  input reset;
  input s00_axi_aclk;
  input [1:0]motor_control;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input update;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire axi_awready0__0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_1_n_0 ;
  wire \axi_rdata[1]_i_1_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0__0;
  wire [1:0]floor;
  wire [1:0]motor_control;
  wire [1:0]movement;
  wire [1:0]reg_data_out;
  wire reset;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [1:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire [1:0]slv_reg0;
  wire [1:0]slv_reg1;
  wire [1:0]slv_reg2;
  wire [1:0]slv_reg3;
  wire update;

  design_1_ElevatorFSM_0_0_ElevatorFSM ElevatorFSM_inst
       (.floor(floor),
        .motor_control(motor_control),
        .movement(movement),
        .reset(reset),
        .s00_axi_aclk(s00_axi_aclk),
        .slv_reg3(slv_reg3[1]),
        .update(update));
  LUT6 #(
    .INIT(64'hF7FFF700F700F700)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready0
       (.I0(aw_en_reg_n_0),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(axi_awready0__0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0__0),
        .Q(S_AXI_AWREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(S_AXI_AWREADY),
        .I1(s00_axi_wready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFBFF0800)) 
    \axi_rdata[0]_i_1 
       (.I0(reg_data_out[0]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(S_AXI_ARREADY),
        .I4(s00_axi_rdata[0]),
        .O(\axi_rdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_2 
       (.I0(slv_reg1[0]),
        .I1(slv_reg0[0]),
        .I2(slv_reg3[0]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[0]),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'hFBFF0800)) 
    \axi_rdata[1]_i_1 
       (.I0(reg_data_out[1]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(S_AXI_ARREADY),
        .I4(s00_axi_rdata[1]),
        .O(\axi_rdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[1]_i_2 
       (.I0(slv_reg1[1]),
        .I1(slv_reg0[1]),
        .I2(slv_reg3[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[1]),
        .O(reg_data_out[1]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_rdata[0]_i_1_n_0 ),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_rdata[1]_i_1_n_0 ),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_wready0
       (.I0(aw_en_reg_n_0),
        .I1(s00_axi_wready),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(axi_wready0__0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0__0),
        .Q(s00_axi_wready),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(motor_control[0]),
        .Q(slv_reg0[0]),
        .R(1'b0));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(motor_control[1]),
        .Q(slv_reg0[1]),
        .R(1'b0));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(floor[0]),
        .Q(slv_reg1[0]),
        .R(1'b0));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(floor[1]),
        .Q(slv_reg1[1]),
        .R(1'b0));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(movement[0]),
        .Q(slv_reg2[0]),
        .R(1'b0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(movement[1]),
        .Q(slv_reg2[1]),
        .R(1'b0));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(reset),
        .Q(slv_reg3[0]),
        .R(1'b0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(update),
        .Q(slv_reg3[1]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
