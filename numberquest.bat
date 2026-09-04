@echo off
title Number Quest
color 0a

set /a secret=%random% %%20 + 1
set tries=5

:game
cls
echo ==== NUMBER QUEST ====
echo Guess the number (1–20)
echo Tries left: %tries%
set /p g=Your guess: 

if %g%==%secret% goto win

set /a tries-=1
if %tries%==0 goto lose

echo Wrong!
pause
goto game

:win
cls
echo YOU FOUND THE SECRET NUMBER!
pause
exit

:lose
cls
echo You ran out of tries!
echo The number was %secret%.
pause
exit