/*
	FPGA slave test bench.
*/
`timescale 10ns / 1ns
`include "FPGA_slave.v"
module FPGA_slave_test;
	reg clk, sclk, rst, in_enable;
	reg [15:0] in_data;
	reg [3:0] from_ARM;
	wire dirty, out_enable, to_ARM;
	wire [7:0] out_data;
	FPGA_slave s0(.clk(clk), .rst(rst), .sclk(sclk), .in_data(in_data), .in_enable(in_enable), .from_ARM(from_ARM),
		.to_ARM(to_ARM), .out_enable(out_enable), .out_data(out_data), .dirty(dirty));

	initial begin
		$dumpfile("FPGA_slave_test.vcd");
		$dumpvars;
		rst = 0;
		clk = 0;
		sclk = 0;
	end

	always begin
		#10 clk = ~clk;
	end
	always begin
		#25 sclk = ~sclk;
	end

	initial begin
		#20 rst = 1;
		#30 in_enable = 1;
		in_data = 8'b11110011;	// 0xf3
		#10 in_enable = 0;
		#20 from_ARM = 4'b0110;
		#50 from_ARM = 4'b1100;
		#50 from_ARM = 4'b0001;
		#300 $finish;
	end

endmodule