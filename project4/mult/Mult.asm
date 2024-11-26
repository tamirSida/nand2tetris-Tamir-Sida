// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//we will account R0 as the number we add and R2 as the counter

//INIT R2 AS 0
@R2
M=0
//CHECK IF R0=0

@R0
D=M
@END
D;JEQ

//INIT @COUNTER VAR
@R1
D=M
@COUNTER
M=D


//MAIN LOOP
//WHEN COUNTER IS 0 END
(LOOP) 
@COUNTER
D=M
@END
D;JEQ
//IF WE ARE HERE COUNT NOT 0
@R0
D=M
@R2
M=D+M
@COUNTER
M=M-1
@LOOP
0;JMP



//SAFE TERMINATION
(END)
@END
0;JMP