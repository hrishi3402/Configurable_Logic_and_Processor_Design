module bit8_mult_tb;
 reg [15:0] data_in;
 reg clk, start;
 wire done;
 MUL DP (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk);
 controller CON (LdA, LdB, LdP, clrP, decB, done, clk, eqz, start);
 initial
 begin
 clk = 1'b0;
 #3 start = 1'b1;
 #500 ;
 end
 always #5 clk = ~clk;
 initial
 begin
 #17 data_in = 20;
 #10 data_in = 8;
 end
 initial
 begin
 $monitor ("%d %b", DP.Y, done);
 $dumpfile ("mul.vcd"); $dumpvars (0, MUL_test);
 end
endmodule