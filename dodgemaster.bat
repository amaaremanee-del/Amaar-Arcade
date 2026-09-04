@echo off
title DODGE MASTER
color 0b

set hp=15
set round=1

cls
echo ================================
echo        D O D G E   M A S T E R
echo ================================
echo You must dodge incoming attacks.
echo Survive 20 rounds to win.
echo.
pause

:game
cls
echo ================================
echo            ROUND %round%
echo ================================
echo HP: %hp%
echo.
echo The enemy is preparing an attack...
echo Choose your dodge direction:
echo.
echo 1) Left
echo 2) Right
echo 3) Duck
echo 4) Jump
echo.
set /p move=Your dodge: 

:: Enemy attack pattern
set /a attack=%random% %%4 + 1

if "%move%"=="%attack%" goto dodgeSuccess

:dodgeFail
set /a dmg=%random% %%5 + 2
set /a hp-=dmg
echo.
echo ❌ You failed to dodge!
echo You took %dmg% damage!
pause
goto checkHP

:dodgeSuccess
echo.
echo ✅ You dodged the attack perfectly!
pause
goto nextRound

:checkHP
if %hp% LEQ 0 goto lose
goto nextRound

:nextRound
set /a round+=1
if %round% GTR 20 goto win
goto game

:win
cls
color 0a
echo ================================
echo            YOU WIN!
echo ================================
echo You survived all 20 rounds!
echo Your reflexes are insane.
echo.
pause
exit

:lose
cls
color 04
echo ================================
echo            YOU LOSE
echo ================================
echo You couldn’t dodge the final blow.
echo Better luck next time.
echo.
pause
exit