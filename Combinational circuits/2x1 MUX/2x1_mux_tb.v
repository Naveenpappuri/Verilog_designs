
//Test bench for 2x1 mux
`timescale 1ns / 1ps
module mux_2x1_tb();
  reg in0,in1,sel;
  wire out;
  mux_2x1_cond dut(in0,in1,sel,out);
  integer i;
  initial
  begin
     for(i=0;i<8;i=i+1)
         begin
         {in0,in1,sel}=i;
         #1;
         end
         $finish;
  end
  initial begin
      $monitor("in0=%b, in1=%b, sel=%b, out=%b", in0,in1,sel,out);
  end
  
endmodule
