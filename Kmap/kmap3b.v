module kmap3b(
	input A,
	input B,
	input C,
	output out);
	
	assign out = (~A&~C) | (B&C) | (A& ~B);
endmodule