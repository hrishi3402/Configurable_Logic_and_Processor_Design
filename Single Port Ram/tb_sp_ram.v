module tb_sp_ram();
reg [11:0] addr;
reg [7:0] data;
reg a, clk;
wire [7:0] data_out; 

sp_ram uut (.addr(addr), .data(data), .a(a), .clk(clk), .data_out(data_out));

initial begin
clk = 1'b1;
forever #50 clk = ~clk;
end

initial begin

	// writing data 
	a = 1;
	
	addr = 12'd0;
	data = 8'h01;
	
	#100;
	
	addr = 12'd1;
	data = 8'h02;
	
	#100;
	
	addr = 12'd2;
	data = 8'h03;
	
	#100;

	//reading the same data
	a = 0;
	addr = 12'd0;
	#100;
	
	addr = 12'd1;
	#100;
	
	addr = 12'd2;
	
end
endmodule