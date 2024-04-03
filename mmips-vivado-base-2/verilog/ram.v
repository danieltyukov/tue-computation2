////////////////////////////////////////////////
// RAM.V
//
// TU/e Eindhoven University Of Technology
// Eindhoven, The Netherlands
// 
// Created: 03-12-2013
// Author: Bergmans, G (g.bergmans@student.tue.nl)
// Based on work by Sander Stuijk
// 
// Function:
//  RAM simulator
//
// Version:
//     (27-01-2014): initial version
//
//////////////////////////////////////////////!/

`include "mmips_defines.v"

module ram(
        clk,
        enable,
        ram_dout,
        ram_wait,
        ram_din,
        ram_addr,
        ram_r,
        ram_w
    );
    
    parameter RAM_BRAM = 64;
    
    input           clk;
    input           enable;
    output  [31:0]  ram_dout;
    reg     [31:0]  ram_dout;
    output          ram_wait;
    input   [31:0]  ram_din;
    input   [31:0]  ram_addr;
    input   [1:0]   ram_r;
    input   [1:0]   ram_w;

    integer i;
    
    reg     [31:0]  addr;
    reg     [8:0]   bramaddr;
    reg     [1:0]   byteselect_before;
    reg     [1:0]   byteselect;
    reg             lblw;
    reg             lblwout;
    reg     [1:0]   w;
    reg     [1:0]   r;
    integer         bramid = 0;
    
    wire signed [31:0] DOA [RAM_BRAM-1:0];
    reg                ENA [RAM_BRAM-1:0];
    reg         [13:0] ADDRA;
    reg         [3:0]  WEA;
    reg  signed [31:0] DIA;
    wire               CLKA;
    
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
    
    //assign ram_dout = DOA[bramid];
    assign ram_wait = 1'b0;
    
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
    
    assign CLKA = !clk;
    
    initial begin
        addr = 0;
        r = 0;
        w = 0;
        lblw = 0;
    end
    
    //Handle read requests
    always @(posedge(clk))
    begin
        if (enable) begin
            //Mask for memory map
            addr = ram_addr & `RAMMASK;
            //Before updating!
            if (r == 2'b10)
                lblw = 1;
            else
                lblw = 0;
            r = ram_r;
            w = ram_w;
            byteselect = byteselect_before;
        end
    end
    
    always @(addr or w or r)
    begin
        if (enable) begin
            if (addr < `RAMSIZE)
            begin
                byteselect_before = addr[1:0];
                bramaddr = addr[10:2];
                bramid = addr[31:11];
                
                ADDRA = {bramaddr, 5'b00000};
                DIA = ram_din;
                
                //Write word
                if (w == 2'b01)
                    WEA = 4'b1111;
                else begin
                    if (w == 2'b10)
                    begin
                        //Also shift DIA. The byte to be written is always the 8 least significant bits. Shift to right memloc
                        case(byteselect_before)
                        2'b00: begin
                            WEA = 4'b1000; 
                            DIA = DIA << 24; 
                            end
                        2'b01: begin 
                            WEA = 4'b0100;
                            DIA = DIA << 16;
                            end
                        2'b10: begin
                            WEA = 4'b0010; 
                            DIA = DIA << 8;
                            end
                        2'b11: begin
                            WEA = 4'b0001; 
                            DIA = DIA << 0;
                            end
                        endcase
                    end
                    else
                        WEA = 4'b0000;
                end
                
                for (i=0; i<RAM_BRAM;i=i+1)
                    ENA[i] = 0;
                
                //Enable mem for read/write
                if ((w || r) && bramid < RAM_BRAM) begin
                    ENA[bramid] = 1;
                end
            end
        end
    end
    
    //Output
    always @(DOA[bramid][31:0] or byteselect or bramid or lblw or addr)
    begin
        if (lblw)
        begin
            case (byteselect)
            2'b00: ram_dout = {24'b0000000000000000, DOA[bramid][31:24]};
            2'b01: ram_dout = {24'b0000000000000000, DOA[bramid][23:16]};
            2'b10: ram_dout = {24'b0000000000000000, DOA[bramid][15: 8]};
            2'b11: ram_dout = {24'b0000000000000000, DOA[bramid][ 7: 0]};
            endcase
        end
        else
            ram_dout = DOA[bramid];
    end

        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram00.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM00 (.DOA(DOA[0]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[0]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram01.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM01 (.DOA(DOA[1]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[1]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram02.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM02 (.DOA(DOA[2]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[2]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram03.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM03 (.DOA(DOA[3]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[3]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram04.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM04 (.DOA(DOA[4]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[4]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram05.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM05 (.DOA(DOA[5]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[5]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram06.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM06 (.DOA(DOA[6]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[6]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram07.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM07 (.DOA(DOA[7]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[7]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram08.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM08 (.DOA(DOA[8]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[8]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram09.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM09 (.DOA(DOA[9]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[9]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram10.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM10 (.DOA(DOA[10]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[10]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram11.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM11 (.DOA(DOA[11]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[11]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram12.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM12 (.DOA(DOA[12]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[12]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram13.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM13 (.DOA(DOA[13]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[13]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram14.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM14 (.DOA(DOA[14]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[14]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram15.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM15 (.DOA(DOA[15]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[15]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram16.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM16 (.DOA(DOA[16]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[16]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram17.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM17 (.DOA(DOA[17]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[17]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram18.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM18 (.DOA(DOA[18]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[18]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram19.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM19 (.DOA(DOA[19]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[19]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram20.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM20 (.DOA(DOA[20]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[20]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram21.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM21 (.DOA(DOA[21]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[21]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram22.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM22 (.DOA(DOA[22]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[22]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram23.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM23 (.DOA(DOA[23]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[23]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram24.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM24 (.DOA(DOA[24]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[24]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram25.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM25 (.DOA(DOA[25]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[25]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram26.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM26 (.DOA(DOA[26]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[26]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram27.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM27 (.DOA(DOA[27]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[27]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram28.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM28 (.DOA(DOA[28]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[28]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram29.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM29 (.DOA(DOA[29]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[29]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram30.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM30 (.DOA(DOA[30]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[30]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram31.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM31 (.DOA(DOA[31]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[31]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram32.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM32 (.DOA(DOA[32]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[32]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram33.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM33 (.DOA(DOA[33]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[33]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram34.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM34 (.DOA(DOA[34]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[34]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram35.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM35 (.DOA(DOA[35]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[35]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram36.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM36 (.DOA(DOA[36]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[36]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram37.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM37 (.DOA(DOA[37]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[37]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram38.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM38 (.DOA(DOA[38]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[38]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram39.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM39 (.DOA(DOA[39]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[39]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram40.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM40 (.DOA(DOA[40]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[40]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram41.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM41 (.DOA(DOA[41]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[41]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram42.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM42 (.DOA(DOA[42]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[42]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram43.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM43 (.DOA(DOA[43]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[43]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram44.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM44 (.DOA(DOA[44]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[44]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram45.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM45 (.DOA(DOA[45]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[45]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram46.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM46 (.DOA(DOA[46]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[46]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram47.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM47 (.DOA(DOA[47]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[47]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram48.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM48 (.DOA(DOA[48]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[48]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram49.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM49 (.DOA(DOA[49]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[49]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram50.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM50 (.DOA(DOA[50]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[50]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram51.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM51 (.DOA(DOA[51]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[51]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram52.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM52 (.DOA(DOA[52]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[52]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram53.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM53 (.DOA(DOA[53]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[53]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram54.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM54 (.DOA(DOA[54]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[54]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram55.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM55 (.DOA(DOA[55]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[55]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram56.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM56 (.DOA(DOA[56]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[56]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram57.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM57 (.DOA(DOA[57]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[57]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram58.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM58 (.DOA(DOA[58]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[58]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram59.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM59 (.DOA(DOA[59]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[59]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram60.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM60 (.DOA(DOA[60]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[60]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram61.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM61 (.DOA(DOA[61]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[61]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram62.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM62 (.DOA(DOA[62]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[62]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
        RAMB16BWER #(.INIT_FILE("../memory/ram/mips_ram63.hex"),.SIM_DEVICE("SPARTAN6"),.DATA_WIDTH_A(36),.DATA_WIDTH_B(0),.WRITE_MODE_A("NO_CHANGE"))
            BRAM63 (.DOA(DOA[63]),.ADDRA(ADDRA),.DIA(DIA),.ENA(ENA[63]),.CLKA(CLKA),.WEA(WEA),.REGCEA(REGCEA),.RSTA(RSTA),
                .DOB(),.ADDRB(ADDRB),.DIB(DIB),.ENB(ENB),.CLKB(CLKB),.WEB(WEB),.REGCEB(REGCEB),.RSTB(RSTB),.DOPA(),.DOPB(),.DIPA(DIPA),.DIPB(DIPB));
    
endmodule
