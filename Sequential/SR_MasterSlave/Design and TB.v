module SR_MasterSlave(
    input wire clk,
    input wire s,r,
    output wire q,
    output wire qbar
    );
    wire q1,qbar1;
    SR_Latch d1(.clk(clk),.s(s),.r(r),.q(q1),.qbar(qbar1));
    SR_Latch d2(.clk(~clk),.s(s),.r(r),.q(q),.qbar(qbar));
endmodule


module SR_latch_tb();
    reg clk,s,r;
    wire q,qbar;
    SR_MasterSlave dut(.clk(clk),.s(s),.r(r),.q(q),.qbar(qbar));
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
    
       @(posedge clk) {s,r} = 2'b00;#10;
       @(posedge clk) {s,r} = 2'b01;#10;
       @(posedge clk) {s,r} = 2'b10;#10;
       @(posedge clk) {s,r} = 2'b11;#10;
       #10;
    
    $finish;
    end
    initial begin
        $monitor(" clk = %b, s=%b, r=%b, q=%b, qbar=%b",clk,s,r,q,qbar);
    end
    
endmodule