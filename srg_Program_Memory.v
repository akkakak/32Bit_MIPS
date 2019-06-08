module srg_Program_Memory (WriteReadn, WriteData, clk, Address, ReadData);
input WriteReadn ,clk; // if 1, write, if 0 read
input [31:0] Address;
input [7:0] WriteData;
output reg [31:0] ReadData;
reg [15:0]  ProgramMemory [7:0];

always @(posedge clk)
begin 
	if( WriteReadn == 0)
	begin
		ReadData <= {ProgramMemory [Address] [7:0], ProgramMemory[Address+1] [7:0], ProgramMemory[Address+2] [7:0], ProgramMemory[Address+3] [7:0]};
	end
	if (WriteReadn == 1)
	begin
		ProgramMemory[Address] [7:0] <= WriteData ;
	end
end
endmodule
	