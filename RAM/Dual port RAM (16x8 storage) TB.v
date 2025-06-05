`timescale 1ns / 1ps
module dual_port_RAM_tb();
     parameter WIDTH=8,DEPTH=4;
     reg clk;                
     reg rstn;               
     reg [WIDTH-1:0] data_in;
     reg [DEPTH-1:0] addr; 
     reg wr_en,rd_en;   
     wire [WIDTH-1:0] data_out;
     dual_port_RAM dut(
         .clk(clk),
         .rstn(rstn),
         .data_in(data_in),
         .addr(addr),
         .wr_en(wr_en),
         .rd_en(rd_en),
         .data_out(data_out)
         );
         
     initial begin
         clk=1'b0;
         forever #5 clk=~clk;
     end    
     initial begin
         @(negedge clk) rstn=1'b0;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd4;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd2;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd15;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd4;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd3;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd6;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd2;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd5;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd9;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd10;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd3;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd14;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd9;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd12;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd4;wr_en=1'b1;rd_en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd6;wr_en=1'b1;rd_en=1'b1;
          @(negedge clk)
          @(negedge clk);
          @(negedge clk);
         $finish;
     end
endmodule

