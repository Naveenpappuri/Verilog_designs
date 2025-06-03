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

