// use AND, My_OR, NOT gate to build a XOR gate.
`include "My_OR.v"

module My_XOR(a, b, out);
input a, b;
output out;

	not(n_a, a);
	not(n_b, b);
	and(x, a, n_b);
	and(y, b, n_a);
	My_OR Mor1(x, y, out);
	
endmodule