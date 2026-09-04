@echo off
title GunSpin Text Edition
color 0e

set money=0
set power=1

:menu
cls
echo ==== GUNSPIN ====
echo Money: $%money%
echo Power: %power%
echo.
echo 1) Spin weapon
echo 2) Upgrade power ($10)
echo 3) Exit
set /p c=Choose: 

if "%c%"=="1" goto spin
if "%c%"=="2" goto upgrade
if "%c%"=="3" exit

goto menu

:spin
set /a gain=%random% %%10 * %power%
set /a money+=gain
echo You spun the gun and earned $%gain%!
pause
goto menu

:upgrade
if %money% LSS 10 (
    echo Not enough money!
    pause
    goto menu
)
set /a money-=10
set /a power+=1
echo Power upgraded!
pause
goto menu