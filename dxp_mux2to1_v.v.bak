module dxp_mux2to1_v (s, x1, x2, f);
	input x1, x2, s;
	output f;
	wire	k, g, h;

	not (k, s);
	and (g, k, x1);
	and (h, s, x2);
	or (f, g, h);

endmodule
