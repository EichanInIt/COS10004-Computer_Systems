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
      MOV R1, #Line
      STR R1, .WriteString
PlayerTurn:
//Player <name>, There are <X> matchsticks remaining
      MOV R1, #Line     ;Go down a line for display purposes
      STR R1, .WriteString
      MOV R1, #PlayerAndName
      STR R1, .WriteString
      MOV R1, #PlayerName
      STR R1, .WriteString
      MOV R1, #ThereAre
      STR R1, .WriteString
      STR R3, .WriteUnsignedNum
      MOV R1, #RemainingEnd
      STR R1, .WriteString
//Player <name>,  how many do you want to remove (1-7)?
      MOV R1, #PlayerAndName
      STR R1, .WriteString
      MOV R1, #PlayerName
      STR R1, .WriteString
      MOV R1, #AskinRemovNum
      STR R1, .WriteString
//Loading Input Num Into R0
      LDR R0, .InputNum
//Remov Input Validation
      CMP R0, #1
      BLT PlayerTurn
      CMP R0, #7
      BGT PlayerTurn
      CMP R0, R3 
      BGT PlayerTurn
// Calculate Remaining MS
      SUB R3, R3, R0
//Game Over Validation
      CMP R3, #0
      BGT PlayerTurn
GameOver:
      MOV R1, #GameOverPrompt
      STR R1, .WriteString
      HALT
InputNamePrompt: .ASCIZ "“Please enter your name\n"
InputMSPrompt: .ASCIZ "How many matchsticks (10-100)?\n"
Line: .ASCIZ "\n"
PlayerAnnouncement: .ASCIZ "Player 1 is "
MSAnnouncement: .ASCIZ "Matchsticks: "
PlayerName: .BLOCK 8
PlayerAndName: .ASCIZ "Player "
ThereAre: .ASCIZ ", there are "
RemainingEnd: .ASCIZ "remaining\n"
AskinRemovNum: .ASCIZ ", how many do you want to remove(1-7)\n"
GameOverPrompt: .ASCIZ "Game Over"
