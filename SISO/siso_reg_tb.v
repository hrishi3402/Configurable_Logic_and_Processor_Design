module siso_reg_tb;
reg clk;
reg areset;
reg load;
reg ena;
reg[3:0]data;
wire[3:0]q;

siso_reg dut (.clk(clk), .areset(areset), .load(load), .ena(ena), .data(data), .q(q));

initial begin
forever #10 clk = ~clk;
end

initial begin
clk = 0;
areset = 1;
load = 0;
ena = 0;
data = 4'b0000;
#20;

areset = 0;
load = 1;
ena = 0;
data = 4'b1010;
#20;

areset = 0;
load = 0;
ena = 1;
data = 4'b1010;
#20;	

areset =1;

end
endmodule