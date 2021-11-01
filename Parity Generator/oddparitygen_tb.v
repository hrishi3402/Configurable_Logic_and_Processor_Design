module oddparitygen_tb();
	reg [3:0] in;
	wire out;
	
	oddparitygen dut (.in(in), .out(out));
	
	initial begin
		in = 3'b000;
		#10;
		in = 3'b100;
		#10;
		in = 3'b101;
		#10;
		in = 3'b110;
		#10;
		in = 3'b010;
		#10;
		in = 3'b001;
		#10;
		
	end
endmodule