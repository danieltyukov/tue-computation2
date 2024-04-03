////////////////////////////////////////////////
// MMIPS.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 21-11-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

module mMIPS(
        clk,
        enable,
        rst,
        rom_dout,
        rom_wait,
        rom_addr,
        rom_r,
        ram_dout,
        ram_wait,
        ram_din,
        ram_addr,
        ram_r,
        ram_w,
        dev_dout,
        dev_din,
        dev_r,
        dev_w,
        dev_rdyr,
        dev_rdyw,
        dev_wdata,
        dev_waddr,
        dev_send_eop,
        dev_rcv_eop);
    
    input           clk;
    input           enable;
    input           rst;
    input   [31:0]  rom_dout;
    input           rom_wait;
    output  [31:0]  rom_addr;
    output  [0:0]   rom_r;
    input   [31:0]  ram_dout;
    input           ram_wait;
    output  [31:0]  ram_din;
    output  [31:0]  ram_addr;
    output  [1:0]   ram_r;
    output  [1:0]   ram_w;
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
    
    /*
     * Wires used for connecting the modules
     */
    
    //Data signals
    wire    [31:0]  bus_mux2;
    wire    [31:0]  bus_mux3;
    wire    [4:0]   bus_mux4;
    wire    [31:0]  bus_mux5;
    wire    [31:0]  bus_mux6;
    
    wire    [5:0]   bus_decoder_instr_31_26;
    wire    [31:0]  bus_decoder_instr_25_0;
    wire    [4:0]   bus_decoder_instr_25_21;
    wire    [4:0]   bus_decoder_instr_20_16;
    wire    [4:0]   bus_decoder_instr_15_11;
    wire    [15:0]  bus_decoder_instr_15_0;
    wire    [4:0]   bus_decoder_instr_10_6;
    wire    [5:0]   bus_decoder_instr_5_0;
    
    wire    [31:0]  bus_add1;
    wire    [31:0]  bus_add2;
    
    wire    [31:0]  bus_shiftleft;
    wire    [31:0]  bus_shiftleft_jmp;
    
    wire    [31:0]  bus_imm2word;
    wire    [31:0]  bus_signextendbyte;
    
    wire    [31:0]  bus_dmem_1;
    
    wire    [31:0]  bus_alu_result;
    wire    [31:0]  bus_alu_result_2;
    wire    [0:0]   bus_alu_zero;
    
    wire    [31:0]  bus_register_lo;
    wire    [31:0]  bus_register_hi;
    
    wire    [31:0]  bus_registers_1;
    wire    [31:0]  bus_registers_2;
    
    /*
     * Control signals
     */
    wire    [0:0]   bus_ctrl_enable;
    wire    [1:0]   bus_ctrl_regdst;
    wire    [1:0]   bus_ctrl_target;
    wire    [1:0]   bus_ctrl_branch;
    wire    [1:0]   bus_ctrl_memread;
    wire    [1:0]   bus_ctrl_memtoreg;
    wire    [4:0]   bus_ctrl_aluop;
    wire    [1:0]   bus_ctrl_memwrite;
    wire    [0:0]   bus_ctrl_alusrc;
    wire    [0:0]   bus_ctrl_regwrite;
    wire    [0:0]   bus_ctrl_hilo_write;
    wire    [1:0]   bus_ctrl_alusel;
    wire    [0:0]   bus_ctrl_signextend;
    wire    [0:0]   bus_ctrl_c1;
    wire    [31:0]  bus_ctrl_c4;
    wire    [4:0]   bus_ctrl_c31;
    
    wire    [0:0]   bus_dmem_wait;
    
    wire    [0:0]   bus_pipe_en;
    
    wire    [5:0]   bus_aluctrl;
    
    wire    [0:0]   bus_branch_ctrl;
    
    wire    [31:0]  bus_pc;
    
    /*
     * Hazard signals
     */
    wire    [1:0]   bus_ctrl2hazard_regdst;
    wire    [1:0]   bus_ctrl2hazard_target;
    wire    [1:0]   bus_ctrl2hazard_branch;
    wire    [1:0]   bus_ctrl2hazard_memread;
    wire    [1:0]   bus_ctrl2hazard_memtoreg;
    wire    [4:0]   bus_ctrl2hazard_aluop;
    wire    [1:0]   bus_ctrl2hazard_memwrite;
    wire    [0:0]   bus_ctrl2hazard_alusrc;
    wire    [0:0]   bus_ctrl2hazard_regwrite;
    wire    [0:0]   bus_ctrl2hazard_hilo_write;
    wire    [1:0]   bus_ctrl2hazard_alusel;
    
    wire    [0:0]   bus_hazard_hazard;
    wire    [0:0]   bus_hazard_pcwrite;
    wire    [0:0]   bus_hazard_ifidwrite;
    
    /*
     * Pipeline registers
     */
    // Instruction fecth -> Instruction decode
    wire    [31:0]  bus_if_pc;
    wire    [31:0]  bus_if_instr;
    
    // Instruction decode -> Execution
    wire    [31:0]  bus_id_pc;
    wire    [31:0]  bus_id_data_reg1;
    wire    [31:0]  bus_id_data_reg2;
    wire    [31:0]  bus_id_immediate;
    
    wire    [5:0]   bus_id_instr_5_0;
    wire    [4:0]   bus_id_instr_10_6;
    wire    [4:0]   bus_id_instr_15_11;
    wire    [4:0]   bus_id_instr_20_16;
    wire    [31:0]  bus_id_instr_25_0;
    
    wire    [4:0]   bus_id_ctrl_ex_aluop;
    wire    [1:0]   bus_id_ctrl_ex_alusel;
    wire    [1:0]   bus_id_ctrl_ex_target;
    wire    [1:0]   bus_id_ctrl_ex_regdst;
    wire    [0:0]   bus_id_ctrl_ex_alusrc;
    wire    [0:0]   bus_id_ctrl_ex_hilo_write;
    wire    [1:0]   bus_id_ctrl_mem_branch;
    wire    [1:0]   bus_id_ctrl_mem_memwrite;
    wire    [1:0]   bus_id_ctrl_mem_memread;
    wire    [0:0]   bus_id_ctrl_wb_regwrite;
    wire    [1:0]   bus_id_ctrl_wb_memtoreg;
    
    // Execution -> Memory stage
    wire    [31:0]  bus_ex_alu_result;
    wire    [0:0]   bus_ex_alu_zero;
    wire    [31:0]  bus_ex_mux5;
    wire    [4:0]   bus_ex_regdst_addr;
    
    wire    [1:0]   bus_ex_ctrl_mem_branch;
    wire    [0:0]   bus_ex_ctrl_wb_regwrite;
    wire    [1:0]   bus_ex_ctrl_wb_memtoreg;
    
    // Memory stage -> Write back stage
    wire    [31:0]  bus_mem_alu_result;
    wire    [4:0]   bus_mem_regdst_addr;
    wire    [31:0]  bus_mem_dmem_data;
    wire    [1:0]   bus_mem_ctrl_wb_memtoreg;
    wire    [0:0]   bus_mem_ctrl_wb_regwrite;
    
    /*
     * Module instantiation
     */
     
    
    /*
     * Mux
     */
    MUX2 mux1(
        .in0(bus_add1),
        .in1(bus_ex_mux5),
        .sel(bus_branch_ctrl),
        .out(rom_addr));
    
    MUX2 mux2(
        .in0(bus_id_data_reg2),
        .in1(bus_id_immediate),
        .sel(bus_id_ctrl_ex_alusrc),
        .out(bus_mux2));
    
    MUX3 #(.WIDTH(`DWORD)) mux3(
        .in0(bus_mem_alu_result),
        .in1(bus_mem_dmem_data),
        .in2(bus_signextendbyte),
        .sel(bus_mem_ctrl_wb_memtoreg),
        .out(bus_mux3));
    
    MUX3 #(.WIDTH(`AWORDREG)) mux4 (
        .in0(bus_id_instr_20_16),
        .in1(bus_id_instr_15_11),
        .in2(bus_ctrl_c31),
        .sel(bus_id_ctrl_ex_regdst),
        .out(bus_mux4));
    
    MUX3 #(.WIDTH(`DWORD)) mux5 (
        .in0(bus_add2),
        .in1(bus_shiftleft_jmp),
        .in2(bus_id_data_reg1),
        .sel(bus_id_ctrl_ex_target),
        .out(bus_mux5));
    
    MUX4 #(.WIDTH(`DWORD)) mux6(
        .in0(bus_alu_result),
        .in1(bus_register_lo),
        .in2(bus_register_hi),
        .in3(bus_if_pc),
        .sel(bus_id_ctrl_ex_alusel),
        .out(bus_mux6));

    /*
     * instruction decoder
     */
    DECODER decoder(
        .instr(bus_if_instr),
        .instr_31_26(bus_decoder_instr_31_26),
        .instr_25_0(bus_decoder_instr_25_0),
        .instr_25_21(bus_decoder_instr_25_21),
        .instr_20_16(bus_decoder_instr_20_16),
        .instr_15_11(bus_decoder_instr_15_11),
        .instr_15_0(bus_decoder_instr_15_0),
        .instr_10_6(bus_decoder_instr_10_6),
        .instr_5_0(bus_decoder_instr_5_0));
    /*
     * Ctrl module
     */
    CTRL ctrl(
        .enable(enable),
        .en(bus_ctrl_enable),
        .Opcode(bus_decoder_instr_31_26),
        .FunctionCode(bus_decoder_instr_5_0),
        .RegDst(bus_ctrl2hazard_regdst),
        .Target(bus_ctrl2hazard_target),
        .Branch(bus_ctrl2hazard_branch),
        .MemRead(bus_ctrl2hazard_memread),
        .MemtoReg(bus_ctrl2hazard_memtoreg),
        .ALUop(bus_ctrl2hazard_aluop),
        .MemWrite(bus_ctrl2hazard_memwrite),
        .ALUSrc(bus_ctrl2hazard_alusrc),
        .RegWrite(bus_ctrl2hazard_regwrite),
        .SignExtend(bus_ctrl_signextend),
        .c4(bus_ctrl_c4),
        .c1(bus_ctrl_c1),
        .c31(bus_ctrl_c31),
        .HiLoWrite(bus_ctrl2hazard_hilo_write),
        .AluSel(bus_ctrl2hazard_alusel));

    /*
     * Shift modules
     */
    SHIFTLEFT shiftleft_jmp(
        .in(bus_id_instr_25_0),
        .out(bus_shiftleft_jmp));

    SHIFTLEFT shiftleft(
        .in(bus_id_immediate),
        .out(bus_shiftleft));

    /*
     * Sign extend modules
     */
    SIGNEXTEND_BYTE signextendbyte(
        .in(bus_mem_dmem_data),
        .out(bus_signextendbyte));

    IMM2WORD imm2word(
        .in(bus_decoder_instr_15_0),
        .signextend(bus_ctrl_signextend),
        .out(bus_imm2word));

    /*
     * ALU
     */
    ALUCTRL aluctrl(
        .functionCode(bus_id_instr_5_0),
        .ALUop(bus_id_ctrl_ex_aluop),
        .Shamt(bus_id_instr_10_6),
        .ALUctrl(bus_aluctrl));

    ALU alu(
        .ctrl(bus_aluctrl),
        .a(bus_id_data_reg1),
        .b(bus_mux2),
        .r(bus_alu_result),
        .r2(bus_alu_result_2),
        .z(bus_alu_zero));

    REGFILE16 registers(
        .r_addr_reg1(bus_decoder_instr_25_21),
        .r_data_reg1(bus_registers_1),
        .r_addr_reg2(bus_decoder_instr_20_16),
        .r_data_reg2(bus_registers_2),
        .w_addr_reg(bus_mem_regdst_addr),
        .w_data_reg(bus_mux3),
        .w(bus_mem_ctrl_wb_regwrite),
        .clk(clk));

    /*
     * Adders
     */
    ADD add2(
        .a(bus_id_pc),
        .b(bus_shiftleft),
        .r(bus_add2));

    ADD add1(
        .a(bus_pc),
        .b(bus_ctrl_c4),
        .r(bus_add1));
    
    /*
     * Branch control
     */
    BRANCH_CTRL branch_ctrl(
        .BranchOp(bus_ex_ctrl_mem_branch),
        .AluZero(bus_ex_alu_zero),
        .Branch(bus_branch_ctrl));

    /*
     * Hazard
     */
    HAZARD_CTRL hazard_ctrl(
        .Hazard(bus_hazard_hazard),
        .CtrlRegDst(bus_ctrl2hazard_regdst),
        .CtrlTarget(bus_ctrl2hazard_target),
        .CtrlBranch(bus_ctrl2hazard_branch),
        .CtrlMemRead(bus_ctrl2hazard_memread),
        .CtrlMemtoReg(bus_ctrl2hazard_memtoreg),
        .CtrlALUop(bus_ctrl2hazard_aluop),
        .CtrlMemWrite(bus_ctrl2hazard_memwrite),
        .CtrlALUSrc(bus_ctrl2hazard_alusrc),
        .CtrlRegWrite(bus_ctrl2hazard_regwrite),
        .CtrlHiLoWrite(bus_ctrl2hazard_hilo_write),
        .CtrlAluSel(bus_ctrl2hazard_alusel),
        .RegDst(bus_ctrl_regdst),
        .Target(bus_ctrl_target),
        .Branch(bus_ctrl_branch),
        .MemRead(bus_ctrl_memread),
        .MemtoReg(bus_ctrl_memtoreg),
        .ALUop(bus_ctrl_aluop),
        .MemWrite(bus_ctrl_memwrite),
        .ALUSrc(bus_ctrl_alusrc),
        .RegWrite(bus_ctrl_regwrite),
        .HiLoWrite(bus_ctrl_hilo_write),
        .AluSel(bus_ctrl_alusel));

    HAZARD hazard(
        .enable(bus_ctrl_enable),
        .MEMWBRegWrite(bus_mem_ctrl_wb_regwrite),
        .EXMEMRegWrite(bus_ex_ctrl_wb_regwrite),
        .IDEXRegWrite(bus_id_ctrl_wb_regwrite),
        .IDEXRegDst(bus_id_ctrl_ex_regdst),
        .IDEXWriteRegisterRt(bus_id_instr_20_16),
        .IDEXWriteRegisterRd(bus_id_instr_15_11),
        .EXMEMWriteRegister(bus_ex_regdst_addr),
        .MEMWBWriteRegister(bus_mem_regdst_addr),
        .Instr(bus_if_instr),
        .BranchOpID(bus_id_ctrl_mem_branch),
        .BranchOpEX(bus_ex_ctrl_mem_branch),
        .dmem_wait(bus_dmem_wait),
        .imem_wait(rom_wait),
        .PCWrite(bus_hazard_pcwrite),
        .IFIDWrite(bus_hazard_ifidwrite),
        .Hazard(bus_hazard_hazard),
        .pipe_en(bus_pipe_en),
        .imem_en(rom_r));

    /*
     * Pipeline registers
     */
    //Program counter
    REGISTER #(.WIDTH(`DWORD)) pc(
        .in(rom_addr),
        .w(bus_hazard_pcwrite),
        .out(bus_pc),
        .rst(rst),
        .clk(clk));
    
    //Hi/Lo registers
    REGISTER #(.WIDTH(`DWORD)) lo(
        .in(bus_alu_result),
        .w(bus_id_ctrl_ex_hilo_write),
        .out(bus_register_lo),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`DWORD)) hi(
        .in(bus_alu_result_2),
        .w(bus_id_ctrl_ex_hilo_write),
        .out(bus_register_hi),
        .rst(rst),
        .clk(clk));

    // Instruction fecth -> Instruction decode
    REGISTER #(.WIDTH(`DWORD)) if_pc(
        .in(bus_add1),
        .w(bus_hazard_ifidwrite),
        .out(bus_if_pc),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`DWORD)) if_instr(
        .in(rom_dout),
        .w(bus_hazard_ifidwrite),
        .out(bus_if_instr),
        .rst(rst),
        .clk(clk));
    
    // Instruction decode - Execution
    REGISTER #(.WIDTH(`DWORD)) id_pc(
        .in(bus_if_pc),
        .w(bus_pipe_en),
        .out(bus_id_pc),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`DWORD))  id_data_reg1(
        .in(bus_registers_1),
        .w(bus_pipe_en),
        .out(bus_id_data_reg1),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`DWORD))  id_data_reg2(
        .in(bus_registers_2),
        .w(bus_pipe_en),
        .out(bus_id_data_reg2),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`DWORD))  id_immediate(
        .in(bus_imm2word),
        .w(bus_pipe_en),
        .out(bus_id_immediate),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`DWORD)) id_instr_25_0(
        .in(bus_decoder_instr_25_0),
        .w(bus_pipe_en),
        .out(bus_id_instr_25_0),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`AWORDREG)) id_instr_20_16(
        .in(bus_decoder_instr_20_16),
        .w(bus_pipe_en),
        .out(bus_id_instr_20_16),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`AWORDREG)) id_instr_15_11(
        .in(bus_decoder_instr_15_11),
        .w(bus_pipe_en),
        .out(bus_id_instr_15_11),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(6)) id_instr_5_0(
        .in(bus_decoder_instr_5_0),
        .w(bus_pipe_en),
        .out(bus_id_instr_5_0),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(5)) id_instr_10_6(
        .in(bus_decoder_instr_10_6),
        .w(bus_pipe_en),
        .out(bus_id_instr_10_6),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_ALUSRC)) id_ctrl_ex_alusrc(
        .in(bus_ctrl_alusrc),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_ex_alusrc),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_ALUOP)) id_ctrl_ex_aluop(
        .in(bus_ctrl_aluop),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_ex_aluop),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_REGDST)) id_ctrl_ex_regdst(
        .in(bus_ctrl_regdst),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_ex_regdst),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_TARGET)) id_ctrl_ex_target(
        .in(bus_ctrl_target),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_ex_target),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_HILO_W)) id_ctrl_ex_hilo_write(
        .in(bus_ctrl_hilo_write),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_ex_hilo_write),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_ALUSEL)) id_ctrl_ex_alusel(
        .in(bus_ctrl_alusel),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_ex_alusel),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`W_BRANCHOP)) id_ctrl_mem_branch(
        .in(bus_ctrl_branch),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_mem_branch),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`W_MEMREAD)) id_ctrl_mem_memread(
        .in(bus_ctrl_memread),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_mem_memread),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_MEMWRITE)) id_ctrl_mem_memwrite(
        .in(bus_ctrl_memwrite),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_mem_memwrite),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`W_MEMTOREG)) id_ctrl_wb_memtoreg(
        .in(bus_ctrl_memtoreg),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_wb_memtoreg),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_REGWRITE)) id_ctrl_wb_regwrite(
        .in(bus_ctrl_regwrite),
        .w(bus_pipe_en),
        .out(bus_id_ctrl_wb_regwrite),
        .rst(rst),
        .clk(clk));
    
    // Execution - Memory stage
    REGISTER #(.WIDTH(`DWORD)) ex_alu_result(
        .in(bus_mux6),
        .w(bus_pipe_en),
        .out(bus_ex_alu_result),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(1)) ex_alu_zero(
        .in(bus_alu_zero),
        .w(bus_pipe_en),
        .out(bus_ex_alu_zero),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`AWORDREG)) ex_regdst_addr(
        .in(bus_mux4),
        .w(bus_pipe_en),
        .out(bus_ex_regdst_addr),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`DWORD)) ex_mux5(
        .in(bus_mux5),
        .w(bus_pipe_en),
        .out(bus_ex_mux5),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`W_BRANCHOP)) ex_ctrl_mem_branch(
        .in(bus_id_ctrl_mem_branch),
        .w(bus_pipe_en),
        .out(bus_ex_ctrl_mem_branch),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`W_MEMTOREG)) ex_ctrl_wb_memtoreg(
        .in(bus_id_ctrl_wb_memtoreg),
        .w(bus_pipe_en),
        .out(bus_ex_ctrl_wb_memtoreg),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_REGWRITE)) ex_ctrl_wb_regwrite(
        .in(bus_id_ctrl_wb_regwrite),
        .w(bus_pipe_en),
        .out(bus_ex_ctrl_wb_regwrite),
        .rst(rst),
        .clk(clk));
    
    // Memory stage - Write back stage
    REGISTER #(.WIDTH(`DWORD)) mem_alu_result(
        .in(bus_ex_alu_result),
        .w(bus_pipe_en),
        .out(bus_mem_alu_result),
        .rst(rst),
        .clk(clk));
    
    REGISTER #(.WIDTH(`AWORDREG)) mem_regdst_addr(
        .in(bus_ex_regdst_addr),
        .w(bus_pipe_en),
        .out(bus_mem_regdst_addr),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`DWORD)) mem_dmem_data(
        .in(bus_dmem_1),
        .w(bus_pipe_en),
        .out(bus_mem_dmem_data),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_MEMTOREG)) mem_ctrl_wb_memtoreg(
        .in(bus_ex_ctrl_wb_memtoreg),
        .w(bus_pipe_en),
        .out(bus_mem_ctrl_wb_memtoreg),
        .rst(rst),
        .clk(clk));

    REGISTER #(.WIDTH(`W_REGWRITE)) mem_ctrl_wb_regwrite(
        .in(bus_ex_ctrl_wb_regwrite),
        .w(bus_pipe_en),
        .out(bus_mem_ctrl_wb_regwrite),
        .rst(rst),
        .clk(clk));
    
    /*
     * Memory device handler
     */
    MEMDEV memdev(
        .clk(clk),
        .a_read(bus_mux6),
        .a_read_reg(bus_ex_alu_result),
        .d_read(bus_dmem_1),
        .d_write(bus_id_data_reg2),
        .w(bus_id_ctrl_mem_memwrite),
        .r(bus_id_ctrl_mem_memread),
        .dmem_wait(bus_dmem_wait),
        .ram_dout(ram_dout),
        .ram_wait(ram_wait),
        .ram_w(ram_w),
        .ram_r(ram_r),
        .ram_addr(ram_addr),
        .ram_din(ram_din),
        .dev_dout(dev_din),
        .dev_rdyr(dev_rdyr),
        .dev_rdyw(dev_rdyw),
        .dev_w(dev_w),
        .dev_r(dev_r),
        .dev_din(dev_dout),
        .dev_wdata(dev_wdata),
        .dev_waddr(dev_waddr),
        .dev_rcv_eop(dev_rcv_eop),
        .dev_send_eop(dev_send_eop));
    
endmodule
