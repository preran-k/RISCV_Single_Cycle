`timescale 1ns / 1ps



module alu(
    A,B,aluControl,result,C,N,Z,V
    );
    input [31:0] A,B;
    input [2:0] aluControl;
    output [31:0] result;
    output C,N,Z,V;
    
    //mux
    wire [31:0] mux_1;
    wire [31:0] mux_2;
    
    wire [31:0] not_b;
    wire [31:0] sum;
    wire [31:0] a_and_b;
    wire [31:0] a_or_b;
    wire [31:0] slt;
    wire cout;
    
    
    assign not_b=~B;
    assign mux_1=aluControl[0]?not_b:B;
    
    assign {cout,sum}=A+mux_1+aluControl[0];
    assign a_and_b=A&B;
    assign a_or_b=A|B;
    assign slt={31'b0000000000000000000000000000000,sum[31]};
    
    assign mux_2=(aluControl[2:0]==3'b000)?sum:
    (aluControl[2:0]==3'b001)?sum:
    (aluControl[2:0]==3'b010)?a_and_b:
    (aluControl[2:0]==3'b011)?a_or_b:
    (aluControl[2:0]==3'b101)?slt:32'h0;
    
    assign result=mux_2;
    
    assign C=cout&(~aluControl[1]);
    assign Z=&(~result);
    assign N=result[31];
    assign V=(~aluControl[1])&(sum[31]^A[31])&(~(A[31]^B[31]^aluControl[0]));//overflow
                                
    
    
    
    
endmodule
