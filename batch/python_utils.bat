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
        REM check python
        set python_exists=
        call :is_exe_in_path_env_var "python" python_exists

        if %python_exists%=="true" (
            python %1
            goto :eof
        )

        REM check python3
        set python3_exists=
        call :is_exe_in_path_env_var "python3" python3_exists

        if %python3_exists%=="true" (
            python3 %1
            goto :eof
        )
        
        REM error msg if neither found
        echo. ERROR: 
        echo     python and python3 are both unrecognized commands.
        echo     Make sure the path to the parent directory of your python.exe or python3.exe
        echo         This value may resemble:  C:\Users\mt204e\AppData\Local\Programs\Python\Python37-32
    endlocal
goto :eof

REM ##########################################################################################################
REM  Main
REM ##########################################################################################################
:main

call :run_cmd_in_python_or_python3 "--version"