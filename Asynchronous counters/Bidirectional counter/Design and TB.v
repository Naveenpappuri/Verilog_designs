`timescale 1ns / 1ps
module bidirectional_shift(
    input wire clk,
    input wire rstn,
    input wire in,
    input wire sel,
    output reg [3:0]q
    );
    
    always @(posedge clk )begin
        if(!rstn)begin
            q[3]<=1'b0;
            q[2]<=1'b0;
            q[1]<=1'b0;
            q[0]<=1'b0;
        end else if(sel==1)begin
            q[3] <=in;
            q[2] <=q[3];
            q[1] <=q[2];
            q[0] <=q[1];
        end else begin
            q[3] <=q[2];
            q[2] <=q[1];
            q[1] <=q[0];
            q[0] <=in;
        end
    end
endmodule

//Test bench

`timescale 1ns / 1ps
module bidirectional_shift_tb();
    reg clk;
    reg rstn;
    reg sel;
    reg in;
    wire [3:0]q;
    bidirectional_shift dut(
        clk,
        rstn,
        in,
        sel,
        q
        );
    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end
    initial begin
        @(posedge clk) rstn<=1'b0;
        @(posedge clk) rstn<=1'b1;sel<=1'b1;in<=1'b1;
        #100;
        @(posedge clk) rstn<=1'b0;
        @(posedge clk) rstn<=1'b1;sel<=1'b0;in<=1'b1;
        #100;
        $finish;
    end
    initial begin
        $monitor("reset=%b,sel=%b,in=%b,q=%b",rstn,sel,in,q);
    end
endmodule
