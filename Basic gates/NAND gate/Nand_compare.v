
// comparision of 3-input and 3-input using 2-input Nand gate
module nand_compare(
    input wire a,b,c,
    output wire out_3in,out_inst
    );
    nand_3in u1(a,b,c,out_3in);
    nand_3in_2in u2(a,b,c,out_inst);
endmodule

//3-input Nand gate
module nand_3in(
    input wire a,b,c,
    output wire out
    );
    assign out=~(a&b&c);
endmodule

//3-input using 2-input Nand gate
module nand_3in_2in(
    input wire a,b,c,
    output wire out
    );
    wire w;
    nand_gate g1(a,b,w);
    nand_gate g2(w,c,out);
endmodule

//2-input Nand gate
module nand_gate(
    input wire a,b,
    output wire out
    );
    assign out=~(a&b);
endmodule
