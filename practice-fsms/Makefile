all: sim

dut: $(wildcard *.v)
	@if `grep -iq "Working DUT Implementation!" pump_fsm.v`; then echo "Working DUT Implementation!... Or is it?... No it's not!"; exit 1; fi
	@if `grep -iq "initial\|finish\|verilator" pump_fsm.v`; then echo "ERROR: keywords initial, finish, verilator not allowed in design"; exit 1; fi
	-@verilator --lint-only -Wall pump_fsm.v 2>&1 | grep pump_fsm.v | (! grep -v '* verilator\|lint-only')
	@iverilog -o dut *.v
	
build: dut

sim: dut
	@vvp dut 2>&1 | tee /dev/tty | (! grep -iq "error\|fail")
	@echo "Working DUT Implementation!"

clean:
	@rm -rf dut dut.vcd

.PHONY: all build sim 
