module half_adder(
// all IO signals of this module
// have a wire width of 1
input a,
input b,
output s ,
output c
);
// continuous signal assignments
// defined using the ' assign ' keyword
assign s = a ^ b; // bitwise XOR ^
assign c = a & b; // bitwise AND &
// module definition must be terminated
// with an 'endmodule' keyword
endmodule
