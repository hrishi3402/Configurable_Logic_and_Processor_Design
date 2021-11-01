module MagnitudeComparator (I1,I2,Gt,Lt,Eq); 

input [7:0]  I1,I2;

output Gt,Lt,Eq; 


assign Gt = ( I1 > I2 )? 1'b1 : 1'b0; 
assign Lt = ( I1 < I2 )? 1'b1 : 1'b0; 
assign Eq = ( I1 == I2)? 1'b1 : 1'b0; 


endmodule
