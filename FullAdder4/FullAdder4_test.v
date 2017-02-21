// 4 bit full adder test bench.
`timescale 1ns/100ps
`include "FullAdder4.v"

module FullAdder4_test;
reg [3:0] a, b;
reg Carry_In, clk;
wire [3:0] Sum;
wire Carry_Out;

	FullAdder4 A1 (a, b, Carry_In, Sum, Carry_Out);

	initial begin
		$dumpfile("FullAdder4_test.vcd");
		$dumpvars;
	end

	initial begin
		Carry_In = 0;
		clk = 0;
	end

	always
	begin
		#5 clk = ~clk;
	end

	

	always @(posedge clk) 
		
		begin
			#0 a = 0; b = 0;
			#10 a = 1; b = 1;
			#10 a = 5; b = 9;
			#10 a = 10; b = 5;
			#10 a = 15; b = 15;
			#10 $finish;
		end

endmodule