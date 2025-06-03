
//comparision of 3-input and gate and 3-input using 2-input and gate
module and_compare(
    input wire a,b,c,
    output wire out1,out2
    );
     and_3in i1(a,b,c,out1);
     and_3in_2in i2(a,b,c,out2);
endmodule

//3-input And gate
module and_3in(
    input wire a,b,c,
    output wire out
  );
    assign out=a&b&c;    
endmodule

//3-input And gate using 2-input And gate
module and_3in_2in(
    input wire a,b,c,
    output wire out
    );
    wire w1;
    and_gate g1(a,b,w1);
    and_gate g2(w1,c,out);
endmodule

//2-input And gate
module and_gate(
    input a,b,
    output out
    );
    assign out= a&b;
endmodule
