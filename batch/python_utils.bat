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
REM     %2 - out - is_exe_in_path              - type: bool("true"/"false")
REM ================================================================================================
:is_exe_in_path_env_var
    setlocal
    set cmd_to_run="where %1"
    set cmd_out=

    call :run_cmd_and_get_output %cmd_to_run% cmd_out     

    if "%cmd_out%"=="" (
        endlocal & set %2="false"
    ) else (
        endlocal & set %2="true"
    )
goto :eof

REM ================================================================================================
REM Variables:
REM     %1 - in  - %"python command"%       - Ex: main.py
REM ================================================================================================
:run_cmd_in_python_or_python3
    setlocal
        set python_exists=
        call :is_exe_in_path_env_var "python" python_exists

        if %python_exists%=="true" (
            python %1
        ) else (
            echo noooooooooooooooooooooooooooooooooooooooooooo
        )
    endlocal
goto :eof

REM ##########################################################################################################
REM  Main
REM ##########################################################################################################
:main

REM REM check python
REM set exe_to_check=python
REM set exe_exists=
REM call :is_exe_in_path_env_var %exe_to_check% exe_exists
REM echo "%exe_to_check%" exists in Path env var: %exe_exists%

REM REM check python3
REM set exe_to_check2=python3
REM set exe_exists2=
REM call :is_exe_in_path_env_var %exe_to_check2% exe_exists2
REM echo "%exe_to_check2%" exists in Path env var: %exe_exists2%


call :run_cmd_in_python_or_python3 "--version"