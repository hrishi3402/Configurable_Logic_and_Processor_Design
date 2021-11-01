module sipo_tb();
reg clk;
reg si;
wire [3:0]q;

sipo dut(.clk(clk),.si(si),.q(q));

initial
begin
	clk = 0;
	si = 1;
	#10;
	si = 0;
	#10;
	si = 0;
	#10;
	si = 1;
	#10;
end
	always #5 clk=~clk;

endmodule
	
	
	