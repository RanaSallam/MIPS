module Ins_Mem (address , data);
	input [31:0] address;
	output [31:0] data;
	reg [31:0] my_memory [0:255];
	 initial #5 begin
		$readmemb("InsMemData.txt", my_memory);
	end
	assign	data = my_memory[address[31:2]][31:0];
endmodule
