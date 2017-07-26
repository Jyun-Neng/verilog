/*
	4 bit 2's complement.
*/
`include "../FullAdder4/FullAdder4.v"
module comp2_4(
	input [3:0] data,
	output [3:0] out_data,
	output Carry_Out
	);
	wire [3:0] comp_data;
	wire [3:0] one, out_data;
	wire Carry_In, Carry_Out;

	not(comp_data[0], data[0]);
	not(comp_data[1], data[1]);
	not(comp_data[2], data[2]);
	not(comp_data[3], data[3]);

	FullAdder4 A0(.a(comp_data), .b(one), .Carry_In(Carry_In),
	 .Sum(out_data), .Carry_Out(Carry_Out));	// not(data) + 1
	assign one = 1;
	assign Carry_In = 0;

endmodule
