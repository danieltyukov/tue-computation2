SHELL := /bin/bash

.PHONEY: all dut sim view vivado clean clean-vivado

FORCE:

all: sim

dut:
	$(MAKE) -C verilog dut

sim:
	$(MAKE) -C verilog sim

view:
	$(MAKE) -C verilog view

vivado: FORCE
	@source /opt/Xilinx/Vivado/2018.2/settings64.sh; \
	cd vivado; \
	if [ ! -f project_1/project_1.xpr ]; then \
		vivado -nolog -nojournal -notrace -mode tcl -source create_project.tcl; \
	else \
		vivado -nolog -nojournal -notrace project_1/project_1.xpr; \
	fi

clean:
	$(MAKE) -C verilog clean
	
clean-vivado:
	rm -rf vivado/project_1
	rm -rf vivado/NA
	rm -rf vivado/.Xil
	rm -rf vivado/vivado*.str