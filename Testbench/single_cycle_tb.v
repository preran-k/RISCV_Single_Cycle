`timescale 1ns / 1ps



module single_cycle_tb(
    
    );
    
    reg clk;
    reg rst;
    
    single_cycle_top dut(
       .clk(clk),.rst(rst)
    );
    always #5 clk = ~clk;
     
     initial begin
//        $monitor("t=%0t x6=%0d x9=%0d x4=%0d",
//             $time,
//             dut.u3.registers[6],
//             dut.u3.registers[9],
//             dut.u3.registers[4]);
             
//          $monitor("t=%0t mem[2]=%0d",
//          $time,
//          dut.u7.data_mem[2]);


        $monitor("t=%0t instr=%h x9=%0d imm=%0d RD1=%0d srcB=%0d aluResult=%0d memRD=%0d result=%0d RegWrite=%b x7=%0d",
             $time,
             dut.RD_instr,
             dut.u3.registers[9],
             dut.immExt_top,
             dut.RD1_top,
             dut.srcB,
             dut.aluResult_top,
             dut.readData_top,
             dut.result_top,
             dut.RegWrite_top,
             dut.u3.registers[7]);
          
        clk=1'b0;
        rst=1'b0;
        
            //AND operation
//            dut.u2.mem[0]=32'h005303B3;// add x7,x6,x5
//            dut.u3.registers[5]=32'd10;
//            dut.u3.registers[6]=32'd20;
        
        //OR operation or x4,x5,x6
//        dut.u2.mem[0]=32'h0062E233;
//        dut.u3.registers[5]=32'd10;
//        dut.u3.registers[6]=32'd20;

        
        //SW operation
//        dut.u2.mem[0] = 32'h0064A423;// sw x6,8(x9)
////      dut.u2.mem[0] = 32'h0064A623;  some other case
//        dut.u3.registers[6] = 32'd10;
//        dut.u3.registers[9] = 32'd4;



    //LW operation
    dut.u2.mem[0] = 32'h0084A383; // lw x7,8(x9)

    dut.u3.registers[9] = 32'd4;
    dut.u7.data_mem[3]  = 32'd123;
            
        
        #20;
        rst=1'b1;
        
        
        
        
         
        #100;
        
//        $display("x5=%d",dut.u3.registers[5]);
//        $display("x6=%d",dut.u3.registers[6]);
//        $display("x7=%d",dut.u3.registers[7]);
        $finish;
      end
endmodule
