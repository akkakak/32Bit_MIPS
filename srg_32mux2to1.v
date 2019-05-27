module srg_32mux2to1 (sel, x0, x1, f);
	input sel;
	input [31:0] x0, x1;
	output [31:0]f;
	parameter numBits=32;
	genvar i;
	generate
	
		for(i= 0;i<numBits; i=i+1)
		begin: mux_Stage
			dxp_mux2to1_v	stage0 (sel, x0[i], x1[i], f[i]);
			end
			
	endgenerate
endmodule