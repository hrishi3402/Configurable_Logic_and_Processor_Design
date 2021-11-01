module decadecount_tb ();
reg clk;
reg reset;
wire [3:0] q;

decadecount dut (.clk(clk), .reset(reset),.q(q));

always #5 clk = ~clk;

initial begin
	clk <= 0;
	reset <= 1;
	
	#10;
	reset <= 0;
	
	#100;
	reset <= 1;

	#100;
	reset <= 0;
	
	#20; 
end
endmodule