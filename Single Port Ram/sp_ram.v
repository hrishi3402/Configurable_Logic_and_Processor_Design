module sp_ram(input [11:0] addr,
input [7:0] data,
input a,clk,
//a=0 for read, a=1 for write
output [7:0] data_out
);

reg [7:0] memory [4095:0];
reg [11:0] addr_sel;

assign data_out = memory[addr_sel];

always @ (posedge clk) begin
	if (a)
		memory[addr] <= data;
	else
		addr_sel <= addr;	
end

endmodule
