      MOV R1, #arrayData
      MOV R4, #reversedArray
      MOV R2, #36
Loop:
      LDR R0, [R1 + R2]
      STR R0, [R4 + R5]
      STR R0, .WriteUnsignedNum
      SUB R1, R1, #4
      ADD R5, R5, #4
      ADD R3, R3, #1
      CMP R3, #10
      BLT Loop
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
reversedArray: .BLOCK 40
//NOTE: reversedArray is at 0x12c - 0x153
