
//Comparision of 3-input and 3-input using 2-input Nor gates
module nor_compare(
    input wire a,b,c,
    output wire out_3in,out_inst
    );
    nor_3in g1(a,b,c,out_3in);
    nor_3in_2in g2(a,b,c,out_inst);
endmodule

//3-input Nor gate
module nor_3in(
    input wire a,b,c,
    output wire out
    );
    assign out = ~(a|b|c);
endmodule

//3-input using 2_input Nor gate
module nor_3in_2in(
    input wire a,b,c,
    output wire out
    );
    wire w;
    nor_gate g1(a,b,w);
    nor_gate g2(w,c,out);
endmodule

//2-input Nor gate
module nor_gate(
    input wire a,b,
    output wire out
    );
    assign out=~(a|b);
endmodule