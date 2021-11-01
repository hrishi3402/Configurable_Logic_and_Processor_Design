module bit8_mult (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk);
 input LdA, LdB, LdP, clrP, decB, clk;
 input [15:0] data_in;
 output eqz;
 wire [15:0] X, Y, Z, Bout, data_in;
 PIPO1 A (X, data_in, LdA, clk);
 PIPO2 P (Y, Z, LdP, clrP, clk);
 CNTR B (Bout, data_in, LdB, decB, clk);
 ADD AD (Z, X, Y);
 EQZ COMP (eqz, Bout);
endmodule

module PIPO1 (dout, din, ld, clk);
 input [15:0] din;
 input ld, clk;
 output reg [15:0] dout;
 always @(posedge clk)
 if (ld) dout <= din;
endmodule

module ADD (out, in1, in2);
 input [15:0] in1, in2;
 output reg [15:0] out;
 always @(*)
 out = in1 + in2;
endmodule

module PIPO2 (dout, din, ld,clr, clk);
 input [15:0] din;
 input ld, clr, clk;
 output reg [15:0] dout;
 always @(posedge clk)
 if (clr) dout <= 16'b0;
 else if (ld) dout <= din;
endmodule

module EQZ (eqz, data);
 input [15:0] data;
 output eqz;
 assign eqz = (data == 0);
endmodule

module CNTR (dout, din, ld, dec, clk);
 input [15:0] din;
 input ld, dec, clk;
 output reg [15:0] dout;
 always @(posedge clk)
 if (ld) dout <= din;
 else if (dec) dout <= dout - 1;
endmodule 

module controller (LdA, LdB, LdP, clrP, decB, done, clk, eqz, start);
 input clk, eqz, start;
 output reg LdA, LdB, LdP, clrP, decB, done;
 reg [2:0] state, next_state;
 parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
 
 always @(posedge clk)
 begin
	state <= next_state; 
 end 
 
 always @(*)
 begin
 case (state)
 S0: begin #1 LdA = 0; LdB = 0; LdP = 0; clrP = 0; decB = 0; 
	  if (start) begin
			next_state = S1;
	  end
	  
	  end
 S1: begin 
		next_state = S2;
		#1 LdA = 1;  end
 S2: begin #1 LdA = 0; LdB = 1; clrP = 1; next_state = S3; end
 S3: begin #2 LdB = 0; LdP = 1; clrP = 0; decB = 1; 
	  if (eqz) begin
	  state <= S4; 
	  end
	  end
	  
 S4: begin #1 done = 1; LdB = 0; LdP = 0; decB = 0; next_state= S4; end
 default: begin #1 LdA = 0; LdB = 0; LdP = 0; clrP = 0; decB = 0; next_state = S0; end
 endcase
 end
endmodule