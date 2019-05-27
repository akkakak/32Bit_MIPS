module dxp_4mux2to1_v (sel, x0, x1, f);
	input sel;
	input [3:0] x0, x1;
	output [3:0]f;
	parameter num_bits=32;
	
	dxp_mux2to1_v	stage0 (sel, x0[0], x1[0], f[0]);
	dxp_mux2to1_v	stage1 (sel, x0[1], x1[1], f[1]);
	dxp_mux2to1_v	stage2 (sel, x0[2], x1[2], f[2]);
	dxp_mux2to1_v	stage3 (sel, x0[3], x1[3], f[3]);
	
endmodule
