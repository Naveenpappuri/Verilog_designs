//Test bench for 8x3 Priority encoder
module PE_8x3_4x2_tb();
    reg [7:0]i;
    wire [2:0]out;
    wire valid;
    PE_8x3_4x2 dut(i,out, valid);
    integer k;
    initial begin
        for(k=0;k<256;k=k+1) begin
            i=k;
            #1;
        end
        $finish;
    end
    initial begin
        $monitor("i=%b, out=%b, valid=%b", i,out,valid);
    end
endmodule