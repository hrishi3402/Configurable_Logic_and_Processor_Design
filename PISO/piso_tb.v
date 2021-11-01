module piso_tb();
reg clk,rst;
reg [3:0]a;
wire q;

piso dut(.clk(clk),.a(a),.q(q),.rst(rst));

initial
clk=1'b1;
always #10 clk=~clk;
initial begin
rst=1'b1; a=4'b1101;
#300 rst=1'b0;
#200 rst=1'b1;
#200 rst=1'b0;
end
initial
#1000 $stop;

endmodule
