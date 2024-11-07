//Inputting Name    
      MOV R1, #InputNamePrompt
      STR R1, .WriteString
      MOV R0, #PlayerName
      STR R0, .ReadString
InputMS:
//MatchStick Display Prompt
      MOV R1, #InputMSPrompt 
      STR R1, .WriteString
      LDR R3, .InputNum
//MatchStick Input Validation
      CMP R3, #10
      BLT InputMS
      CMP R3, #100
      BGT InputMS
//Announcemance
      MOV R1, #PlayerAnnouncement
      STR R1, .WriteString
      MOV R1, #PlayerName
      STR R1, .WriteString
      MOV R1, #Line
      STR R1, .WriteString
      MOV R1, #MSAnnouncement
      STR R1, .WriteString
      STR R3, .WriteUnsignedNum
      HALT
InputNamePrompt: .ASCIZ "“Please enter your name\n"
InputMSPrompt: .ASCIZ "How many matchsticks (10-100)?\n"
Line: .ASCIZ "\n"
PlayerAnnouncement: .ASCIZ "Player 1 is "
MSAnnouncement: .ASCIZ "Matchsticks: "
PlayerName: .BLOCK 8
