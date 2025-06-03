// Code 8x3 Priority encoder using 4x2 Priority encoder

module PE_8x3_4x2(
    input wire [7:0]i,
    output wire [2:0]out,
    output wire valid
);
   wire [3:0]o;
   wire v0,v1;
   wire v0bar,v1bar;
   not (v0bar,v0);
   not (v1bar,v1);
   PE_en e1(i[7:4],v0bar,o[3:2],v1);
   PE_en e2(i[3:0],v1bar,o[1:0],v0);
   or (out[1],o[3],o[1]); 
   or (out[0],o[2],o[0]);
   assign out[2]=v1;
   or (valid,v1,v0);  
    
endmodule

// code for 4x2 Priority encoder using enable
module PE_en(
    input wire [3:0]i,
    input wire en,
    output reg [1:0]out,
    output reg valid
    );
    //assign valid=(i[0]|i[1]|i[2]|i[3]);
    always @* begin
       if(!en) begin
           out=2'b00;
           valid=1'b0;
       end 
       else begin
           if(i[3]) begin
               out=2'b11;
               valid=1'b1;
           end
           else if(i[2]) begin
               out=2'b10;    
               valid=1'b1; 
           end
           else if(i[1]) begin
                out=2'b01;    
                valid=1'b1; 
            end
            else if(i[0]) begin
                out=2'b00;    
                valid=1'b1; 
             end
             else begin
                 out=2'b00;
                 valid=1'b0;
             end
       end
    end
             
   
endmodule