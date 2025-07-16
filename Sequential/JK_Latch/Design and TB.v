module JK_Latch(
    input wire j,k,
    input wire clk,
    output reg q,
    output wire qbar
    );
    always @* begin
        if(!clk) begin
            q = q;
        end else begin
            case({j,k}) 
                2'b00 : q = q;
                2'b01 : q = 1'b0;
                2'b10 : q = 1'b1;
                2'b11 : q = ~q;
                default : q = q;
            endcase
        end
        
    end
    assign qbar = ~q;
endmodule


module JK_Latch_tb();
    reg clk;
    reg j,k;
    wire q,qbar;
    JK_Latch dut(j,k,clk,q,qbar);
    initial begin
        clk =1'b0;
        forever #1 clk = ~clk;
    end
    initial begin
         j=1'b0; k=1'b0;#1; 
         j=1'b0; k=1'b1;#1; 
         j=1'b1; k=1'b0;#1; 
         j=1'b1; k=1'b1;#1; 
         j=1'b1; k=1'b1;#1; 
         j=1'b1; k=1'b1;#1; 
         j=1'b0; k=1'b1;#1; 
         j=1'b1; k=1'b1;#1; 
         j=1'b1; k=1'b1;#1;
         j=1'b1; k=1'b0;#1;
         j=1'b1; k=1'b1;#1;
        #20;
        $finish;
    end
    initial begin
        $monitor("j=%b k=%b  Q=%b",j,k,q);
    end
endmodule
