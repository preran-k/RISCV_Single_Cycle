`timescale 1ns / 1ps



module control_unit_top(
    zero,op,funct3,funct7,PCSrc,resultSrc,memWrite,aluSrc,regWrite,aluControl,immSrc
    );
    
    input zero;
    input [6:0] op,funct7;
    input [2:0] funct3;
    output [2:0] aluControl;
    output resultSrc,memWrite,aluSrc,regWrite,PCSrc;
    output [1:0] immSrc;
    
    wire [1:0] aluOp;
    
    main_decoder d1 (.op(op),.resultSrc(resultSrc),.memWrite(memWrite),.aluSrc(aluSrc),.immSrc(immSrc),.regWrite(regWrite),.aluOp(aluOp),.zero(zero),.pcSource(PCSrc));
    
    alu_decoder d2 (.aluOp(aluOp),.funct3(funct3),.funct7(funct7),.op(op),.aluControl(aluControl));
endmodule
