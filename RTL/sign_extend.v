`timescale 1ns / 1ps



module sign_extend(
    in,immExt,immSrc
    );
    input [31:0] in; //differnt from diagram(take every bit, later do changes)
    output [31:0] immExt;
    input immSrc;
    
    assign immExt=(~immSrc)?({{20{in[31]}},in[31:20]}):({{20{in[31]}},in[31:25],in[11:7]});  //I-type and S-type respectively
    
endmodule
