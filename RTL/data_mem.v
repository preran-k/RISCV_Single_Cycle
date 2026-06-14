`timescale 1ns / 1ps



module data_mem(
clk,A,WD,RD,WE,rst
    );
    
    input clk,rst;
    input [31:0] A,WD;
    input WE;
    output [31:0] RD;
    
    reg[31:0] data_mem[0:1023];
    
    assign RD=(~rst)?32'h00000000:data_mem[A[31:2]];
    
    always@(posedge clk)begin
    if(WE)begin
        data_mem[A[31:2]]<=WD;
     end
    end
endmodule
