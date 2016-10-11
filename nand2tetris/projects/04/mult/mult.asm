// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


// set sum = 0
@sum
M=0

// set countdown = R1
  @R1
  D=M
  @countDown
  M=D

(LOOP)
  // if (countDown <= 0) go back to loop
  @countDown
  D=M
  @RESULT
  D;JLE

  // sum = R0 + sum
  @R0
  D=M
  @sum
  M=D+M

  // countDown = countDown - 1
  @countDown
  M=M-1
  @LOOP
  0;JMP

// R2 = sum
(RESULT)
  @sum
  D=M
  @R2
  M=D

(END)
  @END
  0;JMP
