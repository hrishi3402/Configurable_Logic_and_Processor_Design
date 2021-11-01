module bus_arbiter (
    input clk,
    input resetn,    
    input [3:1] r,   
    output [3:1] g   
); 
    parameter A=1, B=2, C=3, D=4;
    reg [2:0] state, next_state;
    
    always @ (*) begin
        case (state)
            A : begin
                casex (r)
                3'bxx1 : next_state = B;
                3'bx10 : next_state = C;
                3'b100 : next_state = D;
                3'b000 : next_state = A;
                default: next_state = A;    
            endcase
            end
            
            B : begin
                if(r[1])
                    next_state = B;
                else 
                    next_state = A;
            end
            
            C : begin
                if(r[2])
                    next_state = C;
                else 
                    next_state = A;
            end
            
            D : begin
                if(r[3])
                    next_state = D;
                else 
                    next_state = A;
            end
        endcase
    end
    
    always @ (posedge clk) begin
        if (!resetn)
            state <= A;
        else 
            state <= next_state;
    end
    
    assign g[1] = (state == B);
    assign g[2] = (state == C);
    assign g[3] = (state == D);
    
    

endmodule
