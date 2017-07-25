/*	
	FPGA is the slave to receive the data from the transmitter and ARM.
	The data from transmitter will transmit to ARM to  be computed.
	Then ARM send the result back to FPGA and FPGA send it to the transmitter. 
*/
module FPGA_slave
   (clk, 
	rst, // initial data
	sclk,	// clk from ARM
	in_data,	// data from transmitter
	in_enable,	// enable data in
	from_ARM,	// data from ARM
	to_ARM, 	// data to ARM
	out_enable,	// enable data out
	out_data,	// data to transmitter
	dirty	// FPGA has data
	);
	input clk, sclk, in_enable, rst;
	input [15:0] in_data;	
	input [3:0] from_ARM;	
	output dirty, out_enable;	
	output to_ARM;	
	output [7:0] out_data;	
	reg to_ARM, dirty, out_enable;
	reg reg_sclk;	// store last sclk value.
	reg data_block;	// block0: 0-3bit, block1: 4-7bit
	reg [15:0] reg_data;	// store data from transmitter. 	
	reg [4:0] count;	// count the bit of data to ARM.
	reg [7:0] ARM_data, out_data;
 	
	always @(posedge clk) begin
		if (!rst) begin // rst bottom is pushed.
			dirty <= 0;
			out_enable <= 0;
			reg_data <= 0;
			ARM_data <= 0;
			to_ARM <= 0;
			count <= 0;
			reg_sclk <= 0;
			data_block <= 0;
		end
		else begin
		/*=============================data transmission between ARM and FPGA====================================*/
			if (sclk && !reg_sclk) begin
				/*=============================data from ARM to FPGA====================================*/
				if (!data_block) begin  // from_ARM data store in 7-4 bit.
					ARM_data[3:0] <= from_ARM;
					data_block <= 1'b1;
				end
				else begin  // from_ARM data store in 3-0 bit.
					ARM_data[7:4] <= from_ARM;
					data_block <= 1'b0;	//
					out_enable <= 1'b1;	// set out_enable
				end
				/*=============================data from FPGA to ARM====================================*/
				if (count < 16 && dirty) begin  // transmit data to ARM.
					to_ARM <= reg_data[0];
					reg_data <= reg_data >> 1;	// reg_data shift right 1 bit.
					count <= count + 1;	
				end
				else begin  // reg_data transmission complete.
					dirty <= 1'b0;	// clear dirty bit.
					count <= 1'b0;	// clear count
				end
			end

			reg_sclk = sclk;
		/*=============================data from transmitter to FPGA====================================*/
			if (in_enable) begin  // in_enable on 
				if (!dirty) begin // FPGA does not have data then FPGA receives the data from transmitter..
					reg_data = in_data;
					dirty = 1'b1;	// set dirty bit.
				end
			end
		/*=============================data from FPGA to transmitter====================================*/
			if (out_enable) begin  // out_enable on then transmit data to transmitter.
				out_data <= ARM_data;
				out_enable <= 1'b0;	// clear out_enable.
			end
		end
	end
endmodule