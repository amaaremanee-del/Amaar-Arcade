@echo off
title Battle Arena
color 0a

set player=30
set enemy=25
set potions=2

:battle
cls
echo ==== BATTLE ARENA ====
echo Your HP: %player%
echo Enemy HP: %enemy%
echo Potions: %potions%
echo.
echo 1) Attack
echo 2) Heavy Attack
echo 3) Potion
echo 4) Run
set /p c=Choose: 

if "%c%"=="1" goto attack
if "%c%"=="2" goto heavy
if "%c%"=="3" goto potion
if "%c%"=="4" goto run

goto battle

:attack
set /a dmg=%random% %%6 + 3
set /a enemy-=dmg
echo You hit for %dmg%!
goto enemyturn

:heavy
set /a miss=%random% %%3
if %miss%==0 (
    echo Heavy attack missed!
    goto enemyturn
)
set /a dmg=%random% %%12 + 5
set /a enemy-=dmg
echo Heavy hit for %dmg%!
goto enemyturn

:potion
if %potions% LEQ 0 (
    echo No potions left!
    pause
    goto battle
)
set /a player+=10
set /a potions-=1
echo You healed +10!
goto enemyturn

:run
echo You try to run...
set /a esc=%random% %%2
if %esc%==0 (
    echo You failed to escape!
    goto enemyturn
)
echo You escaped!
pause
exit

:enemyturn
if %enemy% LEQ 0 goto win
set /a edmg=%random% %%8 + 2
set /a player-=edmg
echo Enemy hits for %edmg%!
pause
if %player% LEQ 0 goto lose
goto battle

:win
cls
echo YOU WIN!
pause
exit

:lose
cls
echo YOU DIED!
pause
exit