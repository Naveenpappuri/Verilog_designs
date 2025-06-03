//4x2 Priority Encoder test bench

module pencoder_4x1_tb();
    reg [3:0]i;
    wire [1:0]o;
    wire valid;
    pencoder_4x2 dut(i,o, valid);
     integer k;
       initial begin
           for(k=0;k<15;k=k+1) begin
               i=k;
               #1;
           end
           $finish;
       end
       initial begin
           $monitor("i=%b, o=%b, valid=%b", i,o,valid);
       end
endmodule