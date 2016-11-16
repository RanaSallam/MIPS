include "Alu.v";
include "AluControl.v";
include "Control.v";
include "DataMem.v";
include "InsMem.v";
include "Mux.v";
include "PC.v";
include "RegFile.v";
include "ShiftLeft.v";
include "SignExt.v";
include "adder.v";

module mips ();
	reg 	clk ;
	reg 	[31:0] pc_in;
	wire	[31:0] jmp_addrss , four , pc_out , ins_mem_out ,sign_out, RD1,RD2,m2_out,alu_rslt, RD ,M3_out,M4_out , adder1_out,adder2_out,sll_out,M5_out,M6_out,sll2_out; 
	wire	[4:0]  m1_out;	
	wire	[3:0]  cntr_out;
	wire	[2:0]  Aluop ;
	wire 	[1:0] RegDst ;
	wire 	[1:0] Memtoreg ;
	wire    MemRead  , Memwrite , Alusrc , Regwrite, Regw ,branch,jump, zero , and_out,jr, not_jr , PCclr; 
	wire    [4:0]Mux_43,Mux_44;
	not not1(not_jr,jr);
	and and1(Regw,Regwrite,not_jr);
	
	assign Mux_43 = 5'b11111;
	assign Mux_44 = 5'b00000;
	assign four = 32'b100;
	assign PCclr = 32'b0;
	assign reset = 32'b0;

	PC p(clk , pc_out , pc_in , PCclr);
	Ins_Mem i ( pc_out , ins_mem_out); 
	control C(ins_mem_out[31:26],RegDst,branch,MemRead,Memtoreg,Aluop,Memwrite,Alusrc,Regwrite,jump,PCclr,signe,reset);
	Mux4x1 M1 (m1_out ,ins_mem_out[15:11] , ins_mem_out[20:16], 5'b11111 , 5'b0 , RegDst );	
	sign_ext s (ins_mem_out[15:0],sign_out);

	reg_file R (clk , ins_mem_out[25:21] , ins_mem_out[20:16] , m1_out , M3_out , RD1, RD2 , Regw , reset);
	Mux32 M2(m2_out , sign_out , RD2 , Alusrc);
	Alu Alu1(RD1 , m2_out , cntr_out , zero , ins_mem_out[10:6], alu_rslt);	
	Alu_control AluControl1(Aluop,sign_out,cntr_out,jr) ;
	data_mem DataMem1(clk , Memwrite , MemRead , alu_rslt , RD, RD2) ;
	Mux4x1b M3(M3_out , RD , alu_rslt , adder1_out , 32'b0 , Memtoreg); 

	and and2(and_out,zero,branch);	
	adder A1(pc_out,four,adder1_out);
	shift_left sl2(ins_mem_out[31:0],sll2_out,reset);
	shift_left sl1(sign_out[31:0],sll_out,reset);
	assign jmp_addrss = {adder1_out[31:28], sll2_out[27:0] };
	adder A2 (adder1_out,sll_out,adder2_out); 

	Mux32 M5(M5_out , {16'b0,adder2_out[15:0]} , adder1_out , and_out);
	Mux32 M6(M6_out , jmp_addrss , M5_out , jump );	 
	Mux32 M4(M4_out , RD1 , M6_out , jr);
	initial begin
		clk = 0;
		pc_in = 0;
	end
	always @(pc_in) begin
		$monitor ("Time %g \t PC_OUT : %b \t Ins_OUT : %b \t",$time , pc_out , ins_mem_out);
	end

	always begin
		#100 clk = ~clk;
	end
	always #2 begin @(negedge clk)
		begin 
			//always @(M4_out)
				pc_in = M4_out;
		end
	end
endmodule						  
 