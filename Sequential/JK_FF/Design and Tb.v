module JK_FF(
    input wire clk,
    input wire rstn,
    input wire j,k,
    output reg q,
    output wire qbar
    );
    always @(posedge clk) begin
        if(!rstn) q <= 1'b0;
        else begin
            case({j,k})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= ~q;
                default: q <= q;
            endcase
        end 
    end
    assign qbar = ~q;
endmodule

module JK_FF_tb();
reg clk;
    reg j,k;
    reg rstn;
    wire q,qbar;
    JK_FF dut(.j(j),.k(k),.clk(clk),.rstn(rstn),.q(q),.qbar(qbar));
    initial begin
        clk =1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        @(negedge clk) j=1'b0;k=1'b0;rstn = 1'b0;
        @(negedge clk) j=1'b0;k=1'b0;rstn = 1'b1;
        @(negedge clk) j=1'b0;k=1'b1;rstn = 1'b1;
        @(negedge clk) j=1'b1;k=1'b0;rstn = 1'b1;
        @(negedge clk) j=1'b1;k=1'b1;rstn = 1'b1;
        #20;
        $finish;
    end
endmodule
