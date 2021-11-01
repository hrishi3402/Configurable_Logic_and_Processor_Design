module vending_machine_20(
	input clk,
	input reset,
	input [1:0] in,  //00 : 0rs, 01 : 5rs,  10: 10rs
	output reg bottle,
	output reg [1:0] change); //00 : 0rs, 01 : 5rs,  10: 10rs, 11: 15rs
	
	parameter s_0 = 4'b0001, s_5 = 4'b0010, s_10 = 4'b0100, s_15 = 4'b1000;
	reg [3:0] state, next_state;	
	
	always @ (posedge clk) begin
		if (!reset)
			state <= s_0;
		else
			state <= next_state;
	end
	
	always @ (*) begin
		case (state)
			s_0 : begin
				if (in == 00) begin
					next_state = s_0;
					bottle = 0;
					change = 2'b00;
				end
				else if (in == 01) begin
					next_state = s_5;
					bottle = 0;
					change = 2'b00;
				end
				else begin
					next_state = s_10;
					bottle = 0;
					change = 2'b00;
				end	
			end
			
			s_5 : begin
				if (in == 00) begin
					next_state = s_0;
					bottle = 0;
					change = 2'b01;
				end
				else if (in == 01) begin
					next_state = s_10;
					bottle = 0;
					change = 2'b00;
				end
				else begin
					next_state = s_15;
					bottle = 0;
					change = 2'b00;
				end	
			end
			
			s_10 : begin
				if (in == 00) begin
					next_state = s_0;
					bottle = 0;
					change = 2'b10;
				end
				else if (in == 01) begin
					next_state = s_15;
					bottle = 0;
					change = 2'b00;
				end
				else begin
					next_state = s_0;
					bottle = 1;
					change = 2'b00;
				end	
			end
			
			s_15 : begin
				if (in == 00) begin
					next_state = s_0;
					bottle = 0;
					change = 2'b11;
				end
				else if (in == 01) begin
					next_state = s_0;
					bottle = 1;
					change = 2'b00;
				end
				else begin
					next_state = s_0;
					bottle = 1;
					change = 2'b01;
				end	
			end
			
		endcase
	end
	
endmodule	