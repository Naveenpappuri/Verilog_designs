//comparision for 3-input and 3-input using 2-input xor gates
module xor_compare(
   input wire a,b,c,
   output wire out_3in,out_inst
   );
    xor_3in i1(a,b,c,out_3in);
    xor_3in_2in i2(a,b,c,out_inst);
endmodule

//3-input xor gates
module xor_3in(
    input wire a,b,c,
    output wire out
    );
    assign out=a^b^c;
endmodule

//3-input using 2-input xor gate
module xor_3in_2in(
   input wire a,b,c,
   output wire out
   );
   wire w1;
   xor_gate g1(a,b,w1);
   xor_gate g2(w1,c,out);   
endmodule

//2-input xor gate
module xor_gate(
    input wire a,b,
    output wire out
    );
    assign out=a^b;
endmodule
