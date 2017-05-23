// use tristate buffer to build a 2 to 1 mux.
module mux21(in0, in1, s, out);
input in0, in1, s;
output out;


	bufif1(out, in1, s);
	bufif0(out, in0, s);

endmodule