	module oddparitygen(
input [3:0] in,
output out);
	
	assign out = ~(in[0] ^ (in[1] ^ in[2]));

endmodule