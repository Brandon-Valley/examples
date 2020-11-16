@echo off
setlocal enabledelayedexpansion

REM Keep cmd window open until script finishes in case of error
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )
