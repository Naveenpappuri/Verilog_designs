module demux_1x2_tb();
    reg in,sel;
    wire [1:0]out;
    demux_1x2 dut(in,sel,out);
    integer i;
    initial begin
        for(i=0;i<2;i=i+1)
        begin
           in=1'b1;
           sel=i;
           #1;
        end
        $finish;
    end
    initial begin
        $monitor ("in=%b,  sel=%b,  out=%b", in,sel,out);
    end
endmodule
