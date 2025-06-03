
//comparision of 3-input and 3-input using 2-input Or gate
module or_compare(
    input a,b,c,
    output out_3in,out_inst
    );
    or_3in g1(a,b,c,out_3in);
    or_3in_2in g2(a,b,c,out_inst);
endmodule

//3-input Or gate
module or_3in(
   input wire a,b,c,
   output wire out
   );
   assign out=a|b|c;
 
endmodule

//3-input using 2input Or gate
module or_3in_2in(
    input wire a,b,c,
    output wire out
    );
    wire w;
    or_gate g1(a,b,w);
    or_gate g2(w,c,out);
endmodule

//2-input Or gate
module or_gate(
    input wire a,b,
    output wire out
    );
    assign out=a|b;
endmodule