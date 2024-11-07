Loop: 
      MOV R0, #1        ;Input Delay (1s)
      MOV R1, #.blue    ;Input Green to draw
      BL DrawPixel
      MOV R1, #.white   ;Input white to draw (delete)
      BL DrawPixel
      B Loop
DrawPixel:
      PUSH {R3}
      MOV R3, R1        ;Input From R0
      STR R3, .Pixel367 ;Draw
      PUSH {LR}
      BL delay          ;Delay 1s
      POP {LR}
      POP {R3}
      RET
delay:
      PUSH {R3, R4, R5, R6}
      MOV R3, R0        ;Input from R0 
      LDR R4, .Time
Timer:
      LDR R5, .Time
      SUB R6, R5, R4
      CMP R6, R3
      BLT Timer
      POP {R3, R4, R5, R6}
      RET
