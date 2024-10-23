@echo off
title Copilot Enabler - by theoneandonlyjxd

cd "C:\Program Files (x86)\Microsoft\Edge\Application"
cls
if not exist "msedge.exe" (
    echo Microsoft Edge could not be found on your computer.
    echo Please install Microsoft Edge to do this.
    pause > NUL
    exit /b
)

echo  .d8888b.                    d8b 888          888    8888888888                   888      888                  
echo d88P  Y88b                   Y8P 888          888    888                          888      888                  
echo 888    888                       888          888    888                          888      888                  
echo 888         .d88b.  88888b.  888 888  .d88b.  888888 8888888    88888b.   8888b.  88888b.  888  .d88b.  888d888 
echo 888        d88""88b 888 "88b 888 888 d88""88b 888    888        888 "88b     "88b 888 "88b 888 d8P  Y8b 888P"   
echo 888    888 888  888 888  888 888 888 888  888 888    888        888  888 .d888888 888  888 888 88888888 888     
echo Y88b  d88P Y88..88P 888 d88P 888 888 Y88..88P Y88b.  888        888  888 888  888 888 d88P 888 Y8b.     888     
echo  "Y8888P"   "Y88P"  88888P"  888 888  "Y88P"   "Y888 8888888888 888  888 "Y888888 88888P"  888  "Y8888  888     
echo                     888                                                                                         
echo                     888                                                                                         
echo                     888                                                                                         
echo by theoneandonlyjxd - https://github.com/theoneandonlyjxd/CopilotEnabler
echo.

setlocal

echo Make sure you have set your Microsoft account region to United States (if you logged in with it with Windows),
echo and make sure you set your computer region to United States (required in all cases).
echo If you had uninstalled Microsoft Edge, you will not be able to do this.

set "regFile=%TEMP%\copilot%RANDOM%.reg"

(
    echo Windows Registry Editor Version 5.00
    echo.
    echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Copilot\BingChat]
    echo "IsUserEligible"=dword:00000001
    echo.
    echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
    echo "ShowCopilotButton"=dword:00000001
) > "%regFile%"

reg import "%regFile%"

del /f /q "%regFile%"

start msedge.exe "microsoft-edge://?ux=copilot&tcp=1&source=taskbar"
echo If Microsoft Edge started normally, something is wrong.
echo If Copilot started, everything is correct.
echo .
echo You must use this script everytime you start your computer, otherwise Copilot will automatically break every startup.
echo If you want to start Copilot without using this script (must've run it at least one time after you booted your computer),
echo do a shortcut with exactly: "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" microsoft-edge://?ux=copilot^&tcp=1^&source=taskbar
echo Or, do Win+R and put exactly: microsoft-edge://?ux=copilot^&tcp=1^&source=taskbar
echo.
echo Press enter to exit.

pause > NUL

exit