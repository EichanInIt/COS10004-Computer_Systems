// Author: MOON (Trung Kien Nguyen - sID 104053642)
//------------------------------------
// Stage 1: Game Setup
//
      MOV R0, #t0       // For adding a new line
//  Read and write codebreaker's name (Store in R3)
      MOV R3, #t1
      STR R3, .WriteString
      MOV R3, #cbn
      STR R3, .ReadString
      STR R3, .WriteString
      STR R0, .WriteString
//  Read and write codemaker's name (Store in R2)
      MOV R2, #t2
      STR R2, .WriteString
      MOV R2, #cmn
      STR R2, .ReadString
      STR R2, .WriteString
      STR R0, .WriteString
//  Read and write the number of guesses (Store in R1)
      MOV R1, #t3
      STR R1, .WriteString
      MOV R1, #cbn
      LDR R1, .InputNum
      STR R1, .WriteUnsignedNum
      STR R0, .WriteString
      B stage3
//
// Stage 2: Code entry function
//
getcode:
      PUSH {R4, R5, R6, R7}
begin:
      MOV R7, #0        // The number of 'color' chars of the code
      MOV R4, #t4
      STR R4, .WriteString
      MOV R4, #code
      STR R4, .ReadSecret
      MOV R5, #0        // Index variable for the loop 1
loop1:
      LDRB R6, [R4 + R5]
      ADD R5, R5, #1
      CMP R6, #114      // Compare the char with "r"
      BEQ color
      CMP R6, #103      // Compare the char with "g"
      BEQ color
      CMP R6, #98       // Compare the char with "b"
      BEQ color
      CMP R6, #121      // Compare the char with "y"
      BEQ color
      CMP R6, #112      // Compare the char with "p"
      BEQ color
      CMP R6, #99       // Compare the char with "c"
      BEQ color
next1:
      CMP R6, #0
      BNE loop1
      CMP R5, #5
      BNE begin
      CMP R7, #4        // Compare the number of 'color' chars with 4
      BNE begin
      B stage2done
color:
      ADD R7, R7, #1
      B next1
stage2done:
      MOV R0, R4        // Return the valid code to R0
      POP {R4, R5, R6, R7}
      RET
//
// Stage 3: Getting the Secret Code
//
stage3:
      STR R2, .WriteString
      MOV R0, #t5 
      STR R0, .WriteString
      BL getcode
//  Store the secret code in the "secretcode" array
      PUSH {R4, R5, R6, R7}
      MOV R4, R0        // Assign the secret code in R4
      MOV R5, #0        // Index variable for the loop 2
      MOV R7, #secretcode // Index variable for the "secretcode" array
loop2:
      LDRB R6, [R4 + R5]
      ADD R5, R5, #1
      STR R6, [R7]      // Store each 'color' char in each element of the array
      ADD R7, R7, #4
      CMP R5, #4
      BLT loop2
      POP {R4, R5, R6, R7}
//
// Stage 4: Query code entry
//
      PUSH {R12}
//  R12 is used for storing the value of guessing order
      MOV R12, #0
loop3:                  // Loop for codebreaker's guessing
      ADD R12, R12, #1
      STR R3, .WriteString
      MOV R0, #t6
      STR R0, .WriteString
      STR R12, .WriteUnsignedNum
      BL getcode
//  Store the query code in the "querycode" array
      PUSH {R4, R5, R6, R7}
      MOV R4, R0        // Assign the query code in R4
      MOV R5, #0        // Index variable for the loop 4
      MOV R7, #querycode // Index variable for the "querycode" array
loop4:
      LDRB R6, [R4 + R5]
      ADD R5, R5, #1
      STR R6, [R7]      // Store each 'color' char in each element of the array
      ADD R7, R7, #4
      CMP R5, #4
      BLT loop4
      POP {R4, R5, R6, R7}
      CMP R12, R1
      BLT loop3
      POP {R12}
stop: HALT
// Stop!!
      .ALIGN 256
secretcode:             // Set up the "secretcode array"
      0
      0
      0
      0
querycode:              // Set up the "querycode array"
      0
      0
      0
      0
t0:   .ASCIZ "\n"
t1:   .ASCIZ "Codebreaker is "
t2:   .ASCIZ "Codemaker is "
t3:   .ASCIZ "Maximum number of guesses: "
cbn:  .BLOCK 128
cmn:  .BLOCK 128
t4:   .ASCIZ "\nEnter a code: \n"
code: .BLOCK 128
t5:   .ASCIZ ", please enter a 4-character secret code"
t6:   .ASCIZ ", this is guess number: "
