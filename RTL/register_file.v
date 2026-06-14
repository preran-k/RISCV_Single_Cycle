`timescale 1ns / 1ps



module register_file(
A1,A2,A3,clk,WE3,WD3,RD1,RD2,rst
    );
    input [4:0] A1,A2,A3;
    input clk,rst;
    input WE3;
    input [31:0] WD3;
    output [31:0] RD1,RD2;
    
    reg [31:0] registers [0:31];
    
//    assign  RD1=(!rst)?32'h00000000:registers[A1];
//    assign  RD2=(!rst)?32'h00000000:registers[A2];
    assign  RD1=registers[A1];
    assign  RD2=registers[A2];
    
    always@(posedge clk)begin
        if(WE3)begin
            registers[A3]<=WD3;
         end
     end
endmodule
