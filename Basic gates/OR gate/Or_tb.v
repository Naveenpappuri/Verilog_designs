
//Or_tb
module tb_or_compare();
    reg a,b,c;
    wire out_3in,out_inst;
    or_compare dut(a,b,c,out_3in,out_inst);
    initial begin
        a=1'b0;b=1'b0; c=1'b0; #1;
        a=1'b0;b=1'b0; c=1'b1; #1;
        a=1'b0;b=1'b1; c=1'b0; #1;
        a=1'b0;b=1'b1; c=1'b1; #1;
        a=1'b1;b=1'b0; c=1'b0; #1;
        a=1'b1;b=1'b0; c=1'b1; #1;
        a=1'b1;b=1'b1; c=1'b0; #1;
        a=1'b1;b=1'b1; c=1'b1; #1;
        $finish;
    end
endmodule