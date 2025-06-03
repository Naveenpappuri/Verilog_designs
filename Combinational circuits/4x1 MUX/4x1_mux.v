
//4x1 mux using If-Else statement
module mux_4x1_ifelse(
    input wire [3:0]i,
    input wire [1:0]sel,
    output reg out
);
    always@*
    begin
        if(sel==2'b00)
           out=i[0];
        else if(sel==2'b01)
           out=i[1];
        else if(sel==2'b10)
           out=i[2];
        else
           out=i[3];
    end
endmodule

//4x1 mux using Conditional operator
module mux_4x1_cond(
    input wire [3:0] i,
    input wire [1:0] sel,
    output wire out
    );
    assign out = sel[1]?(sel[0]?i[3]:i[2]):(sel[0]?i[1]:i[0]);
endmodule

//4x1 mux using case statement
module mux_4x1_case(
    input wire [3:0]i,
    input wire [1:0]sel,
    output reg out
    );
    always @*
    begin
        case(sel)
            2'b00: out = i[0];
            2'b01: out = i[1];
            2'b10: out = i[2];
            2'b11: out = i[3];
        endcase
    end
endmodule

//4x1 mux using 2x1 mux
module mux_4x1_2x1(
    input wire [3:0]i,
    input wire [1:0]sel,
    output wire out
    );
    wire out_g1,out_g2;
  
    mux_2x1_cond g1(i[0],i[1],sel[0],out_g1);
    mux_2x1_cond g2(i[2],i[3],sel[0],out_g2);
    mux_2x1_cond g3(out_g1,out_g2,sel[1],out);
   
endmodule