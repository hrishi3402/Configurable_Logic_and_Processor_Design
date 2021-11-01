
`timescale 1 ns / 1 ps

module Shift_Reg(DATA_OUT, CLK, RST, EN, LOAD, BIT_IN, DATA_IN);
	parameter SIZE = 8;
	
	input CLK, RST, EN, BIT_IN, LOAD;
	input [SIZE-1:0] DATA_IN;
	output reg [SIZE-1:0] DATA_OUT;
	
	always@(posedge CLK or negedge RST) begin
		if (~RST) 
			DATA_OUT <= 'b0;
		else begin
			if (EN) begin
				if (LOAD)
					DATA_OUT <= DATA_IN;
				else begin
					DATA_OUT <= {BIT_IN, DATA_OUT[SIZE-1:1]};
				end
			end
			else
				DATA_OUT <= DATA_OUT;
		end
	end

endmodule