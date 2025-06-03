
//Test bench for And gate comparision
module tb_and_compare();
    reg a,b,c;
    wire out1,out2;
    and_compare dut(a,b,c,out1,out2);
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