/*
	4 bit 2's complement test bench.
*/
`timescale 10ns / 1ns
`include "comp2_4.v"
module comp2_4_test;
	reg [3:0] in_data;
	wire [3:0] out_data;
	comp2_4 c0(.data(in_data), .out_data(out_data), .Carry_Out(Carry_Out));
	
	initial begin
		$dumpfile("comp2_4_test.vcd");
		$dumpvars;
	end

	initial begin
		#10 in_data = 4'b0110;
		#10 $finish;
	end

endmodule
