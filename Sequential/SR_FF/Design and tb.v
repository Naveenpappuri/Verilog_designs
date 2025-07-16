module SR_FF(
    input wire clk,
    input wire s,r,
    input wire rstn,
    output reg q,
    output wire qbar
    );
    always@(posedge clk) begin
        if(!rstn) begin
            q <= 1'b0;
        end
        else begin
            case({s,r}) 
                2'b00 : q <= q;
                2'b01 : q <= 1'b0;
                2'b10 : q <= 1'b1;
                2'b11 : q <= 1'bx;
                default : q <= q; 
            endcase
        end
    end
    assign qbar = ~q;
endmodule



module SR_FF_tb();
    reg clk;
    reg rstn;
    reg s,r;
    wire q,qbar;
    SR_FF dut(.clk(clk),.rstn(rstn),.s(s),.r(r),.q(q),.qbar(qbar));
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        @(negedge clk) s = 1'b0;r = 1'b0; rstn = 1'b0;  
        @(negedge clk) s = 1'b0;r = 1'b0; rstn = 1'b1;  
        @(negedge clk) s = 1'b0;r = 1'b1; rstn = 1'b1;  
        @(negedge clk) s = 1'b1;r = 1'b0; rstn = 1'b1;  
        @(negedge clk) s = 1'b1;r = 1'b1; rstn = 1'b1;  
        #10;
        $finish;
    end
endmodule
