@echo off
rem Runs test.ps1 without changing the PowerShell execution policy.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0test.ps1" %*
pause
