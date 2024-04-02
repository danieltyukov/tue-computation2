////////////////////////////////////////////////
// ROM.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 03-12-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//  Instruction memory simulator
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

module rom(
        clk,
        enable,
        rom_dout,
        rom_wait,
        rom_addr,
        rom_r
    );
    
    parameter ROM_BRAM = 128;
    
    input           clk;
    input           enable;
    output  [31:0]  rom_dout;
    output          rom_wait;
    input   [31:0]  rom_addr;
    input   [0:0]   rom_r;
    
    integer i;
    
    reg     [31:0]  addr;
    reg     [8:0]   bramaddr;
    integer         bramid;
    reg     [31:0]  out;
    
    wire signed [31:0] DOA [ROM_BRAM-1:0];
    reg                ENA [ROM_BRAM-1:0];
    reg         [13:0] ADDRA;
    reg                CLKA;
    
    //These signals are all zero
    wire        [13:0] ADDRB;
    wire               ENB;
    wire signed [31:0] DIB;
    wire signed [3:0]  DIPB;
    wire signed [3:0]  DIPA;
    wire               CLKB;
    wire        [3:0]  WEB;
    wire               REGCEA;
    wire               REGCEB;
    wire               RSTA;
    wire               RSTB;
    wire        [3:0]  WEA;
    wire signed [31:0] DIA;
    
    assign rom_dout = out;
    assign rom_wait = 1'b0;
    
    //Zeros for bram modules
    assign ADDRB  = 13'b0;
    assign ENB    = 0;
    assign DIB    = 0;
    assign DIPB   = 4'sb0000;
    assign DIPA   = 4'sb0000;
    assign CLKB   = 0;
    assign WEB    = 4'b0;
    assign REGCEA = 0;
    assign REGCEB = 0;
    assign RSTA   = 0;
    assign RSTB   = 0;
    assign WEA    = 4'b0;
    assign DIA    = 0;
    
    always @(clk)
    begin : clock
        CLKA = !clk;
    end
    
    //Handle read requests
    always @(posedge(clk))
    begin
        if (enable) begin
            addr = rom_addr;
            //Make sure the address is word aligned
            addr = addr & 32'hFFFFFFFC;
            
            bramaddr = addr[10:2];
            bramid = addr[31:11];
            
            ADDRA = {bramaddr, 5'b00000};
            
            for (i=0; i<`ROM_BRAM;i=i+1)
                ENA[i] = 0;
            
            //Enable mem for read/write
            if (rom_r && bramid < ROM_BRAM) begin
                ENA[bramid] = 1;
            end
        end
    end
    
    always @(
        bramid or
        DOA[bramid])
    begin
        out = DOA[bramid];
    end

        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom00.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM00 (.DOA(DOA[0]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[0]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom01.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM01 (.DOA(DOA[1]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[1]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom02.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM02 (.DOA(DOA[2]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[2]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom03.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM03 (.DOA(DOA[3]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[3]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom04.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM04 (.DOA(DOA[4]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[4]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom05.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM05 (.DOA(DOA[5]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[5]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom06.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM06 (.DOA(DOA[6]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[6]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom07.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM07 (.DOA(DOA[7]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[7]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom08.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM08 (.DOA(DOA[8]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[8]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom09.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM09 (.DOA(DOA[9]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[9]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom10.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM10 (.DOA(DOA[10]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[10]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom11.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM11 (.DOA(DOA[11]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[11]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom12.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM12 (.DOA(DOA[12]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[12]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom13.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM13 (.DOA(DOA[13]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[13]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom14.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM14 (.DOA(DOA[14]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[14]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom15.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM15 (.DOA(DOA[15]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[15]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom16.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM16 (.DOA(DOA[16]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[16]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom17.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM17 (.DOA(DOA[17]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[17]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom18.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM18 (.DOA(DOA[18]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[18]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom19.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM19 (.DOA(DOA[19]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[19]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom20.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM20 (.DOA(DOA[20]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[20]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom21.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM21 (.DOA(DOA[21]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[21]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom22.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM22 (.DOA(DOA[22]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[22]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom23.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM23 (.DOA(DOA[23]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[23]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom24.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM24 (.DOA(DOA[24]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[24]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom25.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM25 (.DOA(DOA[25]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[25]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom26.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM26 (.DOA(DOA[26]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[26]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom27.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM27 (.DOA(DOA[27]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[27]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom28.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM28 (.DOA(DOA[28]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[28]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom29.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM29 (.DOA(DOA[29]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[29]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom30.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM30 (.DOA(DOA[30]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[30]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom31.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM31 (.DOA(DOA[31]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[31]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom32.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM32 (.DOA(DOA[32]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[32]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom33.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM33 (.DOA(DOA[33]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[33]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom34.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM34 (.DOA(DOA[34]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[34]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom35.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM35 (.DOA(DOA[35]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[35]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom36.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM36 (.DOA(DOA[36]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[36]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom37.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM37 (.DOA(DOA[37]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[37]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom38.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM38 (.DOA(DOA[38]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[38]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom39.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM39 (.DOA(DOA[39]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[39]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom40.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM40 (.DOA(DOA[40]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[40]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom41.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM41 (.DOA(DOA[41]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[41]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom42.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM42 (.DOA(DOA[42]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[42]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom43.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM43 (.DOA(DOA[43]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[43]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom44.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM44 (.DOA(DOA[44]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[44]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom45.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM45 (.DOA(DOA[45]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[45]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom46.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM46 (.DOA(DOA[46]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[46]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/rom/mips_rom47.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM47 (.DOA(DOA[47]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[47]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
    
    /*(* rom_style = "block" *) reg     [7:0]   mem [0:`ROMSIZE]; //ROMSIZE is in bytes: dividing by 4 gives 32 bit words
    
    reg     [31:0]  addr;
    reg     [31:0]  out;
    
    assign rom_dout = out;
    assign rom_wait = 1'b0;
    
    //Read in the memory file
    initial begin
        $readmemh("../memory/rom/mips_rom.hex",mem,0,`ROMSIZE);
    end
    
    //Handle read requests
    always @(posedge(clk))
    begin
        if (enable && rom_r) begin
            addr = rom_addr;
            //Set addr to ROMSIZE range
            addr = addr % `ROMSIZE;
            //Make sure the address is word aligned
            addr = addr & 32'hFFFFFFFC;
            
            if (addr < `ROMSIZE)
            begin
                out = {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};
            end
        end
    end
    */
endmodule
