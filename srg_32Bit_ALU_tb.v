module srg_32Bit_ALU_tb;

reg [31:0] A_tb, B_tb;
reg [2:0] OperationSelect_tb;
wire [31:0] Output_tb;
wire Carryout_tb;



srg_32Bit_ALU dut (A_tb, B_tb, OperationSelect_tb, Output_tb, Carryout_tb);


initial begin
// test and
OperationSelect_tb=3'b000;
testABinputs();
// test or 
OperationSelect_tb=3'b001;
testABinputs();
// test add
OperationSelect_tb=3'b010;
testABinputs();
// test sub
OperationSelect_tb=3'b110;
testABinputs();
// test stl
OperationSelect_tb=3'b111;
testABinputs();
end
//

task testABinputs;
	begin
	A_tb=32'h0000;
	B_tb= 32'h0000;
	#20000;
	A_tb=32'h1111;
	B_tb= 32'h1111;
	#20000;
	A_tb=32'hAAAA;
	B_tb= 32'h5555;
	#20000;
	A_tb=32'hAAAA;
	B_tb= 32'hAAAA;
	#20000;
	A_tb=32'hAAAA;
	B_tb= 32'hFFFF;
	#20000;
	A_tb=32'hFFFF;
	B_tb= 32'hFFFF;
	#20000;
	A_tb=32'hFF00;
	B_tb= 32'h00FF;
	#20000;
	A_tb=32'hAAAA;
	B_tb= 32'h00FF;
	#20000;
	A_tb=328;
	B_tb= 744;
	#20000;
end 
endtask
endmodule
