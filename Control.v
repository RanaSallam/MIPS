module control(in,RegDst,branch,MemRead,MemToReg,AluOp,MemWrite,AluSrc,RegWrite,jump,PCclr,signe,reset);
	input [5:0]in ;
	input reset;
	output reg branch,MemRead,MemWrite,AluSrc,RegWrite,jump,PCclr,signe;
	output reg [1:0] RegDst ;	
	output reg [1:0] MemToReg;
	output reg [2:0] AluOp;
 always @(in) #10 begin 
	if(!reset) begin
		//R-TYPE
		if (in == 6'b000000) begin
			RegDst=2'b01;
			MemRead=1'b0;
			MemToReg=2'b00;
			MemWrite=1'b0;	
			AluSrc=1'b0;	
			RegWrite=1'b1;
			branch=1'b0;
			jump=1'b0;
			AluOp=3'b010;
			PCclr=1'b0;
			signe=1'bx;
		end 				
		//LW
		else if (in == 6'b100011)begin
			RegDst=2'b00;
	                MemRead=1'b1;
	                MemToReg=2'b01;
                	MemWrite=1'b0;	
	                AluSrc=1'b1;	
               		RegWrite=1'b1;
	                branch=1'b0;
	                jump=1'b0;
	                AluOp=3'b000;
			PCclr=1'b0;
			signe=1'b1;
		end
		//SW
		else if(in == 6'b101011)begin
			RegDst=2'bxx;
	                MemRead=1'b0;
	                MemToReg=2'bxx;
                	MemWrite=1'b1;	
	                AluSrc=1'b1;	
               		RegWrite=1'b0;
	                branch=1'b0;
	                jump=1'b0;
	                AluOp=3'b000;
			PCclr=1'b0;
			signe=1'b1;
		end
		//beq
		else if(in == 6'b000100)begin
			RegDst=2'bxx;
	                MemRead=1'b0;
	                MemToReg=2'bxx;
                	MemWrite=1'b0;	
	                AluSrc=1'b0;	
               		RegWrite=1'b0;
	                branch=1'b1;
	                jump=1'b0;
	                AluOp=3'b001;
			PCclr=1'b0;
			signe=1'b1;
		end	
		//addi 
		else if(in == 6'b001000)begin
			RegDst=2'b00;
	                MemRead=1'b0;
	                MemToReg=2'b00;
                	MemWrite=1'b0;	
	                AluSrc=1'b1;	
               		RegWrite=1'b1;
	                branch=1'b0;
	                jump=1'b0;
	                AluOp=3'b000;
			PCclr=1'b0;
			signe=1'b1;
		end
		//andi
		else if(in == 6'b001100)begin
			RegDst=2'b00;
	                MemRead=1'b0;
	                MemToReg=2'b00;
                	MemWrite=1'b0;	
	                AluSrc=1'b1;	
               		RegWrite=1'b1;
	                branch=1'b0;
	                jump=1'b0;
	                AluOp=3'b100; 
			PCclr=1'b0;
			signe=1'b1;
		end
		//ori
		else if(in == 6'b001101)begin
			RegDst=2'b00; 
	                MemRead=1'b0;
	                MemToReg=2'b00;
                	MemWrite=1'b0;	
	                AluSrc=1'b1;	
               		RegWrite=1'b1;
	                branch=1'b0;
	                jump=1'b0;
	                AluOp=3'b101;
			PCclr=1'b0;
			signe=1'b1;
		end	
		//jal
		else if(in == 6'b000011)begin
			RegDst=2'b10;
	                MemRead=1'b0;
	                MemToReg=2'b10;
                	MemWrite=1'b0;	
	                AluSrc=1'bx;	
               		RegWrite=1'b1;
	                branch=1'bx;
	                jump=1'b1;
	                AluOp=3'bxxx;
			PCclr=1'b0;
			signe=1'bx;
		end
		//j
		else if(in == 6'b000010)begin
			RegDst=2'b10;
	                MemRead=1'b0;
	                MemToReg=2'b10;
                	MemWrite=1'b0;	
	                AluSrc=1'bx;	
               		RegWrite=1'b0;
	                branch=1'bx;
	                jump=1'b1;
	                AluOp=3'bxxx;
			PCclr=1'b0;
			signe=1'bx;
		end	

		//sll
		else if(in == 6'b000000)begin
			RegDst=2'b01;
			MemRead=1'b0;
			MemToReg=2'b00;
			MemWrite=1'b0;	
			AluSrc=1'b0;	
			RegWrite=1'b1;
			branch=1'b0;
			jump=1'b0;
			AluOp=3'b110;
			PCclr=1'b0;
			signe=1'bx;
		end					 	   
	end
	else if(reset)begin 
		RegDst=2'b00;
	        MemRead=1'b0;
	        MemToReg=1'b0;
		MemWrite=1'b0;	
	        AluSrc=1'b1;	
                RegWrite=1'b1;
	        branch=1'b0;
	        jump=1'b0;
	        AluOp=3'b000;
		PCclr=1'b1;
		signe=1'b0;
	end	
end	 	
endmodule
