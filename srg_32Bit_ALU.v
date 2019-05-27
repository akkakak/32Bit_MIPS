module srg_32Bit_ALU (A, B, OperationSelect, Output, Overflow);
input [31:0] A, B;
input [2:0] OperationSelect;
output [31:0] Output;
output Overflow;

wire [31:0] notB, AdderOutput, AndOutput, OrOutput, ModifiedB, LogicOutput, ArithmeticOutput;
wire carryout, intermediateoverflow;
assign notB= ~B;
srg_32Bit_CLA Adder ( A, ModifiedB, AdderOutput, carryout, OperationSelect[2]);// instantiate the adder
srg_32mux2to1 mux0  ( OperationSelect[2], B, notB, ModifiedB);// selects wether it is an addition or subtraction

genvar i;
generate
	for (i=0; i<32; i=i+1)
		begin: LogicBlock						//AND and OR gates for the AND and OR operations
		and(AndOutput[i], A[i], B[i]);
		or( OrOutput[i],A[i], B[i]);
		end
endgenerate
srg_32mux2to1 mux1 ( OperationSelect[0], AndOutput, OrOutput, LogicOutput); // Selects either the AND or OR output
srg_32mux2to1 mux2 ( OperationSelect[0], AdderOutput, {32{carryout}}, ArithmeticOutput); // selects for either the result of the addition/subtraction, or outputs the carryout bit for the set if less than instruction  
srg_32mux2to1 mux3 ( OperationSelect[1], LogicOutput, ArithmeticOutput, Output);// selects either the logical block output or arithmetic block output
xor(intermediateoverflow, carryout, AdderOutput[31]);
and( overflow, intermediateoverflow, OperationSelect[1]);
endmodule
