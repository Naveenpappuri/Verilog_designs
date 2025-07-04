module PISO(
    input wire clk,
    input wire rstn,
    input wire [3:0]in,
    input wire sel,
    output reg out
    );
    reg [3:1]q;
    always @(posedge clk) begin
        if(!rstn) begin
            q[3]<=1'b0;
            q[2]<=1'b0;
            q[1]<=1'b0;
            out <=1'b0;
        end
        else begin
            q[3] <= in[3];
            q[2] <= sel?in[2]:q[3];
            q[1] <= sel?in[1]:q[2];
            out  <= sel?in[0]:q[1];
        end
    end
endmodule


//Test Bench
module PISO_tb();
    reg clk;
    reg rstn;
    reg [3:0]in;
    reg sel;
    wire out;
    PISO dut(clk,rstn,in,sel,out);
    initial begin
            clk=1'b0;
            forever #5 clk=~clk;
        end
        initial begin
            @(posedge clk) rstn<=1'b0;
            @(posedge clk) rstn<=1'b1;in<=4'b1001;sel<=1'b1;
            @(posedge clk) rstn<=1'b1;sel<=1'b0;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            $finish;
        end
endmodule
