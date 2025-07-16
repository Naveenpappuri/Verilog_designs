module T_FF(
    input wire clk,
    input wire rstn,
    input wire t,
    output reg q,
    output wire qbar
    );
    always @(posedge clk) begin
        if(!rstn) begin
            q<= 1'b0;
        end else begin
            if(t) q <= ~q;
            else q <= q;
        end
    end
    assign qbar = ~q;
endmodule



module T_FF_tb();
    reg clk;
    reg rstn;
    reg t;
    wire q;
    wire qbar;
    T_FF dut(.clk(clk),.rstn(rstn),.t(t),.q(q),.qbar(qbar));
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        @(negedge clk) t=1'b0; rstn=1'b0; 
        @(negedge clk) t=1'b0; rstn=1'b1; 
        @(negedge clk) t=1'b1; rstn=1'b1; 
        @(negedge clk) t=1'b1; rstn=1'b1; 
        @(negedge clk) t=1'b0; rstn=1'b1;
        #20;
        $finish; 
    end
    initial begin
    $monitor("rstn=%b t=%b q=%b",rstn,t,q);
    end
endmodule