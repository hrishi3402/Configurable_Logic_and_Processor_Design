module encoder8_3(
input [7:0] i,
output [2:0] o);

or(o[2],i[4],i[5],i[6],i[7]);
or(o[1],i[7],i[6],i[3],i[2]);
or(o[0],i[1],i[3],i[5],i[7]);

endmodule
