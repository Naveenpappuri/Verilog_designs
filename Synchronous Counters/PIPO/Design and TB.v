`timescale 1ns / 1ps
module PIPO(
    input wire clk,
    input wire rstn,
    input wire [3:0]in,
    output reg [3:0]q
    );
    always @(posedge clk) begin
        if(!rstn) begin
            q<=4'b0000;
        end
        else begin
            q<=in;
        end
        
    end
endmodule


// Test Bench
module PIPO_tb();
    reg clk;
    reg rstn;
    reg [3:0]in;
    wire [3:0]q;
    PIPO dut(clk,rstn,in,q);
    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end
    initial begin
        @(posedge clk) rstn<=1'b0;
        @(posedge clk) rstn<=1'b1;in<=4'b1011;
        @(posedge clk);
        @(posedge clk);
        $finish;
    end
endmodule
