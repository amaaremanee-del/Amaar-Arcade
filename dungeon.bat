@echo off
title CMD Dungeon
color 0a

set hp=25
set gold=0
set room=1

:roomLoop
cls
echo ============================
echo        CMD DUNGEON
echo ============================
echo HP: %hp%
echo Gold: %gold%
echo Room: %room%
echo.
echo You enter a new room...
echo What do you do?
echo.
echo 1) Search the room
echo 2) Move to next room
echo 3) Rest (-1 room, +3 HP)
echo 4) Leave dungeon
echo.
set /p c=Choose: 

if "%c%"=="1" goto search
if "%c%"=="2" goto nextRoom
if "%c%"=="3" goto rest
if "%c%"=="4" goto quit

goto roomLoop

:search
set /a event=%random% %%3

if %event%==0 goto findGold
if %event%==1 goto findPotion
goto enemy

:findGold
set /a g=%random% %%10 + 3
set /a gold+=g
echo.
echo You found a chest with %g% gold!
pause
goto roomLoop

:findPotion
set /a heal=%random% %%8 + 3
set /a hp+=heal
echo.
echo You found a potion and healed +%heal% HP!
pause
goto roomLoop

:enemy
set /a enemyhp=%random% %%15 + 10
cls
echo A monster appears!
echo Enemy HP: %enemyhp%
pause

:combat
cls
echo ==== COMBAT ====
echo Your HP: %hp%
echo Enemy HP: %enemyhp%
echo.
echo 1) Attack
echo 2) Heavy Attack
echo 3) Try to run
echo.
set /p c=Choose: 

if "%c%"=="1" goto atk
if "%c%"=="2" goto hatk
if "%c%"=="3" goto run

goto combat

:atk
set /a dmg=%random% %%7 + 3
set /a enemyhp-=dmg
echo You hit for %dmg%!
goto enemyTurn

:hatk
set /a miss=%random% %%3
if %miss%==0 (
    echo Heavy attack missed!
    pause
    goto enemyTurn
)
set /a dmg=%random% %%12 + 5
set /a enemyhp-=dmg
echo Heavy hit for %dmg%!
goto enemyTurn

:run
set /a esc=%random% %%3
if %esc%==0 (
    echo You failed to escape!
    pause
    goto enemyTurn
)
echo You escaped back to the room!
pause
goto roomLoop

:enemyTurn
if %enemyhp% LEQ 0 goto enemyDead

set /a edmg=%random% %%8 + 2
set /a hp-=edmg
echo Enemy hits you for %edmg%!
pause

if %hp% LEQ 0 goto dead
goto combat

:enemyDead
set /a loot=%random% %%15 + 5
set /a gold+=loot
echo.
echo You defeated the monster!
echo You loot %loot% gold.
pause
goto roomLoop

:nextRoom
set /a room+=1
if %room% GTR 10 goto win
goto roomLoop

:rest
if %room% LEQ 1 (
    echo You can't rest here.
    pause
    goto roomLoop
)
set /a room-=1
set /a hp+=3
echo You rest and gain +3 HP, but go back one room.
pause
goto roomLoop

:win
cls
echo ============================
echo        DUNGEON CLEARED!
echo ============================
echo You reached the final room.
echo Total gold: %gold%
echo HP left: %hp%
echo.
pause
goto quit

:dead
cls
echo ============================
echo          YOU DIED
echo ============================
echo The dungeon claimed your life.
echo Gold collected: %gold%
echo.
pause
goto quit

:quit
cls
echo Thanks for playing CMD Dungeon!
echo.
pause
exit