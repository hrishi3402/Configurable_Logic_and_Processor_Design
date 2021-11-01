module MagnitudeComparator_tb; 

reg [7:0] I1,I2;
wire Gt,Lt,Eq; 

MagnitudeComparator magcomp(.I1(I1),.I2(I2),.Gt(Gt),.Lt(Lt),.Eq(Eq));

initial 
begin

I1=8'b0;I2=8'b0;
#10 I1=8'b00001000;I2=8'b00000001;
#10 I1=8'b00000001;I2=8'b00000110;
#10 I1=8'b10000010;I2=8'b10000010;
#10;

end
endmodule
