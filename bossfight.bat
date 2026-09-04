@echo off
title AMAAR'S BOSS FIGHT
color 0c

:: ============================
:: PLAYER & BOSS STATS
:: ============================
set playerhp=40
set boss=60
set potions=3
set special=1

cls
echo ======================================
echo        AMAAR VS THE TERMINATOR
echo ======================================
echo The metal giant awakens...
echo Its red eyes lock onto you.
echo.
pause

:loop
cls
echo ======================================
echo            BOSS FIGHT
echo ======================================
echo Your HP: %playerhp%
echo Boss HP: %boss%
echo Potions: %potions%
echo Special Attack: %special%
echo.
echo Choose your action:
echo 1) Quick Attack
echo 2) Heavy Attack
echo 3) Drink Potion
echo 4) SPECIAL ATTACK (Massive Damage)
echo 5) Dodge
echo.
set /p c=Your move: 

if "%c%"=="1" goto quick
if "%c%"=="2" goto heavy
if "%c%"=="3" goto potion
if "%c%"=="4" goto special
if "%c%"=="5" goto dodge

goto loop

:quick
set /a dmg=%random% %%8 + 3
set /a boss-=dmg
echo You slash the boss for %dmg% damage!
goto bossTurn

:heavy
set /a miss=%random% %%3
if %miss%==0 (
    echo Your heavy attack MISSED!
    goto bossTurn
)
set /a dmg=%random% %%15 + 5
set /a boss-=dmg
echo Heavy attack hits for %dmg%!
goto bossTurn

:potion
if %potions% LEQ 0 (
    echo No potions left!
    pause
    goto loop
)
set /a potions-=1
set /a playerhp+=15
echo You drink a potion and heal +15 HP!
goto bossTurn

:special
if %special% LEQ 0 (
    echo You already used your special attack!
    pause
    goto loop
)
set /a special-=1
set /a dmg=%random% %%25 + 20
set /a boss-=dmg
echo *** SPECIAL ATTACK ***
echo You unleash a devastating strike for %dmg% damage!
goto bossTurn

:dodge
set /a chance=%random% %%2
if %chance%==0 (
    echo You dodged the boss's attack!
    pause
    goto loop
)
echo You tried to dodge but failed!
goto bossTurn

:bossTurn
if %boss% LEQ 0 goto win

echo.
echo The Terminator prepares an attack...
set /a pattern=%random% %%4

if %pattern%==0 goto bossHeavy
if %pattern%==1 goto bossLaser
if %pattern%==2 goto bossPunch
goto bossMiss

:bossHeavy
set /a dmg=%random% %%12 + 6
set /a playerhp-=dmg
echo TERMINATOR smashes you for %dmg% damage!
pause
goto checkPlayer

:bossLaser
set /a dmg=%random% %%20 + 10
set /a playerhp-=dmg
echo TERMINATOR fires a LASER BEAM for %dmg% damage!
pause
goto checkPlayer

:bossPunch
set /a dmg=%random% %%10 + 3
set /a playerhp-=dmg
echo TERMINATOR punches you for %dmg% damage!
pause
goto checkPlayer

:bossMiss
echo TERMINATOR missed!
pause
goto loop

:checkPlayer
if %playerhp% LEQ 0 goto lose
goto loop

:win
cls
color 0a
echo ======================================
echo             YOU WIN!
echo ======================================
echo The Terminator collapses...
echo Sparks fly as its core shuts down.
echo You stand victorious.
echo.
pause
exit

:lose
cls
color 04
echo ======================================
echo             YOU DIED
echo ======================================
echo The Terminator crushes you.
echo Your journey ends here.
echo.
pause
exit