How to run wave in gtkwave:

	iverilog -o outputfile_name.vvp testfile_name.v 
	vvp outputfile_name
	gtkwave outputfile_name.vcd

testfile:

	`include "functfile.v"
	initial begin
		$dumpfile("outputfile_name.vcd")
		$dumpvar(level,testfile_name)
	end
