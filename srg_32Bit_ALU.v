module srg_32Bit_ALU (A, B, OperationSelect, Output, Overflow);
input [31:0] A, B;
input [2:0] OperationSelect;
output [31:0] Output;
output Overflow;

wire [31:0] notB, AdderOutput, AndOutput, OrOutput, ModifiedB, LogicOutput, ArithmeticOutput;
wire carryout;
assign notB= ~B;
srg_32Bit_CLA Adder ( A, ModifiedB, AdderOutput, carryout, OperationSelect[2]);
srg_32mux2to1 mux0  ( OperationSelect[2], B, notB, ModifiedB);

genvar i;
generate
	for (i=0; i<32; i=i+1)
		begin: LogicBlock
		and(AndOutput[i], A[i], B[i]);
		or( OrOutput[i],A[i], B[i]);
		end
endgenerate
srg_32mux2to1 mux1 ( OperationSelect[0], AndOutput, OrOutput, LogicOutput);
srg_32mux2to1 mux2 ( OperationSelect[0], AdderOutput, {32{carryout}}, ArithmeticOutput);
srg_32mux2to1 mux3 ( OperationSelect[1], LogicOutput, ArithmeticOutput, Output);

endmodule
