@echo off
title AMAAR ARCADE
color 0e

:: ============================
:: INTRO ANIMATION
:: ============================
cls
echo Loading Amaar Arcade...
ping localhost -n 2 >nul
cls
echo █████╗ ███╗   ███╗ █████╗  █████╗ ██████╗ 
ping localhost -n 1 >nul
echo ██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗
ping localhost -n 1 >nul
echo ███████║██╔████╔██║███████║███████║██████╔╝
ping localhost -n 1 >nul
echo ██╔══██║██║╚██╔╝██║██╔══██║██╔══██║██╔══██╗
ping localhost -n 1 >nul
echo ██║  ██║██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██║
ping localhost -n 1 >nul
echo ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
ping localhost -n 2 >nul

:menu
cls
echo ======================================
echo             AMAAR ARCADE
echo ======================================
echo Choose a game to play:
echo.
echo ORIGINAL GAMES:
echo 1) Boss Fight — The Terminator
echo 2) Dodge Master
echo 3) Reaction Rush
echo 4) CMD Dungeon
echo 5) Battle Arena
echo 6) Hacker Typer
echo 7) Number Quest
echo 8) GunSpin Text Edition
echo 9) Zombie Survival
echo 10) Escape the Facility
echo.
echo NEW GAMES:
echo 11) Dungeon Runner
echo 12) Code Breaker
echo 13) Ninja Escape
echo 14) Reaction Clicker (HTML)
echo.
echo 0) Exit Arcade
echo.
set /p choice=Select: 

:: ORIGINAL GAMES
if "%choice%"=="1" start bossfight.bat
if "%choice%"=="2" start dodgemaster.bat
if "%choice%"=="3" start reactionrush.bat
if "%choice%"=="4" start dungeon.bat
if "%choice%"=="5" start battle.bat
if "%choice%"=="6" start hack.bat
if "%choice%"=="7" start numberquest.bat
if "%choice%"=="8" start gunspin.bat
if "%choice%"=="9" start zombie.bat
if "%choice%"=="10" start escape.bat

:: NEW GAMES
if "%choice%"=="11" start dungeon_runner.bat
if "%choice%"=="12" start code_breaker.bat
if "%choice%"=="13" start ninja_escape.bat
if "%choice%"=="14" start "" "reaction_clicker.html"

if "%choice%"=="0" exit

goto menu