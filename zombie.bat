@echo off
title Zombie Survival
color 0a

set hp=20
set food=2

:loop
cls
echo ==== ZOMBIE SURVIVAL ====
echo HP: %hp%
echo Food: %food%
echo.
echo 1) Search area
echo 2) Eat food
echo 3) Rest
echo 4) Quit
set /p c=Choose: 

if "%c%"=="1" goto search
if "%c%"=="2" goto eat
if "%c%"=="3" goto rest
if "%c%"=="4" exit

goto loop

:search
set /a event=%random% %%3
if %event%==0 goto zombie
if %event%==1 goto loot
goto nothing

:zombie
set /a dmg=%random% %%6 + 1
set /a hp-=dmg
echo A zombie attacked! You lost %dmg% HP!
pause
goto loop

:loot
set /a food+=1
echo You found food!
pause
goto loop

:nothing
echo Nothing happened.
pause
goto loop

:eat
if %food% LEQ 0 (
    echo No food left!
    pause
    goto loop
)
set /a food-=1
set /a hp+=5
echo You ate food and healed +5 HP!
pause
goto loop

:rest
set /a hp+=3
echo You rested and gained +3 HP.
pause
goto loop