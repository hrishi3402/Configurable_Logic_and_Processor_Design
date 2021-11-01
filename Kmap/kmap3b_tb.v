module kmap3b_tb();
reg A,B,C;
wire out;

kmap3b dut (.A(A), .B(B), .C(C),.out(out));

initial begin
	
	A = 0;
	B = 0;
	C = 1;
	#10;
	
	A = 1;
	B = 0;
	C = 1;
	#10;
	
	A = 1;
	B = 1;
	C = 1;
	#10;
	
	A = 1;
	B = 0;
	C = 0;
	#10;

	
	end
	
endmodule