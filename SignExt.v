module sign_ext (in , out);
	input [15:0]in;
	output [31:0]out;
	 assign #3 out[31:16] = {16{in[15]}};
	 assign #3 out[15:0] = in[15:0];
endmodule
