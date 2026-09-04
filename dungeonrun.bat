@echo off
title Dungeon Runner
color 0A

setlocal enabledelayedexpansion

set score=0
set level=1

:menu
cls
echo ==========================
echo        DUNGEON RUNNER
echo ==========================
echo.
echo 1) Start Game
echo 2) Instructions
echo 3) Quit
echo.
set /p choice=Choose an option: 

if "%choice%"=="1" goto start
if "%choice%"=="2" goto help
if "%choice%"=="3" exit
goto menu

:help
cls
echo DUNGEON RUNNER
echo.
echo You are running through a dungeon.
echo Each round, you must choose:
echo   L = Left
echo   R = Right
echo   J = Jump
echo.
echo One option is a TRAP.
echo Survive as many rounds as you can.
echo.
pause
goto menu

:start
set score=0
set level=1

:round
cls
echo ==========================
echo        LEVEL !level!
echo ==========================
echo Score: !score!
echo.
echo You run into a corridor...
echo What do you do?
echo.
echo [L]eft   [R]ight   [J]ump
echo.
set /p move=Your move: 
set move=!move!

if /i "!move!"=="L" goto check
if /i "!move!"=="R" goto check
if /i "!move!"=="J" goto check

echo.
echo Invalid move!
pause
goto round

:check
set /a trap=%random% %% 3

rem 0 = L, 1 = R, 2 = J
if /i "!move!"=="L" set choice=0
if /i "!move!"=="R" set choice=1
if /i "!move!"=="J" set choice=2

if "!choice!"=="!trap!" goto dead

set /a score+=10
set /a level+=1
echo.
echo You dodged the trap!
echo +10 points
pause
goto round

:dead
cls
echo ==========================
echo         GAME OVER
echo ==========================
echo.
echo You triggered a trap!
echo Final score: !score!
echo Levels survived: !level!
echo.
pause
goto menu