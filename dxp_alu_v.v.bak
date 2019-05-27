module dxp_alu_v (Func_Sel, Operand_A, Operand_B, ALU_Result, ALU_Cout);

	input [3:0] Func_Sel, Operand_A, Operand_B;
	output [3:0] ALU_Result;
	output ALU_Cout;
	wire	[3:0]	AU, LU;
	wire	AU_C, LU_C;

	dxp_au_v	stage0 (Func_Sel[2:0], Operand_A, Operand_B, AU, AU_C);
	dxp_lu_v	stage1 (Func_Sel[2:1], Operand_A, Operand_B, LU, LU_C);
	dxp_4mux2to1_v	stage2	(Func_Sel[3], AU, LU, ALU_Result);
	dxp_mux2to1_v	stage3	(Func_Sel[3], AU_C, LU_C, ALU_Cout);
endmodule
