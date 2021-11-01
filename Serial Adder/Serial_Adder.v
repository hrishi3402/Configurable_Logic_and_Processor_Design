
`timescale 1 ns / 1 ps

module Serial_Adder(SUM, CLK, RST, START, A, B);
	parameter SIZE = 8;
	
	input CLK, RST, START;
	input [SIZE-1:0] A, B;
	output [SIZE:0] SUM;

	wire EN_OUT, LOAD, C_OUT, FA_SUM;
	wire [SIZE-1:0] A_REG_WIRE, B_REG_WIRE;
	

	reg C_IN;
	
	FSM_Controller FSM_1(EN_OUT, LOAD, START, CLK, RST);
	
	Shift_Reg A_REG(A_REG_WIRE, CLK, RST, EN_OUT, LOAD, 1'b0, A);
	
	
	Shift_Reg B_REG(B_REG_WIRE, CLK, RST, EN_OUT, LOAD, 1'b0, B);
	
	
	assign {C_OUT, FA_SUM} = A_REG_WIRE[0] + B_REG_WIRE[0] + C_IN;
	

	always@(posedge CLK or negedge RST) begin
		if (~RST)
			C_IN <= 1'b0;
		else
			C_IN <= C_OUT;
	end
	

	Shift_Reg #(.SIZE(9)) SUM_REG(SUM, CLK, RST, EN_OUT, 1'b0, FA_SUM, 'b0);	
	
endmodule




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



module FSM_Controller(EN_OUT, LOAD, START, CLK, RST);
	input START, CLK, RST;
	output reg EN_OUT, LOAD;
	
	parameter  RESET = 2'b00 , WAIT = 2'b01, WORK = 2'b10 ,END = 2'b11;
	
	reg [1:0] CURRENT_STATE, NEXT_STATE;
	reg [3:0] COUNT;
	

	always@(CURRENT_STATE or START or COUNT) begin
		case (CURRENT_STATE)
			RESET:	
				NEXT_STATE = WAIT;
			
			WAIT:
				begin
					if (START)
						NEXT_STATE = WORK;
					else
						NEXT_STATE = CURRENT_STATE;
				end
				
			WORK:
				begin
				 if (COUNT == 4'd8) 
					NEXT_STATE = END;
				 else 
					NEXT_STATE = CURRENT_STATE;
				end
				
			END:
				begin
					if (~START) 
						NEXT_STATE = WAIT;
					else
						NEXT_STATE = CURRENT_STATE;
				end
				
			default: 
				NEXT_STATE = 2'bxx;
				
		endcase
	end


	always@(posedge CLK or negedge RST) begin
		if (~RST) begin
				CURRENT_STATE <= RESET;
			COUNT <= 'b0;
		end
		else begin
			CURRENT_STATE <= NEXT_STATE;
			if (CURRENT_STATE == WAIT) 
				COUNT <= 'b0;
			else if (CURRENT_STATE == WORK)
				COUNT <= COUNT + 1'b1;
			else
				COUNT <= COUNT;
		end
	end
	

	always@(CURRENT_STATE or COUNT) begin
		if (CURRENT_STATE == WAIT) begin
			LOAD = 1'b1;
			EN_OUT = 1'b1;
		end
		else if (CURRENT_STATE == WORK) begin
			LOAD = 1'b0;
			EN_OUT = 1'b1;
		end
		else if (CURRENT_STATE == END) begin
			LOAD = 1'b0;
			EN_OUT = 1'b0;
		end
		else begin
			LOAD = 1'b0;
			EN_OUT = 1'b0;
		end
	end
		
			
endmodule