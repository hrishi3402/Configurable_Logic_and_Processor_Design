module demux1_8_tb;
reg in;
reg[2:0] s;
wire [7:0] o;

demux1_8 d1 (.in(in),.s(s),.o(o));
initial begin
in=1'b1;
s=3'b000;
#10 s=3'b001;
#10 s=3'b010;
#10 s=3'b011;
#10 s=3'b100;
#10 s=3'b101;
#10 s=3'b110;
#10 s=3'b111;
end

endmodule
