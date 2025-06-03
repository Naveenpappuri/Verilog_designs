module mux_8x1_tb();
    reg [7:0]i;
    reg [2:0]s;
    wire out;
    mux_8x1 dut(.i(i),.s(s),.out(out));
    integer k;
    initial begin
        for(k=0; k<10; k=k+1)
        begin
            {i,s}= $random;
            #1;  
        end
        $finish;
    end
    initial begin
        $monitor("input=%b; select=%b; out=%b ",i,s,out);
    end
endmodule