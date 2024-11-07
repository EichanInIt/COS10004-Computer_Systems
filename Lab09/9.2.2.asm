      MOV R1, #.PixelScreen 
      MOV R2, #.red
      MOV R4, #80       //Init R4 as limit
loop: 
      STR R2, [R1 + R3] 
      ADD R3,R3,#4 
      CMP R3, R4
      BLT loop
      ADD R3, R3, #176  ;Jump to next round
      ADD R4, R4, #256  ;Set new Limit
      CMP R4, #2384     ;Check if there r 10 round (80 + 256 x 9)
      BLT loop
      HALT
