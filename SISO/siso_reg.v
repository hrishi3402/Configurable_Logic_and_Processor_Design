module siso_reg(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @ (posedge clk or posedge areset)begin
        if (areset)
            q <= 0;
        else begin
            
            if (load == 1)
                q <= data;
            
            else begin
                if (ena == 1)
                    q <= q >> 1;
               
            	else
                    q<= q;
            end   
        end

    end

endmodule
