`timescale 1ns / 1ps

module single_cycle_top(
       clk,rst
    );
    
    input clk,rst;
    wire [31:0] PC_top; //connects to A(PC---->A)
    
    wire [31:0] RD_instr;
    wire [31:0] immExt_top;
    wire [2:0] aluControl_top;
    wire [31:0] aluResult_top;
    wire RegWrite_top;
    wire [31:0] readData_top;
    wire [31:0] PCPlus_4;
    wire resultSrc_top;
    wire [31:0] result_top;//will go to reg file
    wire [31:0] RD1_top,RD2_top;
    wire [31:0] srcB;
    wire aluSrc_top;
    wire [1:0] immSrc_top;
    wire memWrite_top;
    
    pc u1(.PCnext(PCPlus_4),.PC(PC_top),.clk(clk),.rst(rst));
    
    instruction_mem u2(.A(PC_top),.RD(RD_instr),.rst(rst));
    
    register_file u3(.A1(RD_instr[19:15]),.A2(RD_instr[24:20]),.A3(RD_instr[11:7]),.clk(clk),.WE3(RegWrite_top),.WD3(result_top),.RD1(RD1_top),.RD2(RD2_top),.rst(rst));
    
    sign_extend u4(.in(RD_instr),.immExt(immExt_top),.immSrc(immSrc_top[0]));
    
    alu u5(.A(RD1_top),.B(srcB),.aluControl(aluControl_top),.result(aluResult_top),.C(),.N(),.Z(),.V());
    
    control_unit_top u6(.zero(),.op(RD_instr[6:0]),.funct3(RD_instr[14:12]),.funct7(RD_instr[30]),.PCSrc(),.resultSrc(resultSrc_top),.memWrite(memWrite_top),.aluSrc(aluSrc_top),.regWrite(RegWrite_top),.aluControl(aluControl_top),.immSrc(immSrc_top));
    
    data_mem u7(.clk(clk),.A(aluResult_top),.WD(RD2_top),.RD(readData_top),.WE(memWrite_top),.rst(rst));
    
    PC_adder u8(.a(PC_top),.b(32'd4),.c(PCPlus_4));
    
    mux dataMem_to_reg(.a(aluResult_top),.b(readData_top),.c(result_top),.s(resultSrc_top));
    
    mux reg_to_alu(.a(RD2_top),.b(immExt_top),.c(srcB),.s(aluSrc_top));
endmodule
