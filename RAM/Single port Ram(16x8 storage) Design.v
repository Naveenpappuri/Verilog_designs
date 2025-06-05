`timescale 1ns / 1ps
module single_port_RAM #(parameter WIDTH=8, DEPTH=4)(
    input wire clk,
    input wire rstn,
    input wire [WIDTH-1:0] data_in,
    input wire [DEPTH-1:0] addr,
    input wire en,
    output reg [WIDTH-1:0] data_out
    );
    integer i;
    reg [WIDTH-1:0] mem [2**(DEPTH)-1:0];
    always@(posedge clk) begin
        if(!rstn) begin
            for(i=0;i < 2**DEPTH-1; i=i+1) begin
                mem[i] <= {WIDTH{1'd0}};
            end
        end else begin
            if(en) begin
                mem[addr] <= data_in; 
            end else begin
                data_out <= mem[addr];
            end
        end
    end
endmodule
