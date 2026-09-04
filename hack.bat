@echo off
title Hacker Typer
color 0a

cls
echo ============================
echo      HACKER TYPER GAME
echo ============================
echo Type the word EXACTLY as shown.
echo.

set level=1

:level1
set word=ACCESS
echo Type: %word%
set /p input=
if "%input%"=="%word%" goto level2
echo Wrong! Try again.
goto level1

:level2
set word=OVERRIDE
echo Type: %word%
set /p input=
if "%input%"=="%word%" goto level3
echo Wrong! Try again.
goto level2

:level3
set word=PROTOCOL
echo Type: %word%
set /p input=
if "%input%"=="%word%" goto win
echo Wrong! Try again.
goto level3

:win
cls
echo SYSTEM BREACHED.
echo You win.
pause
exit