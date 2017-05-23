// My_XOR gate test bench.
`timescale 10ns/100ps
`include "My_XOR.v"

module My_XOR_test;
reg a, b;

	My_XOR Mxor1(a, b, out);
	
	initial begin
		a = 0;
		b = 0;
		$dumpfile("My_XOR_test.vcd");
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