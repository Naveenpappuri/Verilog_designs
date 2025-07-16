module JK_MasterSlave(
    input wire clk,
    input wire j,k,
    output wire q,qbar
    );
    wire q1,qbar1;
    JK_Latch d1(.clk(clk),.j(j),.k(k),.q(q1),.qbar(qbar1));
    JK_Latch d2(.clk(~clk),.j(q1),.k(qbar1),.q(q),.qbar(qbar));
endmodule

module JK_Latch_tb();
    reg clk;
    reg j,k;
    wire q,qbar;
    JK_MasterSlave dut(.j(j),.k(k),.clk(clk),.q(q),.qbar(qbar));
    initial begin
        clk =1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
         j=1'b0; k=1'b0;#1; 
         j=1'b0; k=1'b1;#1; 
         j=1'b1; k=1'b0;#1; 
         j=1'b0; k=1'b1;#1; 
         j=1'b0; k=1'b0;#1; 
         j=1'b1; k=1'b0;#1; 
         j=1'b0; k=1'b1;#1; 
         j=1'b1; k=1'b1;#1; 
         j=1'b0; k=1'b1;#1;
         j=1'b1; k=1'b0;#1;
         j=1'b0; k=1'b1;#1;
         j=1'b1; k=1'b1;#1;
         j=1'b0; k=1'b1;#1;
        #5;
        j=1'b0; k=1'b1;#1
        j=1'b1; k=1'b1;#1;
        j=1'b0; k=1'b1;#1;
        j=1'b1; k=1'b1;#1;
        j=1'b0; k=1'b1;#1;
        j=1'b1; k=1'b1;#1;
        j=1'b0; k=1'b1;#1;
        j=1'b1; k=1'b1;#1;
        j=1'b0; k=1'b1;#1;
        $finish;
    end
    initial begin
        $monitor("j=%b k=%b  Q=%b",j,k,q);
    end
endmodule