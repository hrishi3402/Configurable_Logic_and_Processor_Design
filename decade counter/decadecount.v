module decadecount(
input clk,
input reset,
output reg [3:0]q);

	always @ (posedge clk) begin
	q <= 4'd0;
		if (!reset) begin
			if (q == 4'd9)
				q <= 4'd0;
			else 
				q <= q + 1'd1;
		end
		else	
			q <= 4'd0;
		
	end
	
endmodule