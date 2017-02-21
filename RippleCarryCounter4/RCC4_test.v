// 4 bit ripple carry counter test bench
`timescale 1ns/100ps
`include "RCC4.v"
module RCC4_test;
reg clk, reset;
wire [3:0] q;

	RCC4 rcc (q, clk, reset);

	initial begin
		reset = 1; // reset at the beginning.
		clk = 0;
		$dumpfile("RCC4_test.vcd");
		$dumpvars;
	end


	always
		#5 clk = ~clk;

	always @(negedge clk) begin

		#10 reset = 0;
		#200 $finish;
	end
	
endmodule