      MOV R1, #arrayData
Loop:
      LDR R3, [R1] 
      ADD R0, R0, R3
      ADD R1, R1, #4
      ADD R2, R2, #1
      CMP R2, #arrayLength
      BLT Loop
      STR R0, .WriteUnsignedNum
      HALT
      .ALIGN 256 
arrayLength: 10
arrayData: 9 
      8
      7
      6
      5
      4
      3
      2
      1
      0 
