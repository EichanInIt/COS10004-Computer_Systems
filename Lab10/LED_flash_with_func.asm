      MOV R0, #.green
      MOV R1, #.white
      MOV R2, #1
flash:
      STR R0, .Pixel367
      LDR R3, .Time
      PUSH {R0}
      MOV R0, R2
      BL delay
      POP {R0}
      STR R1, .Pixel367
      LDR R3, .Time
      PUSH {R0}
      MOV R0, R2
      BL delay
      POP {R0}
      B flash
      Halt
delay:
      PUSH {R3, R4, R5, R6}
      MOV R3, R0
      LDR R4, .Time
Timer:
      LDR R5, .Time
      SUB R6, R5, R4
      CMP R6, R3
      BLT Timer
      POP {R3, R4, R5, R6}
      RET
