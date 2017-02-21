// T flip flop
`include "D_FF.v"
module T_FF(q, clk, reset);
input clk, reset;
output q;
wire d;
	D_FF dff (d, q, clk, reset);
	not n1 (d, q); /* The output q connects to the input d 
					  through a not gate. */
endmodule