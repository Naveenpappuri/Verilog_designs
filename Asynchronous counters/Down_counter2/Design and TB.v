`timescale 1ns / 1ps
module counter4_down(
    input wire clk,
    input wire rstn,
    output reg [1:0]q
    );
    always @(posedge clk or negedge rstn) begin
            if(!rstn) begin
                q[0]<=1'b0;
            end else begin
                q[0]<=~q[0];
            end
        end
            always @(negedge ~q[0] or negedge rstn) begin
            if(!rstn) begin
                q[1]<=1'b0;
            end else begin
                q[1]<=~q[1];
            end
        end
endmodule

//Test Bench

`timescale 1ns / 1ps
module counter4_tb();
    reg clk;
    reg rstn;
    wire [1:0]q;
    counter4_down dut( clk,rstn,q);
    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end
    initial begin
        @(posedge clk) rstn<=1'b0;
        @(posedge clk) rstn<=1'b1;
        #100;
        $finish;
    end
endmodule
