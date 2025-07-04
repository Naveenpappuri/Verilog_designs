`timescale 1ns / 1ps
module SISO(
    input wire clk,
    input wire rstn,
    input wire din,
    output reg out
    );
    reg q3,q2,q1;
    always@(posedge clk) begin
        if (!rstn) begin
            out <= 1'b0;
            q3  <= 1'b0;
            q2  <= 1'b0;
            q1  <= 1'b0;
        end
        else begin 
            q3  <= din;
            q2  <= q3;
            q1  <= q2;
            out <= q1;
        end
    end
endmodule


//Test bench

module SISO_tb();
    reg clk;
    reg rstn;
    reg din;
    wire out;
    SISO dut(
        clk,
        rstn,
        din,
        out
    );
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
