// 2 to 1 mux test bench.
`timescale 10ns/1ns
`include "mux21.v"

module mux21_test;
reg in0, in1, s;

	mux21 mux1 (in0, in1, s, out);

	initial begin
		in0 = 0;
		in1 = 1;
		$dumpfile("mux21_test.vcd");
		$dumpvars;
	end

	always begin
		#1 s = 0;
		#1 s = 1;
		#1 $finish;
	end
endmodule