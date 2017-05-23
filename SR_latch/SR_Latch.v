// S-R latch.
module SR_Latch(reset, set, q, qbar);
input reset, set;
output q, qbar;

	nor(q, reset, qbar);
	nor(qbar, set, q);

endmodule