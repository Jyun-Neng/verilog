// 4 bits ripple carry counter
`include "T_FF.v"
module RCC4(q, clk, reset);
input clk, reset;
output [3:0] q;

	T_FF tff0 (q[0], clk, reset);
	T_FF tff1 (q[1], q[0], reset);
	T_FF tff2 (q[2], q[1], reset);
	T_FF tff3 (q[3], q[2], reset);

endmodule