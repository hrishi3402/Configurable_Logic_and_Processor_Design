module d_ff_tb();
reg d,clk,reset;
wire q;

d_ff d1 (.d(d),.clk(clk),.reset(reset),.q(q));

initial begin
	forever begin
		#20 clk = ~clk;
	end
end

initial begin		
d = 1;clk = 0;reset=1;
#20 d=1;reset = 0;
#40;d=0;reset = 0;
end
endmodule
