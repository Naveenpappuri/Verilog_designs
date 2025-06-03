//binary_to_gray_tb

module binary_to_gray_tb();
    reg [3:0]b;
    wire [3:0]g;
    binary_to_gray dut(b,g);
    integer i;
    initial begin
        for(i=0; i<16; i=i+1) begin
            b=i;
            #1;
        end
        $finish;
    end
    initial begin
        $monitor("b=%b; g=%b", b,g);
    end
endmodule