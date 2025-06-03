
//2x1 mux using conditional operator
`timescale 1ns / 1ps
module mux_2x1_cond(
    input wire in0,in1,sel,
    output wire out
    );
    assign out=sel?in1:in0;
endmodule

//2x1 mux using if-else statement
`timescale 1ns / 1ps
module mux_2x1_if(
    input wire in0,in1,sel,
    output reg out
);
    always@*
    begin
        if(sel)
            out=in1;
        else
            out=in0;   
    end
endmodule

//2x1 mux using case statement
`timescale 1ns / 1ps
module mux_2x1_case(
    input wire in0,in1,sel,
    output reg out
    );
    always@*
    begin
        case(sel)
            1'b0: out = in0;
            1'b1: out = in1;
            default out = in0;
        endcase
    end
endmodule
