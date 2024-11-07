/ Inputting Name    
      MOV R1, #InputNamePrompt
      STR R1, .WriteString
      MOV R0, #PlayerName
      STR R0, .ReadString
InputMS:
/ MatchStick Display Prompt
      MOV R1, #InputMSPrompt 
      STR R1, .WriteString
      LDR R3, .InputNum
/ MatchStick Input Validation
      CMP R3, #10
      BLT InputMS
      CMP R3, #100
      BGT InputMS
/ Announcemance
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
/ Player <name>, There are <X> matchsticks remaining
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
/ Player <name>,  how many do you want to remove (1-7)?
      MOV R1, #PlayerAndName
      STR R1, .WriteString
      MOV R1, #PlayerName
      STR R1, .WriteString
      MOV R1, #AskinRemovNum
      STR R1, .WriteString
/ Loading Input Num Into R0
      LDR R0, .InputNum
/ Remove Input Validation
      CMP R0, #1
      BLT PlayerTurn
      CMP R0, #7
      BGT PlayerTurn
      CMP R0, R3 
      BGT PlayerTurn
/ Calculate Remaining MS
      SUB R3, R3, R0
/ PlayerWin or Draw Validation
      CMP R3, #1
      BEQ PlayerWin
      CMP R3, #0
      BEQ Draw
/ ComputerTurn
      MOV R1, #ComputerTurnPrompt
      STR R1, .WriteString
ComputerSelect:
      LDR R0, .Random
      AND R0, R0, #7
      CMP R0, #0
      BEQ ComputerSelect
      CMP R0, R3
      BGT ComputerSelect
/ Calculate Remaining MS
      SUB R3, R3, R0
/ PlayerLose Or Draw Validation
      CMP R3, #0
      BEQ Draw
      CMP R3, #1
      BEQ PlayerLose
      B PlayerTurn
PlayerWin:
      MOV R1, #PlayerAndName
      STR R1, .WriteString
      MOV R1, #PlayerName
      STR R1, .WriteString
      MOV R1, #PlayerWinPrompt
      STR R1, .WriteString
      B GameOver        ;Flag
Draw: 
      MOV R1, #DrawPrompt
      STR R1, .WriteString 
      B GameOver        ;Flag
PlayerLose:
      MOV R1, #PlayerAndName
      STR R1, .WriteString
      MOV R1, #PlayerName
      STR R1, .WriteString
      MOV R1, #PlayerLosePrompt
      STR R1, .WriteString
      B GameOver        ;Flag
GameOver:
      MOV R1, #GameOverPrompt
      STR R1, .WriteString
      HALT
/ Input Prompt
InputNamePrompt: .ASCIZ "“Please enter your name\n"
InputMSPrompt: .ASCIZ "How many matchsticks (10-100)?\n"
/ Announcement Prompt
PlayerAnnouncement: .ASCIZ "Player 1 is "
MSAnnouncement: .ASCIZ "Matchsticks: "
/ Playing Prompt
PlayerAndName: .ASCIZ "Player "
ThereAre: .ASCIZ ", there are "
RemainingEnd: .ASCIZ "remaining\n"
AskinRemovNum: .ASCIZ ", how many do you want to remove(1-7)\n"
ComputerTurnPrompt: .ASCIZ "Computer Player's Turn\n"
/ Game End Promp
GameOverPrompt: .ASCIZ "Game Over\n"
PlayerWinPrompt: .ASCIZ ", YOU WIN!\n"
PlayerLosePrompt: .ASCIZ ", YOU LOSE!\n"
DrawPrompt: .ASCIZ "It's a draw!\n"
PlayAgainPrompt: .ASCIZ "Play again (y/n) ?\n"
/ Other
Line: .ASCIZ "\n"
PlayerName: .WORD 2
PlayAgainInput: .BLOCK 1
