// My_OR gate test bench.
`timescale 10ns/100ps
`include "My_OR.v"

module My_OR_test;
reg a, b;

	My_OR Mor1(a, b, out);
	
	initial begin
		a = 0;
		b = 0;
		$dumpfile("My_OR_test.vcd");
		$dumpvars;
	end

	always begin
		#1 a = 1;
		#1 a = 0;
		#1 b = 1;
		#1 a = 1;
		#1 $finish;
	end
endmodule