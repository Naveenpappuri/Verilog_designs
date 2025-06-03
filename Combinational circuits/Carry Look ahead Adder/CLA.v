// Carry look ahead Adder

`timescale 1ns / 1ps
module CLA(
    input wire [3:0]a,b,
    input wire cin,
    output wire [3:0]sum,
    output wire cout 
    );
    wire [3:0]g,p;
    wire [3:0]c;
    assign g[0]=a[0]&b[0];
    assign g[1]=a[1]&b[1];
    assign g[2]=a[2]&b[2];
    assign g[3]=a[3]&b[3];
    assign p[0]=a[0]^b[0];
    assign p[1]=a[1]^b[1];
    assign p[2]=a[2]^b[2];
    assign p[3]=a[3]^b[3];    
    assign c[0]=g[0]+(p[0]*cin);
    assign c[1]=g[1]+(p[1]*c[0]);
    assign c[2]=g[2]+(p[2]*c[1]);
    assign c[3]=g[3]+(p[3]*c[2]);
    sum_block d1(a[0],b[0],cin,sum[0]);
    sum_block d2(a[1],b[1],c[0],sum[1]);
    sum_block d3(a[2],b[2],c[1],sum[2]);
    sum_block d4(a[3],b[3],c[2],sum[3]);
    assign cout=c[3];
endmodule

//code for sum_block

module sum_block(
    input wire a,b,c,
    output wire s
    );
    assign s=a+b+c;
endmodule
