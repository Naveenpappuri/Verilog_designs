
//2x1 Priority Encoder
module pencoder_2x1(
    input wire [1:0]i,
    output reg out,valid 
    );
    always@* begin
        if(i[1]) begin
            out=1'b1;
            valid=1'b1;
        end
        else if(i[0]) begin
            out=1'b0;
            valid=1'b1;
        end
        else begin
            out=1'b0;
            valid=1'b0;
        end
        
         
    end
    
endmodule