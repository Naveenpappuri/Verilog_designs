module demux_1x2(
    input wire in,
    input wire sel,
    output reg [1:0]out 
    );
    always @* begin
    out=2'd0;
      case(sel)
      
          1'b0:out[0]=in;
          1'b1:out[1]=in;
    
      endcase
    end
endmodule