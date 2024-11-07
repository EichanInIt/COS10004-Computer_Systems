FlashPattern:
      MOV R3, #FlashTimePrompt
      STR R3, .WriteString
      LDR R1, .InputNum
      MOV R3, #DelayTimePrompt
      STR R3, .WriteString
      LDR R2, .InputNum
RapidFlashingLoop: 
      MOV R0, #1        ; Delay 1(s)
      MOV R5, #.blue    ;Saving Blue to Draw
      BL DrawPixel
      MOV R5, #.white   ;Saving white to draw (delete)
      BL DrawPixel
      ADD R4, R4, #1 
      CMP R4, R1        ;Set Limit for R4
      BLT RapidFlashingLoop
      MOV R0, R2        ; Set Delay Time
      BL delay
      MOV R4, #0        ;Reset R4
      B RapidFlashingLoop
DrawPixel:
      PUSH {R3}
      MOV R3, R5        ;Input From R5 into R3
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
FlashTimePrompt: .ASCIZ "How many time you want it to rapid flash???"
DelayTimePrompt: .ASCIZ "How many seconds you want it to delay between each rapid flash???"
