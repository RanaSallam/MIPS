module reg_file (clk, R1 , R2 , WR , WD , Rd1, Rd2 , Regwrite,reset);
	input 	Regwrite , clk , reset ; 
	output reg [31:0] Rd1;
	output reg [31:0] Rd2;
	input  [31:0] WD ;
	input  [4:0] WR ; //rd
	//WD for write data
	//WR for write register
	//Regwrite gayya mn al controller 
	input [4:0] R1; //rs
	input [4:0] R2; //rt

	reg [31:0] REG [0:31];
	
	always @(R1 or R2) #5 begin
		Rd1=REG[R1];
		Rd2=REG[R2];
					//modification
	end

	always @(posedge clk) #5 begin
		 if(Regwrite == 1 ) begin
			if(WR==0)
				REG[0]=32'b0;
			else
				REG[WR] = WD;
		   end
	end

	initial begin
		REG[0] = 0;
		REG[1] = 0;
		REG[2] = 0;
		REG[3] = 0;
		REG[4] = 0;
		REG[5] = 0;
		REG[6] = 0;
		REG[7] = 0;
		REG[8] = 0;
		REG[9] = 0;
		REG[10]= 0;
		REG[11]= 0;
		REG[12]= 0;
		REG[13]= 0;
		REG[14]= 0;
		REG[15]= 0;
		REG[16]= 0;
		REG[17]= 0;
		REG[18]= 0;
		REG[19]= 0;
		REG[20]= 0;
		REG[21]= 0;
		REG[22]= 0;
		REG[23]= 0;
		REG[24]= 0;
		REG[25]= 0;
		REG[26]= 0;
		REG[27]= 0;
		REG[28]= 0;
		REG[29]= 0;
		REG[30]= 0;
		REG[31]= 0;
	end						
endmodule
