`timescale 1ns / 1ps



module pc(
    PCnext,PC,clk,rst
    );
    input [31:0] PCnext;
    input clk,rst;
    output reg [31:0] PC;
    
    always@(posedge clk)begin
        if(rst==1'b0)begin
            PC<=32'h00000000;
         end
         else begin
            PC<=PCnext;
          end
     end
endmodule
