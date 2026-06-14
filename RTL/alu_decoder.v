`timescale 1ns / 1ps



module alu_decoder(
        aluOp,funct3,funct7,op,aluControl
    );
    input [1:0] aluOp;
    input [2:0] funct3;
    input funct7;
    input [6:0] op;
    output [2:0] aluControl;
    
    wire [1:0] concat;
    assign concat={op[5],funct7};
    
    assign aluControl=(aluOp==2'b00)?3'b000:
    (aluOp==2'b01)?3'b001:
    (aluOp==2'b10)&&(funct3==3'b000)&&((concat==2'b00)||(concat==2'b10)||(concat==2'b01))?3'b000:
    (aluOp==2'b10)&&(funct3==3'b000)&&(concat==2'b11)?3'b001:
    (aluOp==2'b10)&&(funct3==3'b010)?3'b101:
    (aluOp==2'b10)&&(funct3==3'b110)?3'b011:
    (aluOp==2'b10)&&(funct3==3'b111)?3'b010:3'b000;
endmodule
