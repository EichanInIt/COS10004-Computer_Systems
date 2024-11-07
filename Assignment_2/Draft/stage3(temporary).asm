//Main
InputName: 
      MOV R2, #InputNamePrompt ; "Please Enter Your Name"
      STR R2, .WriteString
      MOV R0, #PlayerName ;Entering Name
      STR R0, .ReadString
EnterMS:
      MOV R2, #InputMSPrompt ; "How many matchsticks (10 - 100)"
      STR R2, .WriteString 
      LDR R0, .InputNum ;Entering MS
      CMP R0, #10       ;Validating InputMS with 10
      BLT EnterMS
      CMP R0, #100      ;Validating InputMS with 100
      BGT EnterMS
      MOV R1, R0        ;Moving InputMS from R0 into R1 to keep tracks of remaining MS
Announcement:
      BL GoDownLine
      MOV R2, #PlayerAnnouncementPrompt ; "Player 1 is <PlayerName>"
      STR R2, .WriteString
      MOV R2, #PlayerName
      STR R2, .WriteString
      BL GoDownLine
      MOV R2, #MSAnnouncementPrompt ; "MatchSticks: <number of matchsticks>" 
      STR R2, .WriteString
      STR R1, .WriteUnsignedNum ; 
      BL GoDownLine
      BL GoDownLine
PlayerTurn:
      BL PlayerAndName  ;“Player <name>, "
      MOV R2, #ThereAre ;"there are <X> matchsticks remaining"
      STR R2, .WriteString
      STR R1, .WriteUnsignedNum ;
      MOV R2, #MatchStickRemaining
      STR R2, .WriteString
      BL PlayerAndName  ;“Player <name>, "
      MOV R2, #RemovMSPrompt ;"how many do you want to remove (1-7)?"
      STR R2, .WriteString
      LDR R0, .InputNum ;Entering remov
      CMP R0, #1        ;Validating remov with 1
      BLT PlayerTurn
      CMP R0, #7        ;Validating remov with 7
      BGT PlayerTurn
      CMP R0, R1        ;Validating remov with remaining MS
      BGT PlayerTurn
      SUB R1, R1, R0    ;Calculating Remaining MS
      BL PlayerWinValidation ;Validating if Player Win 
ComputerTurn:
      MOV R2, #ComputerTurnPrompt ;"Computer Player’s turn"
      STR R2, .WriteString
ComputerSelect:
      LDR R0, .Random   ;CPT Input
      AND R0, R0, #7
      CMP R0, #0        ;Validating CPT input with #0
      BEQ ComputerSelect
      CMP R0, R1        ;Validating CPT input with remaining MS
      BGT ComputerSelect
      SUB R1, R1, R0    ;Calculating Remaining MS
      BL PlayerLoseValidation ;Validating if CPT win (Player lose)
      B PlayerTurn
PlayerWin:
      BL GoDownLine
      BL PlayerAndName  ;“Player <name>, "
      MOV R2, #PlayerWinPrompt ;"YOU WIN!"
      STR R2, .WriteString
      B GameOver        ;
PlayerLose:
      BL GoDownLine
      BL PlayerAndName  ;“Player <name>, "
      MOV R2, #PlayerLosePrompt ;"YOU LOSE!"
      STR R2, .WriteString
      B GameOver        ;
Draw: 
      BL GoDownLine
      MOV R2, #DrawPrompt ;"It’s a draw!"
      STR R2, .WriteString
      B GameOver        ;
GameOver:
      BL GoDownLine
      MOV R2, #GameOverPrompt ;"Game Over"
      STR R2, .WriteString
      BL GoDownLine
      HALT
//Function
PlayerWinValidation:
      CMP R1, #1
      BEQ PlayerWin
      CMP R1, #0
      BEQ Draw
      RET
PlayerLoseValidation:
      CMP R1, #1
      BEQ PlayerLose
      CMP R1, #0
      BEQ Draw
      RET
PlayerAndName:
      MOV R2, #PlayerAndNamePrompt ; "Player "
      STR R2, .WriteString 
      MOV R2, #PlayerName ;"<name>"
      STR R2, .WriteString
      MOV R2, #Comma    ;", "
      STR R2, .WriteString
      RET
GoDownLine:
      MOV R2, #Line     ;Go down 1 line
      STR R2, .WriteString 
      RET
InputNamePrompt: .ASCIZ "“Please enter your name\n"
InputMSPrompt: .ASCIZ "How many matchsticks (10-100)?\n"
PlayerAnnouncementPrompt: .ASCIZ "Player 1 is "
MSAnnouncementPrompt: .ASCIZ "Matchsticks: "
PlayerAndNamePrompt: .ASCIZ "Player "
ThereAre: .ASCIZ "there are"
Comma: .ASCIZ ", "
MatchStickRemaining: .ASCIZ "matchsticks remaining\n" 
RemovMSPrompt: .ASCIZ "how many do you want to remove (1-7)?\n"
GameOverPrompt: .ASCIZ "Game Over\n"
PlayerWinPrompt: .ASCIZ "YOU WIN!\n"
PlayerLosePrompt: .ASCIZ "YOU LOSE!\n"
DrawPrompt: .ASCIZ "It's a draw!\n"
ComputerTurnPrompt: .ASCIZ "Computer Player’s turn\n"
Line: .ASCIZ "\n"
PlayerName: .BLOCK 8
