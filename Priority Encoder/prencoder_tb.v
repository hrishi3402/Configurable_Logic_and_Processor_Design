module prencoder_tb;
	reg [7:0]in;
	wire [2:0]pos;
	
	prencoder inst(.in(in),.pos(pos));

	initial
	begin
		in[7:0] = 8'b00000000;
		#10;
		in[7:0] = 8'b00000010;
		#10;
		in[7:0] = 8'b11010000;
		#10;
		in[7:0] = 8'b01000000;
		#10;
		in[7:0] = 8'b01101001;
		#10;
	end
	
	initial
	begin
		$monitor ($time, "in=%b, pos=%b",in,pos);
	end
	
endmodule