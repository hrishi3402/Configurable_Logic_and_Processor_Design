module demux1_8 (in,s,o);

input in;
input [2:0] s;
output [7:0] o;

assign o[0] = in & ~s[2] & ~s[1] & ~s[0];
assign o[1] = in & ~s[2] & ~s[1] & s[0];
assign o[2] = in & ~s[2] & s[1] & ~s[0];
assign o[3] = in & ~s[2] & s[1] & s[0];
assign o[4] = in & s[2] & ~s[1] & ~s[0];
assign o[5] = in & s[2] & ~s[1] & s[0];
assign o[6] = in & s[2] & s[1] & ~s[0];
assign o[7] = in & s[2] & s[1] & s[0];

endmodule
	