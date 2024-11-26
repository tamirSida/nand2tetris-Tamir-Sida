// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

(RESET)
// RAM[i] = 0
@i
M=0
// get val from keybord
@KBD
D=M
@BLACK
D;JGT
@WHITE
D;JEQ

(BLACK)
@i
D=M 
@SCREEN

//go the right place in screen
A=D+A
//color pixel in black 
M=-1 
@NEXTB
0;JMP

(NEXTB)
//if i <= 8191 reset
@8192 
D=A
@i
M=M+1
D=D-M
@RESET
D;JLE
// else goto black
@BLACK
0;JMP

(WHITE)
@i
D=M // D = RAM[i]
@SCREEN

//goto the right place in screen
A=D+A 
M=0 

//color pixel in white
@NEXTW
0;JMP

(NEXTW)
//if i <= 8191 reset
@8192 
D=A
@i
M=M+1
D=D-M
@RESET
D;JLE
// else increase i
@WHITE
0;JMP