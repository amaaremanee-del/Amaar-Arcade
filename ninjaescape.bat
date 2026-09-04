@echo off
title Ninja Escape
color 0A
setlocal enabledelayedexpansion

set level=1
set stealth=3

:menu
cls
echo ==========================
echo        NINJA ESCAPE
echo ==========================
echo.
echo 1) Start
echo 2) Instructions
echo 3) Quit
echo.
set /p choice=Choose: 

if "%choice%"=="1" goto start
if "%choice%"=="2" goto help
if "%choice%"=="3" exit
goto menu

:help
cls
echo NINJA ESCAPE
echo.
echo Guards patrol the fortress.
echo Each level, choose:
echo   H = Hide
echo   S = Sprint
echo   A = Attack
echo.
echo Wrong choice = lose stealth.
echo Lose all stealth = caught.
echo.
pause
goto menu

:start
set level=1
set stealth=3

:level_loop
cls
echo ==========================
echo        LEVEL !level!
echo ==========================
echo Stealth points: !stealth!
echo.
echo You see a guard ahead...
echo What do you do?
echo.
echo [H]ide   [S]print   [A]ttack
echo.
set /p move=Your move: 
set move=!move!

if /i "!move!"=="H" goto check
if /i "!move!"=="S" goto check
if /i "!move!"=="A" goto check

echo.
echo Invalid choice.
pause
goto level_loop

:check
set /a best=%random% %% 3

rem 0=H,1=S,2=A
if /i "!move!"=="H" set choice=0
if /i "!move!"=="S" set choice=1
if /i "!move!"=="A" set choice=2

if "!choice!"=="!best!" goto success

set /a stealth-=1
cls
echo The guard almost spotted you!
echo You lose 1 stealth point.
echo Stealth left: !stealth!
echo.
if "!stealth!"=="0" goto caught
pause
goto level_loop

:success
set /a level+=1
cls
echo Smooth move, ninja.
echo You slip past the guard.
echo.
echo Next level...
pause
goto level_loop

:caught
cls
echo ==========================
echo         CAUGHT!
echo ==========================
echo.
echo You ran out of stealth.
echo Levels escaped: !level!
echo.
pause
goto menu   