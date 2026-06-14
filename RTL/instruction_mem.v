`timescale 1ns / 1ps



module instruction_mem(
       A,RD,rst
    );
    input [31:0] A;
    output[31:0] RD;
    input rst;
    
    reg [31:0] mem[0:1023];
//    assign RD=(rst==1'b0)?32'h00000000:mem[A[31:2]];
    assign RD=mem[A[31:2]];
endmodule
