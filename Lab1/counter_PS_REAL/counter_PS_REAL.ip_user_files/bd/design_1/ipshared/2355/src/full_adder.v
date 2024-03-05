`timescale 1ns / 1ps
module full_adder(
    input a,
    input b,
    input cin ,
    output s ,
    output cout
    );
    
// wires declared using the ' wire ' keyword
wire h1sum, h1Cout, h2Cout;
// module instantiation of the custom half adder module.
// the module name 'half_adder' is followed by a user chosen
// unique identifier , 'HA1' in this instance .
// signals are connected by name using the '.' notation
half_adder HA1 (
.a(a) ,
.b(b),
.s(h1sum),
.c(h1Cout)
);
// another example of module instantiation
half_adder HA2 (
.a(cin ) ,
.b(h1sum),
.s(s) ,
.c(h2Cout)
);
// another example of continuous assignment
assign cout = h1Cout | h2Cout; // bitwise OR |

// SOMETIMES the 3 squere symbols near the file name of the top module must be done manually right click and set as top
// before creating a bitstream you must run synthesis (to run on fpga)
// bit stream is generated for "top module"
// then you open the hardware manager to connect to your fpga

endmodule
