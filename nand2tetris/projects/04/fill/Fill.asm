// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
  @KBD
  D=M
  @SET_BLACK
  D;JNE
  @SET_WHITE
  0;JMP

(SET_BLACK)
  @color
  M=-1
  @SCREEN_FILL
  0;JMP

(SET_WHITE)
  @color
  M=0
  @SCREEN_FILL
  0;JMP

(SCREEN_FILL)
  // counter = 8191
  @8192
  D=A
  @counter
  M=D

(SCREEN_LOOP)
  // counter = counter - 1
  @counter
  M=M-1

  // SCREEN[counter] = color
  @SCREEN
  D=A
  @counter
  D=D+M
  @screenPos
  M=D
  @color
  D=M
  @screenPos
  A=M
  M=D

  // if (i > 0) go back to SCREEN_WORD
  @counter
  D=M
  @SCREEN_LOOP
  D;JGT

  @LOOP
  0;JMP
