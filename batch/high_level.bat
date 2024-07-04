@echo off
setlocal enabledelayedexpansion

REM Keep cmd window open until script finishes in case of error
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

REM Get path to parent of this script (with trailing /)
set SCRIPT_PARENT_DIR=%~dp0

REM Run example script using path relative to this script
PowerShell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
PowerShell -Command "Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -File ""%SCRIPT_PARENT_DIR%wifi_fix.ps1""' -Verb RunAs"
