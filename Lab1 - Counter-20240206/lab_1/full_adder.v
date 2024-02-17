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
. s(h1sum),
.c(h1Cout)
);
// another example of module instantiation
half_adder HA2 (
.a(cin ) ,
.b(h1sum),
. s(s) ,
.c(h2Cout)
);
// another example of continuous assignment
assign cout = h1Cout | h2Cout; // bitwise OR |
endmodule