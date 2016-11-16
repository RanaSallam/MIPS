module data_mem(clk , Memwrite , Memread , address , Rd , Wd);
	input clk;
	input [31:0] Wd;
	input [31:0] address;
	output [31:0] Rd;
	reg [31:0] my_memory [0:255];
	input Memread;
	input Memwrite;
	// clock 
	 always @(posedge clk) #5 begin
		if (Memwrite)
			my_memory[address[31:0]][31:0] = Wd;
	end
	 assign #5 Rd = (Memread) ? my_memory[address][31:0] : 32'bx;

	
endmodule
