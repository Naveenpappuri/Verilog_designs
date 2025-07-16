module D_FF(
    input wire clk,
    input wire rstn,
    input wire d,
    output reg q,
    output wire qbar
    );
    always @(posedge clk) begin
        if(!rstn) q<=1'b0;
        else begin
            q<=d;
        end
    end
    assign qbar = ~q;
endmodule


module D_FF_tb();
    reg clk;
    reg d;
    wire q,qbar;
    reg rstn;
     D_FF dut(.clk(clk),.rstn(rstn),.d(d),.q(q),.qbar(qbar));
     initial begin
         clk =1'b0;
         forever #5 clk = ~clk;
     end 
     initial begin
         @(negedge clk) d = 1'b0;rstn = 1'b0;
         @(negedge clk) d = 1'b0;rstn = 1'b1;
         @(negedge clk) d = 1'b1;
         @(negedge clk) d = 1'b1;
         @(negedge clk) d = 1'b0;
         #10;
         $finish;
     end
     initial begin
         $monitor(" clk = %b, d=%b, q=%b, qbar=%b",clk,d,q,qbar);
     end
endmodule