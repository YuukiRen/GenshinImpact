@echo off
rem Set the title
title Lacia's GenshinImpact.bat script

rem Clear the screen of previous commands
cls

call :isAdmin

if %errorlevel% == 0 (
goto :run
) else (
echo Requesting administrative privileges...
goto :UACPrompt
)

exit /b

:isAdmin
fsutil dirty query %systemdrive% >nul
exit /b

:run
rem Tell users what this script will do.
echo This script will set the graphics quality to its lowest / the fastest preset and it will launch the game

rem Wait for user input
pause

rem Clear the screen of previous commands
cls

rem Let the user enter the location where the game is installed
echo Example: D:\Program Files\Genshin Impact\Genshin Impact Game
set /p gamelocation="Enter the location where the game is installed: "


rem Starting game with [-force-d3d11 -screen-width 800 -screen-height 600 -screen-quality lowest] This will run the game on its lowest graphical preset allong with running it in 800x600
echo Starting the game...
start "" "%gamelocation%"\GenshinImpact.exe -screen-width 800 -screen-height 600 -force-d3d11 -screen-quality lowest

rem Wait 30 seconds or untill a user presses a key
timeout /t 30

rem Set the CPU priority to high
wmic process where name="GenshinImpact.exe" CALL setpriority "128"

rem Wait for user input
pause
exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B`
