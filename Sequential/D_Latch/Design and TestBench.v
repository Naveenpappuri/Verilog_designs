module D_Latch(
        input wire clk,
    input wire d,
    output reg q,
    output wire qbar 
    );
    always @* begin
        if(clk ==1'b1) begin
            q = d;
        end
        else begin
            q = q;
        end
    end
assign qbar = ~q;
   
endmodule



//Test bench
`timescale 1ns / 1ps
module D_latch_tb();
    reg clk;
    reg d;
    wire q,qbar;
     D_Latch dut(.clk(clk),.d(d),.q(q),.qbar(qbar));
     initial begin
         clk =1'b0;
         forever #5 clk = ~clk;
     end 
     initial begin
         @(negedge clk) d = 1'b0;#10;
         @(negedge clk) d = 1'b1;#10;
         @(negedge clk) d = 1'b1;#10;
         @(negedge clk) d = 1'b0;#10;
         $finish;
     end
     initial begin
         $monitor("% clk = %b, d=%b, q=%b, qbar=%b",clk,d,q,qbar);
     end
endmodule
