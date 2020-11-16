@echo off

REM ##########################################################################################################
REM  Functions
REM ##########################################################################################################
goto :main

REM ================================================================================================
REM Variables:
REM     %1 - in  - "cmd_to_run"
REM     %2 - out - %cmd_output%
REM ================================================================================================
:run_cmd_and_get_output

    for /F "tokens=* USEBACKQ" %%F in (`%1`) do (
        set cmd_output=%%F
    )
    set %2=%cmd_output%

goto :eof

REM ##########################################################################################################
REM  Main
REM ##########################################################################################################
:main

set cmd_to_run="where python3"
set cmd_out=

call :run_cmd_and_get_output %cmd_to_run% cmd_out 
echo Output of cmd:  "%cmd_out%"
