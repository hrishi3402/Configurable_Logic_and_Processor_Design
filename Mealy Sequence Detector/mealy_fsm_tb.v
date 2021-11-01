module mealy_fsm_tb;
	
reg in;
reg clk;
reg reset;
	
wire z1;
	
Mealy_1100 uut (.in(in), .clk(clk), .reset(reset), .z1(z1));
initial
	begin
	clk = 1;
	forever #5 clk = ~clk;
end
	
initial
	begin
	in = 0;
	reset = 1;
	
	#20;
	reset = 0;
	#20;
	in = 1;
	#10;
	in = 1;
	#10;
	in = 0;
	#10;
	in = 0;
	#3;
	in=1;
	#3;
	in=1;
	#4;
	in = 0;
	#5;
	in = 0;
	#5;
	in = 0;
	#10;
	in = 1;
	#10;
	in = 1;
	#10;
	end
	
endmodule