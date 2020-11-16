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

REM ================================================================================================
REM Variables:
REM     %1 - in  - exe_name       - Ex: python
REM     %2 - out - is_exe_in_path              - type: bool
REM ================================================================================================
:is_exe_in_path_env_var
    set cmd_to_run="where %1"
    set cmd_out=

    call :run_cmd_and_get_output %cmd_to_run% cmd_out 

    echo %cmd_out%

goto :eof

REM ##########################################################################################################
REM  Main
REM ##########################################################################################################
:main

REM set cmd_to_run="where python"
REM set cmd_out=

REM call :run_cmd_and_get_output %cmd_to_run% cmd_out 
REM echo Output of cmd:  %cmd_out%


set exe_to_check=python
set exe_exists=

call :is_exe_in_path_env_var %exe_to_check% exe_exists

echo %python% exists in Path env var: %exe_exists%

