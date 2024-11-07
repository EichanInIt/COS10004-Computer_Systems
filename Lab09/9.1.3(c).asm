      MOV R1, #.PixelScreen // base address of the medium and high res pixel display memory
      MOV R2, #.red
      MOV R3, #0
loop: 
      ADD R4, R1, R3    //  calculate the byte offset (R1 + R3) for the next pixel and store new address in R4
      STR R2, [R4] 
      ADD R3,R3,#4
      CMP R3, #80
      BLT loop
//
      MOV R3, #256      ;Jump to next line
      MOV R2, #.blue
SecLineLoop:
      ADD R4, R1, R3
      STR R2, [R4]
      ADD R3, R3, #4
      CMP R3, #336
      BLT SecLineLoop 
//
      MOV R3, #128      ;Jump to the middle top pixel  
      MOV R2, #.black
Vertical:
      ADD R4, R1, R3
      STR R2, [R4]
      ADD R3, R3, #256
      CMP R3, #5120
      BLT Vertical
      HALT
