module shift_left(in,out,reset);
	input	[31:0] in;
	input 	reset;
	output	reg [31:0] out;
	always @ (in) #3 begin
		if(!reset)
			out = in << 2;
		else out = 0; 
	end
endmodule	   
	