@echo off
title Reaction Rush
color 0a

set hp=10
set round=1

:game
cls
echo ================================
echo         REACTION RUSH
echo ================================
echo HP: %hp%
echo Round: %round%
echo.
echo When the symbol appears, type it FAST!
echo You have **1 second**.
echo.

:: Generate random symbol
set /a sym=%random% %%4

if %sym%==0 set symbol=@
if %sym%==1 set symbol=#
if %sym%==2 set symbol=%
if %sym%==3 set symbol=!

echo SYMBOL: %symbol%
echo.
echo Type it NOW:

:: Wait 1 second for input
set input=
set /p input= >nul

timeout /t 1 >nul

if "%input%"=="%symbol%" goto success

:fail
set /a dmg=%random% %%3 + 1
set /a hp-=dmg
echo.
echo ❌ TOO SLOW!
echo You took %dmg% damage!
pause
goto check

:success
echo.
echo ✅ NICE! You reacted fast!
pause
goto next

:check
if %hp% LEQ 0 goto lose
goto next

:next
set /a round+=1
if %round% GTR 15 goto win
goto game

:win
cls
color 0a
echo ================================
echo            YOU WIN!
echo ================================
echo Your reflexes are insane.
echo You survived all 15 rounds!
echo.
pause
exit

:lose
cls
color 04
echo ================================
echo            YOU LOSE
echo ================================
echo You failed to react in time.
echo Better luck next time.
echo.
pause
exit