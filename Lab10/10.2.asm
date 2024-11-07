RapidFlashingLoop: 
      MOV R0, #1        ; Delay 1(s)
      MOV R1, #.blue    ;Input Green to draw
      BL DrawPixel
      MOV R1, #.white   ;Input white to draw (delete)
      BL DrawPixel
      ADD R4, R4, #1 
      CMP R4, #3        ;Set Limit at 3 for R4
      BLT RapidFlashingLoop
      MOV R0, #2        ; Delay 2(s)
      BL delay
      MOV R4, #0        ;Reset R4
      B RapidFlashingLoop
DrawPixel:
      PUSH {R3}
      MOV R3, R1        ;Input From R0
      STR R3, .Pixel367 ;Draw
      PUSH {LR}
      BL delay          ;Delay 1(s)
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
