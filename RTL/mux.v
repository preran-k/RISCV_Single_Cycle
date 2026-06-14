`timescale 1ns / 1ps



module mux(
    a,b,c,s
    );
    input [31:0] a,b;
    input s;
    output [31:0] c;
    
    assign c=s?b:a;
endmodule
