module sipo(clk,si,q);
input clk;
input si;
output reg [3:0]q;
always @ (posedge clk)
begin
	q[3] <= si;
	q[2] <= q[3];
	q[1] <= q[2];
	q[0] <= q[1];

end
endmodule