all: sim

dut:
	@iverilog -o dut *.v

build: dut

dut.fst: dut
	@vvp dut -fst
	
sim: dut.fst

view: dut.fst
	@gtkwave dut.fst &

clean:
	@rm -rf dut dut.fst

.PHONY: all build sim clean
