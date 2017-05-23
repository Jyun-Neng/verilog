// Use 2 input AND gate to make a OR gate.
module My_OR(a, b, out);
input a, b;
output out;

	not(n_a, a);
	not(n_b, b);
	and(y, n_a, n_b);
	not(out, y);

endmodule