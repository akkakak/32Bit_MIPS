module srg_32Bit_ALU_tb

reg [31:0] A_tb, B_tb;
reg [2:0] OperationSelect_tb;
wire [31:0] Output_tb;
wire Overflow_tb;

integer i;

srg_32Bit_ALU dut (A_tb, B_tb, OperationSelect_tb, Output_tb, Overflow_tb);


initial begin
