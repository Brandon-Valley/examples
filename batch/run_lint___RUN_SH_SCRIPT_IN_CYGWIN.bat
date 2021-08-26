@echo off
setlocal enabledelayedexpansion
REM Keep cmd window open until script finishes in case of error
REM if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit 0 )
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )
REM if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & pause )
REM if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & pause ; exit 0)

set SCRIPT_PARENT_DIR=%~dp0
set sh_script_file_path=%SCRIPT_PARENT_DIR%run_lint.sh

echo "Running %sh_script_file_path% in Cygwin..."


REM C:\tools\s\cygwin64\bin\bash.exe -c 'echo hello'
REM C:\tools\s\cygwin64\bin\bash.exe -c 'cygpath -u "%sh_script_file_path%"'
REM C:\tools\s\cygwin64\bin\bash --login -c 'echo hello'
@echo on
C:\tools\s\cygwin64\bin\bash --login -c '$(cygpath -u "%sh_script_file_path%")'
REM C:\tools\s\cygwin64\bin\mintty.exe /bin/sh -lc 'echo hi!'
REM C:\tools\s\cygwin64\bin\mintty.exe /bin/sh -lc 'cygpath -u "%sh_script_file_path%"'

REM pause