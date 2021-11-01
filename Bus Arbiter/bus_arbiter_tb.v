module bus_arbiter_tb();
reg clk;
reg resetn;
reg [3:1]r;
wire [3:1]g;

bus_arbiter dut (.clk(clk), .resetn(resetn), .r(r), .g(g));

initial begin
forever #10 clk = ~clk;
end

initial begin
clk = 0;
resetn = 0;
r = 000;
#20;


resetn = 1;
r = 001;
#20;


resetn = 1;
r = 011;
#20;

resetn = 1;
r = 100;
#20;

resetn = 1;
r = 010;
#20;

end

endmodule