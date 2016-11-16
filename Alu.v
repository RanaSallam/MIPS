module Alu (in1 , in2 , control , zero , shift , out) ;
	input[31:0] in1;
	input[31:0] in2;
	input[3:0] control;	
	input[4:0] shift;
	output reg [31:0] out;
	output reg zero; 
	 always @(in1 or in2 or control) #5 begin
		if(control == 4'b0000)	
			out = in1 & in2;
	
		else if(control == 4'b0001)
			out = in1 | in2;

		else if(control == 4'b1110)  //sll
			out = in2 << shift;				

		else if(control == 4'b0010)
			out = in1 + in2;
			 
		else if(control == 4'b0110)
			out = in1 - in2;
	
		else if(control == 4'b0111) begin
			if(in1 > in2)
				out = 0;
			else if (in1 <= in2)
				out = 1;
		end
		else if(control == 4'b1100)
			out = ~(in1 | in2);
	end
	always @ (out)	#5 begin 
		if (out==0)
			zero = 1'b1;
		else
			zero = 1'b0;
	end
endmodule
