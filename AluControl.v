module Alu_control(ALUOP,inst,control,jr);
	input[31:0] inst;
	input[2:0] ALUOP;
	output reg[3:0] control;
	output reg jr;
	initial begin
		jr = 0 ;
	end

	 always @(ALUOP or inst[31:0]) #5 begin
		casex (ALUOP)
			3'b000 : begin 
				control=4'b0010;
				jr=1'b0;
			end
			3'b110 : begin  		//sll
				control=4'b1110;
				jr=1'b0;

			end
			3'b001 : begin
				control=4'b0110;
				jr=1'b0;
			end
			3'b101 : begin
				control=4'b0001;
				jr=1'b0;
			end
			3'b100 : begin
				control=4'b0000;
				jr=1'b0;
			end
			3'b?1? : begin
				casex (inst[5:0])
					6'b100000 : begin					
						control=4'b0010;
						jr=1'b0;
					end
					6'b100010 : begin				
						control=4'b0110;
						jr=1'b0;
					end
					6'b100100 : begin						
						control=4'b0000;
						jr=1'b0;
					end
					6'b100101 : begin
						control=4'b0001;
						jr=1'b0;
					end
					6'b101010 : begin
						control=4'b0111;
						jr=1'b0;
					end
					6'b100111 : begin
						control=4'b1100;
						jr=1'b0;
					end
					6'b001000 : begin
						control=4'b1111;
						jr=1'b1;
					end
				endcase
			end
		endcase
	end
endmodule
