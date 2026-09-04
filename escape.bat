@echo off
title Escape the Facility
color 0f

cls
echo You wake up in a locked facility.
echo A siren is blaring.
echo.
echo 1) Check the door
echo 2) Check the vent
set /p c=Choose: 

if "%c%"=="1" goto door
if "%c%"=="2" goto vent

:door
cls
echo The door is locked.
echo A guard approaches.
echo.
echo 1) Hide
echo 2) Fight
set /p c=

if "%c%"=="1" goto hide
if "%c%"=="2" goto fight

:hide
cls
echo You hide behind crates.
echo The guard passes.
echo You escape through the hallway.
pause
goto end

:fight
cls
echo You try to fight the guard...
echo He knocks you out instantly.
echo YOU LOSE.
pause
exit

:vent
cls
echo You crawl through the vent.
echo You drop into a control room.
echo.
echo 1) Shut down power
echo 2) Open all doors
set /p c=

if "%c%"=="1" goto power
if "%c%"=="2" goto open

:power
cls
echo Power shut down.
echo You escape in the darkness.
pause
goto end

:open
cls
echo All doors open.
echo You sprint outside.
pause
goto end

:end
cls
echo YOU ESCAPED THE FACILITY!
pause
exit