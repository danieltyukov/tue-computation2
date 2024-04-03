`timescale 1ns / 1ps
////////////////////////////////////////////////
// TESTBENCH.V
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

module testbench();
    
    reg clk, en, rst;
    
    integer f;
    integer l;
    
    integer cycles;
    integer clkgen;
    
    mMIPS_sim mMIPS_sim(
        .clk(clk),
        .en(en),
        .rst(rst)
    );
    
    //Reset and init
    initial begin
        $dumpfile("dut.fst");
        $dumpvars(0,testbench);

        clkgen = 0;
        cycles = 0;
        
        //Enable the system
        en = 1;
        #1
        
        //Reset the system
        rst = 1;
        clk = 0;
        #50 //Period/2
        clk = 1;
        #50 //Period/2
        rst = 0;
        clkgen = 1;
    end
    
    always begin
        if (clkgen == 1) begin
            clk = ~clk;
            cycles = clk ? cycles + 1 : cycles;
            #50
            if (mMIPS_sim.mMIPS.bus_pc == 32'h44) begin
                f = $fopen("../memory/ram/mips_ram.dump.hex","w");
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM00.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM01.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM02.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM03.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM04.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM05.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM06.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM07.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM08.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM09.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM10.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM11.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM12.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM13.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM14.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM15.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM16.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM17.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM18.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM19.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM20.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM21.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM22.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM23.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM24.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM25.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM26.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM27.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM28.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM29.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM30.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM31.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM32.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM33.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM34.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM35.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM36.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM37.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM38.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM39.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM40.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM41.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM42.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM43.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM44.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM45.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM46.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM47.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM48.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM49.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM50.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM51.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM52.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM53.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM54.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM55.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM56.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM57.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM58.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM59.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM60.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM61.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM62.mem.ram_block[l][31-:32]); end
                for (l=0; l<512; l=l+1) begin $fwrite(f,"%08x\n",mMIPS_sim.dmem.BRAM63.mem.ram_block[l][31-:32]); end
                $fclose(f);
                
                $display("Finished in %d cycles\n",cycles);
                $finish;
            end
        end
        else
            #1 cycles = 0;
    end

endmodule
