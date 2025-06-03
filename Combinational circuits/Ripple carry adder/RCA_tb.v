// test bench for RCA

module RCA_tb();
    reg [3:0]a,b;
    wire [3:0]s;
    wire carry;
    RCA dut(a,b,s,carry);
    integer i;
    initial begin
        for(i=0;i<256;i=i+1) begin
            {a,b}=i;
            #1;
        end
        $finish;
    end
    initial begin
        $monitor("a=%0d, b=%0d, sum=%0d", a,b,{carry,s});
    end
endmodule
