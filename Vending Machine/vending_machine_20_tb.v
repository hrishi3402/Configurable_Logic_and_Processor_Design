module vending_machine_20_tb();
	reg clk;
	reg reset;
	reg [1:0] in;
	wire bottle;
	wire [1:0] change;
	
	vending_machine_20 uut (.clk(clk), .reset(reset), .in(in), .bottle(bottle), .change(change));
	
	initial begin
		forever #5 clk = ~clk;
	end
	
	initial begin
		
		clk = 1;
		reset = 0;
		
		#4;
		reset = 1;
		in = 2'b01;
		
		#5;
		reset = 1;
		in = 2'b10;
		
		#6;
		reset = 1;
		in = 2'b10;
		
		#8;
		
		
	end
	
endmodule	