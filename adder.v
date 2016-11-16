module adder (SL , ADD , out );
	input [31:0] SL , ADD ; 
	output reg [31:0] out ;
	always@(*)
		begin
		#2	out = ADD+SL;
		end 
endmodule
