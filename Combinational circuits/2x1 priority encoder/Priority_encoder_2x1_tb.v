//2x1 priority Encoder TB

module pencoder_2x1_tb();
    reg [1:0]i;
    wire out,valid;
    pencoder_2x1 dut(i,out,valid);
    integer k;
    initial begin
        for(k=0;k<4;k=k+1) begin
            i=k;
            #1;
        end
        $finish;
    end
    initial begin
        $monitor("i=%b, out=%b, valid=%b", i,out,valid);
    end
endmodule