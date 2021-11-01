module Mealy_1100(
	input clk,
	input in,
	input reset,
	output reg z1	);
	
	parameter A= 2'b00, B= 2'b01, C= 2'b11, D= 2'b10;
	reg z;
	reg[1:0] state, next_state;
	
	always @ (*) begin
		case (state)
			A : begin 
				if (in) begin
					next_state = B;
					z = 0;
					end
				else begin
					next_state = A;
					z = 0;
			   end	
			end
				
			B : begin 
				if (in) begin
					next_state = C;
					z = 0;
					end
				else begin
					next_state = A;
					z = 0;
			   end	
			end
				
			C : begin 
				if (in) begin
					next_state = C;
					z = 0;
					end
				else begin
					next_state = D;
					z = 0;
			   end	
			end
			
			D : begin 
				if (in) begin
					next_state = B;
					z = 0;
					end
				else begin
					next_state = A;
					z = 1;
			   end	
			end
					
			
		endcase
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= A;
		else
			state <= next_state;
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset)
			z1 <= 0;
		else
			z1 <= z;
	end

	
endmodule
		
