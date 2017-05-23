// 2 to 1 mux test bench.
`timescale 10ns/1ns
`include "mux81.v"

module mux81_test;
reg [7:0] in;
reg [2:0] s;

	mux81 mux (in, s, out);

	initial begin
		in = 1;
		$dumpfile("mux81_test.vcd");
		$dumpvars;
	end

	always begin
		#1 s = 0;
		#1 in = 0;
		#1 in = 2;
		#1 s = 1;
		#1 in = 4;
		#1 s = 2;
		#1 in = 8;
		#1 s = 3;
		#1 in = 16;
		#1 s = 4;
		#1 $finish;
	end
endmodule