// 4 bits full adder
`include "FullAdder.v"
module FullAdder4(a, b, Carry_In, Sum, Carry_Out);
input [3:0] a, b;
input Carry_In;
output [3:0] Sum;
output Carry_Out;
wire [3:0] Sum;
wire Carry_Out;

	FullAdder fa0 (a[0], b[0], Carry_In, Sum[0], Carry_Out1);
	FullAdder fa1 (a[1], b[1], Carry_Out1, Sum[1], Carry_Out2);
	FullAdder fa2 (a[2], b[2], Carry_Out2, Sum[2], Carry_Out3);
	FullAdder fa3 (a[3], b[3], Carry_Out3, Sum[3], Carry_Out);

endmodule