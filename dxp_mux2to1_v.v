module dxp_mux2to1_v (s, x1, x2, f);
	input x1, x2, s;
	output f;

assign 	f = s ? x2 : x1;

endmodule

//this is our really cool mux
//try pulling again
