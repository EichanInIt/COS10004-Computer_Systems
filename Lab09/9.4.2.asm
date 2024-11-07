      MOV R1, #arrayData
      MOV R2, #36 
Loop:
      LDR R4, [R1 + R2]
      LDR R5, [R1 + R3]
//Storing them back 
      STR R4, [R1 + R3]
      STR R5, [R1 + R2]
//Indexing
      SUB R2, R2, #4
      ADD R3, R3, #4
      ADD R6, R6, #1
      CMP R6, #5
      BLT Loop
      HALT
      .ALIGN 256 
arrayLength: 10
arrayData: 
      9 
      8
      7
      6
      5
      4
      3
      2
      1
      0 
