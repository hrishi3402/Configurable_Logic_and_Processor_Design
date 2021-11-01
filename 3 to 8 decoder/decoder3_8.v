module decoder3_8(
input [2:0] i,
input e,
output [7:0] o);



assign o[0] = e&(~i[2])&(~i[1])&(~i[0]);
assign o[1] = e&(~i[2])&(~i[1])&(i[0]);
assign o[2] = e&(~i[2])&(i[1])&(~i[0]);
assign o[3] = e&(~i[2])&(i[1])&(i[0]);
assign o[4] = e&(i[2])&(~i[1])&(~i[0]);
assign o[5] = e&(i[2])&(~i[1])&(i[0]);
assign o[6] = e&(i[2])&(i[1])&(~i[0]);
assign o[7] = e&(i[2])&(i[1])&(i[0]);


endmodule
