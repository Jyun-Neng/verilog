// D flip flop
module D_FF(d, q, clk, reset);
input d, clk, reset;
output q;
reg q;

	always @(posedge reset or negedge clk) begin
		if (reset) begin
			q = 1'b0; // reset
		end
			
		else
			q = d;
	end

endmodule