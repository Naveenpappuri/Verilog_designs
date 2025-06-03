
//Test Bench for 4x1 Mux
`timescale 1ns / 1ps
module mux_4x1_cond_tb();
reg [3:0]i;
reg [1:0]sel;
wire out;
mux_4x1_cond dut(i,sel,out);

initial begin
   i = 4'b1010;
   sel = 2'b00;#1;
   sel = 2'b01;#1;
   sel = 2'b10;#1;
   sel = 2'b11;#1;
   i = 4'b0111;
   sel = 2'b00;#1;
   sel = 2'b01;#1;
   sel = 2'b10;#1;
   sel = 2'b11;#1;
   $finish;
end
initial begin
   $monitor("[3:0]i=%b, [1:0]sel=%b, out=%b",i,sel,out);
end
endmodule
