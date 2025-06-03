`timescale 1ns / 1ps
module KGP_adder(
    input wire [7:0]a,b,
    input wire cin,
    output wire [7:0]sum,
    output wire cout
);
    wire  [1:0] s1 [8:0];
    wire  [1:0] s2 [8:0];
    wire  [1:0] s3 [8:0];
    wire  [8:0] s4;
    //step_1
    assign s1[0]={2{cin}};
    kgp_table t0(.prev(s1[0]), .pres({a[0],b[0]}), .out(s1[8]));
    kgp_table t1(.prev({a[0],b[0]}), .pres({a[1],b[1]}), .out(s1[1]));
    kgp_table t2(.prev({a[1],b[1]}), .pres({a[2],b[2]}), .out(s1[2]));
    kgp_table t3(.prev({a[2],b[2]}), .pres({a[3],b[3]}), .out(s1[3]));
    kgp_table t4(.prev({a[3],b[3]}), .pres({a[4],b[4]}), .out(s1[4]));
    kgp_table t5(.prev({a[4],b[4]}), .pres({a[5],b[5]}), .out(s1[5]));
    kgp_table t6(.prev({a[5],b[5]}), .pres({a[6],b[6]}), .out(s1[6]));
    kgp_table t7(.prev({a[6],b[6]}), .pres({a[7],b[7]}), .out(s1[7]));
    
   
    //step_2
    assign s2[0]=s1[0];
    assign s2[1]=s1[1];
    kgp_table j1(.prev(s1[0]), .pres(s1[2]), .out(s2[2]));
    kgp_table j2(.prev(s1[1]), .pres(s1[3]), .out(s2[3]));
    kgp_table j3(.prev(s1[2]), .pres(s1[4]), .out(s2[4]));
    kgp_table j4(.prev(s1[3]), .pres(s1[5]), .out(s2[5]));
    kgp_table j5(.prev(s1[4]), .pres(s1[6]), .out(s2[6]));
    kgp_table j6(.prev(s1[5]), .pres(s1[7]), .out(s2[7]));
    kgp_table j7(.prev(s1[6]), .pres(s1[8]), .out(s2[8]));
    
    //step_3
    assign s3[0] = s2[0];
    assign s3[1] = s2[1];
    assign s3[2] = s2[2];
    assign s3[3] = s2[3];
    kgp_table x1(.prev(s2[0]), .pres(s2[4]), .out(s3[4]));
    kgp_table x2(.prev(s2[1]), .pres(s2[5]), .out(s3[5]));
    kgp_table x3(.prev(s2[2]), .pres(s2[6]), .out(s3[6]));
    kgp_table x4(.prev(s2[3]), .pres(s2[7]), .out(s3[7]));
    kgp_table x5(.prev(s2[4]), .pres(s2[8]), .out(s3[8]));
    // step_4 ==> generates k=0,p=0,g=1
   carry_gen y0(.now(s3[0]),.back(s3[0]), .out(s4[0])); 
   carry_gen y1(.now(s3[1]),.back(s3[0]), .out(s4[1]));
   carry_gen y2(.now(s3[2]),.back(s3[1]), .out(s4[2]));
   carry_gen y3(.now(s3[3]),.back(s3[2]), .out(s4[3]));
   carry_gen y4(.now(s3[4]),.back(s3[3]), .out(s4[4]));
   carry_gen y5(.now(s3[5]),.back(s3[4]), .out(s4[5]));
   carry_gen y6(.now(s3[6]),.back(s3[5]), .out(s4[6]));
   carry_gen y7(.now(s3[7]),.back(s3[6]), .out(s4[7]));
   carry_gen y8(.now(s3[8]),.back(s3[7]), .out(s4[8]));
   
   //step_5 xor operation
   assign sum[0]=a[0]^b[0]^s4[0];
   assign sum[1]=a[1]^b[1]^s4[1];
   assign sum[2]=a[2]^b[2]^s4[2];
   assign sum[3]=a[3]^b[3]^s4[3];
   assign sum[4]=a[4]^b[4]^s4[4];
   assign sum[5]=a[5]^b[5]^s4[5];
   assign sum[6]=a[6]^b[6]^s4[6];
   assign sum[7]=a[7]^b[7]^s4[7];
   assign cout  =s4[8]          ;
   
endmodule



//KGP generation table

`timescale 1ns / 1ps
module kgp_table(
    input wire [1:0]prev,pres,
    output reg [1:0]out
);
        wire [3:0]sel;
        assign sel={pres,prev};
        always @* begin
            case(sel) 
                4'b0000: out=2'b00;
                4'b0001: out=2'b00;
                4'b0010: out=2'b00;
                4'b0011: out=2'b00;
                4'b0100: out=2'b00;
                4'b0101: out=2'b01;
                4'b0110: out=2'b01;
                4'b0111: out=2'b11;
                4'b1000: out=2'b00;
                4'b1001: out=2'b01;
                4'b1010: out=2'b01;
                4'b1011: out=2'b11;
                4'b1100: out=2'b11;
                4'b1101: out=2'b11;
                4'b1110: out=2'b11;
                4'b1111: out=2'b11;
            endcase
        end
    
endmodule


//carry generation stage

`timescale 1ns / 1ps
module carry_gen(
  input wire [1:0]now,back,
    output reg out
);
   parameter k=2'b00;
   parameter p=2'b01;
   parameter g=2'b11;
   wire [3:0]s;
  assign s={now,back};
  always @* begin
    case(s) 
        {k,k}:out=1'b1;
        {k,g}:out=1'b0;
        {p,g}:out=1'b1;
        {g,g}:out=1'b1;
        {g,k}:out=1'b1;
        {g,p}:out=1'b1;
    endcase
    end    
endmodule