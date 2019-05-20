module dxp_lu_v (Func_Sel, Operand_A, Operand_B, lu_out, carryout);
	input [2:1] Func_Sel;
	input	[3:0] Operand_A, Operand_B;
	output reg [3:0] lu_out;
	output reg carryout;
	
	always @(Func_Sel or Operand_A or Operand_B)
	 	if (Func_Sel == 2'b00)
			begin
			lu_out <= ~Operand_A;
			carryout <= 0;
			end
		else if (Func_Sel == 2'b01)
			begin
			lu_out <= Operand_A & Operand_B;
			carryout <= 0;
			end
		else if (Func_Sel == 2'b10)
			begin
			lu_out <= Operand_A | Operand_B;
			carryout <= 0;
			end
		else if (Func_Sel == 2'b11)
			begin
			lu_out <= {Operand_A[3], Operand_A[3], Operand_A[2], Operand_A[1]};
			carryout <= Operand_A[0];
			end
endmodule
