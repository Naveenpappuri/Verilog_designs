
//Comparision of 3-input and 3-input using 2-input xnor gate
module xnor_compare(
    input wire a,b,c,
    output wire out_3in,out_inst
    );
    xnor_3in g1(a,b,c,out_3in);
    xnor_3in_2in g2(a,b,c,out_inst);
endmodule

//3-input xnor gate
module xnor_3in(
    input wire a,b,c,
    output wire out
    );
    assign out=~(a^b^c);
endmodule

//3-input using 2-input xnor gate
module xnor_3in_2in(
    input wire a,b,c,
    output wire out
    );
    wire w;
    xnor_gate g1(a,b,w);
    xnor_gate g2(c,w,out);
endmodule

//2-input xnor gate
module xnor_gate(
   input wire a,b,
   output wire out
    );
    assign out=~(a^b);
endmodule
