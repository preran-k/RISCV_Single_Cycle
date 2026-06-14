# RISCV_Single_Cycle
A Verilog implementation of a single-cycle RISC-V processor

##Overview
This project implements a basic RV32I single-cycle processor capable of executing arithmetic, logical, load, and store instructions.

##Implemented Instructions

###R-Type
ADD
AND
OR
###Memory Instructions
LW (Load Word)
SW (Store Word)

##Modules
Program Counter (PC)
Instruction Memory
Register File
Sign Extension Unit
ALU
Main Decoder
ALU Decoder
Data Memory
Multiplexers
PC Adder
Top-Level Processor Module

##Project Structure

###RTL/

single_cycle_top.v
pc.v
instruction_mem.v
register_file.v
sign_extend.v
alu.v
control_unit_top.v
main_decoder.v
alu_decoder.v
data_mem.v
PC_adder.v
mux.v

###Testbench/

single_cycle_tb.v

##Tools Used

Xilinx Vivado

##Verification

The processor has been verified through behavioral simulation for:

ADD
AND
OR
LW
SW

