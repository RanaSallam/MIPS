module PC(clk,out,in,PCclr);
	input wire [31:0] in;
	input clk,PCclr;
	output[31:0] out;
	reg[31:0] out;
	always @(negedge clk)
		#1 begin
			if(PCclr)
				out=0;
			else
				out=in;
		end
endmodule
