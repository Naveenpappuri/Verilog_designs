// KGP Adder Test bench

module kgp_adder_tb();
    reg [7:0] a,b; 
    reg       cin; 
    wire [7:0]sum;
    wire cout    ;
    KGP_adder dut(a,b,cin,sum,cout);
    initial begin
        a=8'd255;
        b=8'd255;
        cin=1'b1;
        #1;
        $finish;
    end
    initial begin
        $monitor("a=%0d, b=%0d, cin=%b, {cout,sum}=%0d", a,b,cin,{cout,sum});
    end
    
    
endmodule