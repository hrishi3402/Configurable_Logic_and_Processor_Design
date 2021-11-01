
module pipo_tb();
reg clk;
reg rst;
reg [3:0]a;
wire [3:0]q;

pipo dut (.clk(clk),.rst(rst),.a(a),.q(q));


initial
clk='b1;
always #10 clk=~clk;

initial begin
a=4'b1101;rst=1'b1;
#100 rst=1'b0;
#100 a=4'b1000;
#100 rst=1'b1;
#100 rst=1'b0;
end
initial
#600 $stop;
     
endmodule 