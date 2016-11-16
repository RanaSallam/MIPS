module Mux5 (c , a , b , sel );
	input [4:0] a,b;
	output wire [4:0]c ;
	input sel ;
	assign #3 c = (sel) ? a : b;
endmodule 

module Mux32 (c , a , b , sel );
	input [31:0] a,b;
	output wire [31:0] c ;
	input sel ;
	assign #3 c = (sel) ? a : b;
endmodule 

module Mux4x1 (d , a , b , c , m , sel);
	input [4:0] a,b,c,m ;
	output reg [4:0] d ;
	input [1:0] sel ;
	always @(sel or a or b or c) #3 begin
		case(sel)
			2'b00 : d = b;
			2'b01 : d = a;
			2'b10 : d = c;
			2'b11 : d = m;
		endcase
	end
endmodule 

module Mux4x1b (d , a , b , c , m , sel);
	input [31:0] a,b,c,m ;
	output reg [31:0] d ;
	input [1:0] sel ;
	always @(sel or a or b or c) #3 begin
		case(sel)
			2'b00 : d = b;
			2'b01 : d = a;
			2'b10 : d = c;
			2'b11 : d = m;
		endcase
	end
endmodule 
