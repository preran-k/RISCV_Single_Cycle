`timescale 1ns / 1ps



module main_decoder(
    op,resultSrc,memWrite,aluSrc,immSrc,regWrite,aluOp,zero,pcSource
    );
    
    input [6:0] op;
    input zero;
    output resultSrc,memWrite,aluSrc,regWrite,pcSource;
    output [1:0] immSrc,aluOp;
    
    wire branch;
    
    assign regWrite=((op==7'b0000011)|(op==7'b0110011))?1'b1:1'b0;
    assign aluSrc=((op==7'b0000011|op==7'b0100011))?1'b1:1'b0;
    assign memWrite=((op==7'b0100011))?1'b1:1'b0;
    assign resultSrc=((op == 7'b0000011))?1'b1:1'b0;
    assign immSrc=((op==7'b0100011))?2'b01:((op==7'b1100011))?2'b10:2'b00;
    assign aluOp=((op==7'b1100011))?2'b01:((op == 7'b0110011))?2'b10:2'b00;
    
    assign branch=(op==7'b1100011)?1'b1:1'b0;
    assign pcSource=zero&branch;
    
    
endmodule
