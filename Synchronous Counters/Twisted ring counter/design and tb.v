module twisted_ring(
    input wire clk,
    input wire rstn,
    output reg [3:0]out
);
    always @(posedge clk) begin
        if(!rstn) begin
            out <= 4'b0000;
        end else begin
            out <= {~out[0],out[3:1]};
        end
    end
endmodule


module twisted_ring_counter_tb();
    reg clk;
    reg rstn;
    wire [3:0]out;
    ring_counter dut(.clk(clk),.rstn(rstn),.out(out));
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        rstn = 1'b0;
        #10 rstn = 1'b1;
        #50;
        $finish;
    end
    initial begin
        $monitor("rstn=%b out=%b",rstn,out);
    end
endmodule
