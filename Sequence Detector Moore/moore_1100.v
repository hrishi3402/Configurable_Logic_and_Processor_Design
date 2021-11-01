module moore_1100(
	input clk,
	input in,
	input reset,
	output z	);
	
	parameter A= 1, B= 2, C= 3, D= 4,E= 5;
	reg[2:0] state, next_state;
	
	always @ (*) begin
		case (state)
			A: next_state = in ? B : A;
			B: next_state = in ? C : A;
			C: next_state = in ? C : D;
			D: next_state = in ? B : E;
			E: next_state = in ? B : A;
		endcase
	end
	
	always @ (posedge clk) begin
		if (reset)
			state <= A;
		else
			state <= next_state;
	end
	
	assign z = (state == E);
	
endmodule
		
