//Carry Look Ahead adder test bench
module CLA_tb();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout; 
    CLA dut(a,b,cin,sum,cout);
    initial begin
        a=4'b0110;
        b=4'b1011;
        cin=0;
        #1;
        a=4'b0110;
        b=4'b1011;
        cin=1;#1;
        $finish;
    end
    initial begin
        $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b",a,b,cin,sum,cout);
    end
endmodule
