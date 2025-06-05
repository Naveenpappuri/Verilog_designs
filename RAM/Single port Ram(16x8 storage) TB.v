`timescale 1ns / 1ps
module single_port_RAM_tb();
     parameter WIDTH=8,DEPTH=4;
     reg clk;                
     reg rstn;               
     reg [WIDTH-1:0] data_in;
     reg [DEPTH-1:0] addr; 
     reg en;   
     wire [WIDTH-1:0] data_out;
     single_port_RAM dut(
         .clk(clk),
         .rstn(rstn),
         .data_in(data_in),
         .addr(addr),
         .en(en),
         .data_out(data_out)
         );
         
     initial begin
         clk=1'b0;
         forever #5 clk=~clk;
     end    
     initial begin
         @(negedge clk) rstn=1'b0;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd15; en=1'b1;
         /*for(i=0; i<WIDTH-1; i=i+1) begin
             @(negedge clk) data_in=$random; addr=$random; en=1'b1;
         end
         for(j=0; j<WIDTH-1; j=j+1) begin
             @(negedge clk) en=1'b0; addr=$random;
         end*/
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd14; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd13; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd12; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd11; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd10; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd9; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd8; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd7; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd6; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd5; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd4; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd3; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd2; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd1; en=1'b1;
         @(negedge clk) rstn=1'b1;data_in=$random; addr=4'd0; en=1'b1;
         //read operation
          @(negedge clk)  addr=4'd15; en=1'b0;
          @(negedge clk)  addr=4'd14; en=1'b0;
          @(negedge clk)  addr=4'd13; en=1'b0;
          @(negedge clk)  addr=4'd12; en=1'b0;
          @(negedge clk)  addr=4'd11; en=1'b0;
          @(negedge clk)  addr=4'd10; en=1'b0;
          @(negedge clk)  addr=4'd9; en=1'b0;
          @(negedge clk)  addr=4'd8; en=1'b0;
          @(negedge clk)  addr=4'd7; en=1'b0;
          @(negedge clk)  addr=4'd6; en=1'b0;
          @(negedge clk)  addr=4'd5; en=1'b0;
          @(negedge clk)  addr=4'd4; en=1'b0;
          @(negedge clk)  addr=4'd3; en=1'b0;
          @(negedge clk)  addr=4'd2; en=1'b0;
          @(negedge clk)  addr=4'd1; en=1'b0;
          @(negedge clk)  addr=4'd0; en=1'b0;
          @(negedge clk);
          @(negedge clk);
          @(negedge clk);
         $finish;
     end
endmodule
