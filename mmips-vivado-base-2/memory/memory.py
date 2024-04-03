#!/usr/bin/python3
###############################################################################
# memory.py
#
# This file provides functionality for managing the initialization files
# for the mMIPS RAM and ROM modules.
#
# Author: G. Bergmans
# 
###############################################################################

#imports
import os
import textwrap

#Helper functions
def ensure_dir(f):
    d = os.path.dirname(f)
    if not os.path.exists(d):
        os.makedirs(d)

def empty_file(path):
    print("Writing "+path+"...")
    f = open(path, "w")
    for i in range(0,int(2*1024/4)): #Number of dwords in 2kB
        f.write("00000000\n")
    f.close()
    return
    
def empty_ram():
    ensure_dir("./ram/")
    for i in range(0,64):
        empty_file("./ram/mips_ram%02d.hex"%i)
    print("done")
    return

def empty_rom():
    ensure_dir("./rom/")
    for i in range(0,48):
        empty_file("./rom/mips_rom%02d.hex"%i)
    print("done")
    return

def read_mem(romram):
    try:
        data = []
        if romram == "rom":
            for i in range(0,48):
                f = open("./rom/mips_rom%02d.hex"%i)
                for line in f.readlines():
                    data.append(int("0x"+line.strip(),base=0))
        else:
            for i in range(0,64):
                f = open("./ram/mips_ram%02d.hex"%i)
                for line in f.readlines():
                    data.append(int("0x"+line.strip(),base=0))
    except:
        print("Error reading in memory. Did you forget to create it or could the files be corrupted?")
        return
    return data

def write_mem(romram,mem):
    try:
        if romram == "rom":
            for i in range(0,48):
                f = open("./rom/mips_rom%02d.hex"%i,"w")
                for j in range(0,512):
                    f.write("%08x\n"%mem[i*512+j])
        else:
            for i in range(0,64):
                f = open("./ram/mips_ram%02d.hex"%i,"w")
                for j in range(0,512):
                    f.write("%08x\n"%mem[i*512+j])
    except:
        print("Error writing to memory. Did you create it?")
        return

#This section provides the functions that can be called by the user
def print_help(cmd):
    if cmd:
        cmd = cmd.split(" ")
        for c in cmd:
            if commands[c]:
                print("Help for command \"" + c + "\":")
                out = []
                par = commands[c][1].split("\n")
                for p in par:
                    out = out + (textwrap.wrap(p,width=76))
                print("  " + out[0].strip())
                for line in out[1:]:
                    print("    " + line.strip())
                print()
            else:
                print(c + ": no such command. Type help for a list of commands.")
    else:
        print("   Possible commands:")
        for c in sorted(commands):
            print("   " + c)

    
def create(cmd):
    cmd = cmd.strip()
    if not cmd:
        cmd = "all"
    if cmd == "rom" or cmd == "all":
        empty_rom()
    if cmd == "ram" or cmd == "all":
        empty_ram()
    if cmd not in ("rom","ram","all"):
        print("Argument \"" + cmd + "\" not recognised. Possible arguments [rom|ram|all]")
    return

def load(cmd):
    cmd = cmd.lower().split(" ")
    romram = cmd[0]
    if romram not in ("rom","ram","lcc"):
        print("Faul argument \""+romram+"\". See help for details")
        return
    try:
        addr = int(cmd[2],base=0)
        addr = addr/4 #convert from byte to dword
    except:
        addr = 0;
    try:
        fname = cmd[1]
        f = open(fname,"rb")
    except:
        print("Could not open file \""+fname+"\".")
        return
    
    datain = f.read()
    data = []
    for i in range(0,int(len(datain)/4)):
        data.append((datain[i*4]<<24) + (datain[i*4+1]<<16) + (datain[i*4+2]<<8) + (datain[i*4+3]))
    
    if romram == "lcc":
        #With lcc option, write first 96Kb to rom and everything starting at 0x400000 to ram
        mem = [];
        for i in range(0,24576): #Number of Dwords in 96kB
            if i < len(data):
                mem.append(data[i])
            else:
                mem.append(0)
        write_mem("rom",mem)
        
        mem = read_mem("ram")
        for i in range(0x100000,len(data)):
            if i-0x100000 < len(mem):
                mem[i-0x100000] = data[i]
            else:
                print("RAM section too big. File truncated.")
                break
        write_mem("ram",mem)
    else:
        mem = read_mem(romram)
        if not mem:
            print("Fatal error")
            return
        
        for d in data:
            try:
                mem[int(addr)] = d
                addr += 1
            except BaseException as e:
                print("Assignment outside of memory range. File truncated.")
                break

        if addr > 48*2048:
            print("Warning: loaded file is truncated to memory length.")
        
        write_mem(romram,mem)
    return

def load_img(cmd):
    cmd = cmd.split(" ")
    try:
        fname = cmd[0]
        f = open(fname,"rb")
        datain = f.read()
        f.close()
    except:
        print("Could not open input file. See help for syntax.")
        return
    try:
        addr = int(cmd[1],base=0)
    except:
        addr = 0x1000;
    try:
        W = int(cmd[2],base=0)
        H = int(cmd[3],base=0)
    except:
        W = 720
        H = 576
    try:
        w = int(cmd[4],base=0)
        h = int(cmd[5],base=0)
    except:
        w = 32
        h = 32
    try:
        x = int(cmd[6],base=0)
        y = int(cmd[7],base=0)
    except:
        x = 0
        y = 0
    
    grid = []
    k = 0
    for i in range(0,H):
        grid.append([])
        for j in range(0,W):
            grid[i].append(int(datain[k]))
            k = k+1
            if k>len(datain):
                print("Image is smaller than supplied size. See help for syntax")
                break
    
    try:
        crop = []
        for i in range(y,y+h):
            for j in range(x,x+h):
                crop.append(grid[i+y][j+x])
    except:
        print("Could not crop. Are the coordinates you supplied correct? See help for syntax.")
        return
    
    mem = read_mem("ram")
    if not mem:
        print("Error reading in memory. Did you create it?")
        return
        
    memexp = []
    for m in mem:
        memexp.append((m>>24)&0xFF)
        memexp.append((m>>16)&0xFF)
        memexp.append((m>>8 )&0xFF)
        memexp.append((m>>0 )&0xFF)
    i = 0
    for c in crop:
        if addr+i < len(memexp):
            memexp[addr+i] = c
            i = i+1
        else:
            print("Writing outside ram boundries.")
            return
    for i in range(0,len(mem)):
        mem[i] = (memexp[i*4]<<24) + (memexp[i*4+1]<<16) + (memexp[i*4+2]<<8) + (memexp[i*4+3])
    
    write_mem("ram",mem)
    print("Done")
    return
    
def store(cmd):
    cmd = cmd.split(" ")
    try:
        fname = cmd[0]
        f = open(fname,"wb")
    except:
        print("Faul arguments. Could not open output file. See help for syntax.")
        return
    try:
        addr = int(cmd[1],base=0)
    except:
        addr = 0
    try:
        length = int(cmd[2],base=0)
    except:
        length = 16384
    
    try:
        memf = open("./ram/mips_ram.dump.hex","r")
        data = memf.read()
        memf.close()
    except:
        print("Could not read data from dump file. Did you run the simulation succesfully?")
        return
    data = data.strip().split("\n")

    dataout = []
    #Split data in bytes
    for i in range(0,len(data)):
        data[i] = data[i].strip()
        if data[i]:
            dataout.append(int(data[i][0:2],base=16))
            dataout.append(int(data[i][2:4],base=16))
            dataout.append(int(data[i][4:6],base=16))
            dataout.append(int(data[i][6:8],base=16))
    dataout = bytearray(dataout)
    
    if addr+length > len(dataout):
        length = len(data)-addr
        if length<0:
            length = 0
        print("Length truncated to: "+str(length))
    
    f.write(dataout[addr:addr+length])
    
    f.close()
    return

def store_img(cmd):
    cmd = cmd.split(" ")
    try:
        fname = cmd[0]
        f = open(fname,"wb")
    except:
        print("Could not open output file. See help for syntax.")
        return
    
    try:
        merge_fname = cmd[1];
    except:
        merge_fname = "none"    
    try:
        if merge_fname.lower() != "none":
            mergef = open(merge_fname,"rb")
            merge = mergef.read()
            mergef.close()
        else:
            merge = "none"
    except:
        print("Could not open merge input file. See help for syntax.")
        return
    
    try:
        addr = int(cmd[2],base=0)
    except:
        addr = 0x2000;
    try:
        W = int(cmd[3],base=0)
        H = int(cmd[4],base=0)
    except:
        W = 720
        H = 576
    try:
        w = int(cmd[5],base=0)
        h = int(cmd[6],base=0)
    except:
        w = 32
        h = 32
    try:
        x = int(cmd[7],base=0)
        y = int(cmd[8],base=0)
    except:
        x = 0
        y = 0
    
    input = []
    if merge == "none":
        for i in range(0,H):
            input.append([int(0)] * W)
    else:
        k = 0
        for i in range(0,H):
            input.append([])
            for j in range(0,W):
                input[i].append(int(merge[k]))
                k = k+1

    if y+h>H or x+w>W:
        print("Crop outside the range of the image. See help for syntax.")
        return
    
    mem = []
    try:
        fin = open("./ram/mips_ram.dump.hex","r")
        for line in fin.readlines():
            mem.append(int("0x"+line.strip(),base=0))
        fin.close()
        if not mem:
            raise
    except:
        print("Could not read the dump file. Did the simulation complete successfully?")
        return
        
    img = []
    for m in mem[int(addr/4):int((addr+w*h)/4)]:
        img.append((m>>24)&0xFF)
        img.append((m>>16)&0xFF)
        img.append((m>>8 )&0xFF)
        img.append((m>>0 )&0xFF)
    
    k = 0
    for i in range(y,y+h):
        for j in range(x,x+w):
            input[i][j] = img[k]
            k = k+1
            if k>len(img):
                print("Crop doesn't fit in image. See help for syntax")
                break
    
    output = []
    for i in range(0,H):
        for j in range(0,W):
            output.append(int(input[i][j]))
    output = bytearray(output)
    f.write(output)
    
    f.close()
    
    print("Done")
    return
    
def view(cmd):
    cmd = cmd.split(" ")
    try:
        romram = cmd[0]
        if not romram in ("rom","ram"):
            raise
    except:
        print("Faul arguments. See help for syntax.")
        return
        
    try:
        faddr = int(int(cmd[1],base=0)/4)
    except:
        faddr = 0
    try:
        length = int(cmd[2])
    except:
        length = 16
    
    mem = read_mem(romram)
    if not mem:
        print("Fatal error")
        return
    
    for i in range(faddr,int((faddr+length/4))):
        if romram == "rom":
            if i > 48*2048:
                print("End of file reached")
                break
        else:
            if i > 64*2048:
                print("End of file reached")
                break
        print("    [%3x]: %08x"%(i*4,mem[i]))
    return

def set(cmd):
    cmd = cmd.split(" ")
    try:
        romram = cmd[0]
        if not romram in ("rom","ram"):
            raise
        addr = int(cmd[1],base=0)
        value = int(cmd[2],base=0)
    except:
        print("Faul argument(s). See help for more info.")
        return
    
    mem = read_mem(romram)
    mem[int(addr/4)] = (value%(2**32))
    write_mem(romram,mem)
    addr = addr - 16
    if addr<0:
        addr = 0
    view(romram + " " + str(addr) + " 36")
    return

def dump(cmd):
    cmd = cmd.split(" ")
    try:
        fname = cmd[0]
        if not fname:
            raise
    except:
        fname = "./ram/mips_ram.dump.hex"
    try:
        f = open(fname,"w")
    except:
        print("Could not open file \""+fname+"\".")
        return
    mem = read_mem("ram")
    for line in mem:
        f.write("%08x\n"%line)
    f.close()
    print("Done")
    return
    
def compare(cmd):
    cmd = cmd.split(" ")
    try:
        fname1 = cmd[0]
        if not fname1:
            raise
    except:
        print("Faul arguments. See help for syntax.")
        return
    try:
        fname2 = cmd[1]
        if not fname2:
            raise
    except:
        fname2 = "./ram/mips_ram.dump.hex"
    
    try:
        f1 = open(fname1)
        data1 = f1.read()
        f1.close()
        f2 = open(fname2)
        data2 = f2.read()
        f2.close()
    except:
        print("Could not read files. Are the supplied file names correct?")
        return
    
    #remove all whitespace
    data1 = ''.join(data1.split())
    data2 = ''.join(data2.split())
    
    if data1[0x2000 * 2:(0x2000+32*32)*2] == data2[0x2000 * 2:(0x2000+32*32)*2]: #2 characters per byte, assume image size of 32x32 and location 0x2000
        print("OK")
    else:
        print("Not identical")
    return
#This variable holds all available commands
commands = {"help" : (print_help, "help [cmd]: Print help about cmd, if cmd is ommitted, print a list of all possible commands"),
            "create" : (create, "create [rom|ram|all]: Creates empty memory files. If memoryfiles exist, they are overwritten and cleared.\n (default: all)"),
            "load" : (load, "load rom|ram|lcc fname [addr]: Load the contents of file \"fname\" in the rom/ram at address \"addr\".\n If option lcc is set, the first part of the file will be loaded in the rom, and everything starting from address 0x400000 will be loaded into ram (global variables). addr is ignored with lcc parameter.\n (default addr: 0x0)"),
            "load_img" : (load_img, "load_img fname [addr] [W H] [w h] [x y]: Load the contents of .y file \"fname\" in the ram at address \"addr\".\n W and H: width and heigth of the picture.\n w and h: width and height of the crop area.\n x and y: left-top corner of the crop area.\n (default addr: 0x1000, default W,H: 720,576, default w,h: 32,32, default x,y: 0,0)"),
            "store" : (store, "store fname [addr] [length]: Store \"length\" bytes from the ram dump file to binary file \"fname\", starting from address \"addr\".\n (default addr: 0x0, default length: 16384)"),
            "store_img" : (store_img, "store_img fname [merge_file] [addr] [W H] [w h] [x y]: Store the processed image in the ram dump file to .y file \"fname\". If \"merge_file\" is set, the output will be merged with the contents of this file (replacing the cropped area). If \"merge_file\" is set to \"none\", the cropped area is inserted into a black image.\n The W, H, w, h, x and y parameters are the same as the load_img command.\n (default merge_file: none, default addr: 0x2000, default W,H: 720,576, default w,h: 32,32, default x,y: 0,0)"),
            "view" : (view, "view rom|ram [from] [length]: Show the contents of the memory file from address \"from\" to a maximum length of \"length\".\n (default from: 0, default length: 16"),
            "set" : (set, "set rom|ram addr value: Set the memory value of the rom/ram at addres \"addr\" to value \"value\". The address should be dword-aligned, meaning that it's a multiple of 4. Value is a 32 bit number and is written in four bytes starting from addres \"addr\"."),
            "dump" : (dump, "dump [fname]: Write the contents of the ram memory files to the dumpfile \"fname\".\n (default fname: ./ram/mips_ram.dump.hex)"),
            "compare" : (compare, "compare fname1 [fname2]: Compare the memory dumps \"fname1\" and \"fname2\" for the location of the output image. An image size of 32x32 is assumed.\n (default fname2: ./ram/mips_ram.dump.hex)"),
            "exit" : (exit, "Exit memory.py")}

            
#This section provides the user interaction
print("Welcome to memory.py")
print("Type \"help\" for a list of commands.")

while (1):
    s = input(">> ")
    cmd = s.split(" ")
    cmd = cmd[0].lower()
    opt = s[len(cmd):].lower().strip()
    
    if cmd in commands:
        commands[cmd][0](opt)
    else:
        print("Command \""+cmd+"\" not found. Type help for a list of commands.")
    print()

        
