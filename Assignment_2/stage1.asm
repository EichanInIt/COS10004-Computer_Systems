//Game SetUp:
InputName: 
      MOV R2, #InputNamePrompt ; "Please Enter Your Name"
      STR R2, .WriteString
      MOV R0, #PlayerName ; Entering Name
      STR R0, .ReadString
EnterMS:
      MOV R2, #InputMSPrompt ; "How many matchsticks (10 - 100)"
      STR R2, .WriteString 
      LDR R1, .InputNum ; Entering MS
/MatchStick Input Validation
      CMP R1, #10
      BLT EnterMS
      CMP R1, #100
      BGT EnterMS
Announcement:
      MOV R2, #Line     ;Go down 1 line
      STR R2, .WriteString 
      MOV R2, #PlayerAnnouncementPrompt ; "Player 1 is <PlayerName>"
      STR R2, .WriteString
      MOV R2, #PlayerName
      STR R2, .WriteString
      MOV R2, #Line     ; Go down a line 
      STR R2, .WriteString 
      MOV R2, #MSAnnouncementPrompt ; "MatchSticks: <number of matchsticks>" 
      STR R2, .WriteString
      STR R1, .WriteUnsignedNum 
      HALT
InputNamePrompt: .ASCIZ "“Please enter your name\n"
InputMSPrompt: .ASCIZ "How many matchsticks (10-100)?\n"
PlayerAnnouncementPrompt: .ASCIZ "Player 1 is "
MSAnnouncementPrompt: .ASCIZ "Matchsticks: "
Line: .ASCIZ "\n"
PlayerName: .BLOCK 8
