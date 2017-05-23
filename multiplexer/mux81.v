// use 2 to 1 mux to build a 8 to 1 mux.
`include "mux21.v"

module mux81(in, s, out);
input [7:0] in;
input [2:0] s;
output out;
wire [3:0] stage1;
wire [1:0] stage2;
	
	mux21 mux1(in[0], in[1], s[0], stage1[0]);
	mux21 mux2(in[2], in[3], s[0], stage1[1]);
	mux21 mux3(in[4], in[5], s[0], stage1[2]);
	mux21 mux4(in[6], in[7], s[0], stage1[3]);
	mux21 mux5(stage1[0], stage1[1], s[1], stage2[0]);
	mux21 mux6(stage1[2], stage1[3], s[1], stage2[1]);
	mux21 mux7(stage2[0], stage2[1], s[2], out);

endmodule