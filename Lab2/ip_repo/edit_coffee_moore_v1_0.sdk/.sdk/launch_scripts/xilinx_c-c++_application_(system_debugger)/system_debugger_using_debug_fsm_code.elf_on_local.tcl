connect -url tcp:127.0.0.1:3121
source /media/sf_SharedWork/Lab2/ip_repo/edit_coffee_moore_v1_0.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT2232H 1234-tulA"} -index 0
loadhw -hw /media/sf_SharedWork/Lab2/ip_repo/edit_coffee_moore_v1_0.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT2232H 1234-tulA"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT2232H 1234-tulA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT2232H 1234-tulA"} -index 0
dow /media/sf_SharedWork/Lab2/ip_repo/edit_coffee_moore_v1_0.sdk/fsm_code/Debug/fsm_code.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx HW-FTDI-TEST FT2232H 1234-tulA"} -index 0
con
