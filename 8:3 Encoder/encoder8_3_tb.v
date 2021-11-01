module encoder8_3_tb();
reg [7:0] i;
wire [2:0] o;

encoder8_3 e1 (.i(i),.o(o));

initial begin
i=8'b00000001;
#10 i=8'b00000010;
#10 i=8'b00000100;
#10 i=8'b00001000;
#10 i=8'b00010000;
#10 i=8'b00100000;
#10 i=8'b01000000;
#10 i=8'b10000000;
#10;
end
endmodule
