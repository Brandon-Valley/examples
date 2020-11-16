@echo off

REM ##########################################################################################################
REM  Functions
REM ##########################################################################################################
goto :main

REM ================================================================================================
REM Variables:
REM     %1 - in  - "cmd_to_run"
REM     %2 - out - cmd_output
REM ================================================================================================
:run_cmd_and_get_output

    for /F "tokens=* USEBACKQ" %%F in (`%2`) do (
        set cmd_output=%%F
    )
    set %1=%cmd_output%

goto :eof

REM ##########################################################################################################
REM  Main
REM ##########################################################################################################
:main

set cmd_to_run="where python"
set cmd_out=

call :run_cmd_and_get_output cmd_out %cmd_to_run%
echo Output of cmd:  %cmd_out%
goto :eof