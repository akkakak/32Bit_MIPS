module dxp_Blogic_v (FS2_in, FS1_in, B_in, Y_out);
	input FS2_in, FS1_in;
	input [3:0] B_in;
	output reg [3:0] Y_out;
	
	always @(FS2_in or FS1_in or B_in)
	 	if (FS2_in == 0 && FS1_in == 0)
			Y_out <= 4'b0000;
		else if (FS2_in == 0 && FS1_in == 1)
			Y_out <= B_in;
		else if (FS2_in == 1 && FS1_in == 0)
			Y_out <= ~B_in;	
		else if (FS2_in == 1 && FS1_in == 1)
			Y_out <= 4'b1111;	
endmodule
