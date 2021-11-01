module moore_1100_tb();
reg clk;
reg in;
reg reset;
wire z;

moore_1100 dut (.clk(clk), .in(in), .reset(reset), .z(z));

initial begin
	forever #10 clk = ~clk;

end

initial begin
clk = 1'b0;
in = 1'b0;
reset = 1'b1;

#20;
in = 1'b1;
reset = 1'b0;

#20;
in = 1'b1;
reset = 1'b0;

#20;
in = 1'b0;
reset = 1'b0;

#20;
in = 1'b0;
reset = 1'b0;

#20;
in = 1'b1;
reset = 1'b0;

#20;
in = 1'b1;
reset = 1'b0;

#20;
in = 1'b1;
reset = 1'b0;

#20;
in = 1'b0;
reset = 1'b0;

#20;
in = 1'b1;
reset = 1'b0;

end

endmodule
