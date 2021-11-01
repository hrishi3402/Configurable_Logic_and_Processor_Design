
`timescale 1 ns / 1 ps


module tb_Serial_Adder();
	parameter SIZE = 8;

	reg CLK, RST, START;
	reg [SIZE-1:0] A, B;
	wire [SIZE:0] SUM;


	Serial_Adder UUT(SUM, CLK, RST, START, A, B);

	initial begin
		CLK = 1'b0;
		forever #5 CLK = ~CLK;
	end

	initial
		$monitor("RST = %b START = %b A = %d B = %d CURRENT_STATE = %b --- SUM = %d",
			RST,
			START,
			A,
			B,
			UUT.FSM_1.CURRENT_STATE,
			SUM
		);


	initial begin
		RST = 0; START = 0; A = 'd143; B = 'd57;
		#(10) RST = 1; START = 1;
		#(100) START = 0; A = 'd67; B = 'd33;
		#(20) START = 1;
		#(120);
	end
endmodule