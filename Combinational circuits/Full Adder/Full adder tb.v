// Test bench for full adder

module FA_tb();
    reg a,b,c;
    wire sum,carry;
    FA dut(a,b,c,sum,carry);
    integer i;
    initial begin
        for(i=0;i<8;i=i+1) begin
            {a,b,c}=i;
            #1;
        end
        $finish;
    end
    initial begin
    $monitor("a=%b, b=%b, c=%b, sum=%b, carry=%b", a,b,c,sum,carry);
    end
endmodule