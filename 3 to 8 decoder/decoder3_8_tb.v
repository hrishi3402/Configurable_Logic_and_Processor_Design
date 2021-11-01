  module decoder3_8_tb;
reg [2:0] i;
reg e;
wire [7:0] o;

decoder3_8 dut(.i(i),.e(e),.o(o));

initial begin
e = 0; i=3'b001;
#20 e = 0; i=3'b101;
#20 e = 1; i=3'b000;
#20 e = 1; i=3'b001;
#20 e = 1; i=3'b010;
#20 e = 1; i=3'b011;
#20 e = 1; i=3'b100;
#20 e = 1; i=3'b101;
#20 e = 1; i=3'b110;
#20 e = 1; i=3'b111;
#20;
end

endmodule
