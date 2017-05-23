// S-R latch test bench.
`timescale 10ns/10ns
`include "SR_Latch.v"

module SR_Latch_test;
reg set, reset;	

	SR_Latch sr1(reset, set, q, qbar);

	initial begin
		set = 0;
		reset = 0;
		$dumpfile("SR_Latch_test.vcd");
		$dumpvars;
	end

	always begin
		#1 set = 1;
		#1 set = 0;
		#1 reset = 1;
		#1 reset = 0;
		#1 reset = 1;
		#1 set = 1;
		#1 $finish;
	end
endmodule