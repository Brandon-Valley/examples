@REM https://stackoverflow.com/questions/20575257/how-do-i-run-a-powershell-script-when-the-computer-starts

@REM This script will run the wifi_fix.ps1 script with elevated permissions (Will show admin permissions prompt box)
PowerShell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"

set SCRIPT_PARENT_DIR=%~dp0
PowerShell -Command "Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -File ""%SCRIPT_PARENT_DIR%wifi_fix.ps1""' -Verb RunAs"
