module dxp_au_v (Func_Sel, Operand_A, Operand_B, au_out, carryout);
	input [2:0] Func_Sel;
	input	[3:0] Operand_A, Operand_B;
	output [3:0] au_out;
	output carryout;
	wire	[3:0] Y;
	
	dxp_Blogic_v	stage0 (Func_Sel[2], Func_Sel[1], Operand_B, Y);
	dxp_4bitadder	stage1 (Func_Sel[0], Operand_A, Y, au_out, carryout);
	
endmodule
