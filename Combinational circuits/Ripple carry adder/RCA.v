// Ripple carry adder
module RCA(
    input wire [3:0]a,b,
    output wire [3:0]s,
    output wire carry
);
wire [2:0]c;
    HA h1(a[0],b[0],s[0],c[0]);
    FA f1(a[1],b[1],c[0],s[1],c[1]);
    FA f2(a[2],b[2],c[1],s[2],c[2]);
    FA f3(a[3],b[3],c[2],s[3],carry);
    
endmodule

// Full adder

module FA(
    input wire a,b,c,
    output wire sum,carry
);
    wire s1,c1,c2;
    HA h1(.a(a), .b(b), .sum(s1), .carry(c1))  ;
    HA h2(.a(s1), .b(c), .sum(sum), .carry(c2));
    or (carry,c1,c2);
endmodule

//Half adder
module HA(
    input wire a,b,
    output wire sum,carry
);
assign sum = a^b  ;
assign carry = a&b;

endmodule

