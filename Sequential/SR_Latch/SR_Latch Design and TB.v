module SR_Latch(
    input wire clk,
    input wire s,
    input wire r,
    output reg q,
    output wire qbar 
    );
    always @* begin
        if(clk ==1'b1) begin
            case({s,r})
                2'b00 : q = q;
                2'b01 : q = 1'b0;
                2'b10 : q = 1'b1;
                2'b11 : q = 1'bx;
                default : q = q;
            endcase
        end
    end
    assign qbar = ~q;
endmodule

//Test bench
module SR_latch_tb();
    reg clk,s,r;
    wire q,qbar;
    SR_Latch dut(.clk(clk),.s(s),.r(r),.q(q),.qbar(qbar));
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
    
       @(negedge clk) {s,r} = 2'b00;#10;
       @(negedge clk) {s,r} = 2'b01;#10;
       @(negedge clk) {s,r} = 2'b10;#10;
       @(negedge clk) {s,r} = 2'b11;#10;
       #10;
    
    $finish;
    end
    initial begin
        $monitor("% clk = %b, s=%b, r=%b, q=%b, qbar=%b",clk,s,r,q,qbar);
    end
    
endmodule