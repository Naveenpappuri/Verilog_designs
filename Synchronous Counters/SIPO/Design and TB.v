`timescale 1ns / 1ps
module SIPO(
    input wire clk,
    input wire rstn,
    input wire din,
    output reg [3:0]q
    );
    always @(posedge clk) begin
        if(!rstn) begin
            q<=4'b0000;
        end
        else begin
            q[3]<=din;
            q[2]<=q[3];
            q[1]<=q[2];
            q[0]<=q[1];
        end
    end
endmodule


//Test Bench

module SIPO_tb();
    reg clk,rstn,din;
    wire [3:0]q;
    SIPO dut(clk,rstn,din,q);
       initial begin
           clk=1'b0;
           forever #5 clk=~clk;
       end
       initial begin
           @(posedge clk) rstn<=1'b0;
           @(posedge clk) rstn<=1'b1;din<=1'b1;
           @(posedge clk);
           @(posedge clk);
           @(posedge clk);
           @(posedge clk);
           @(posedge clk);
           $finish;
       end
endmodule
