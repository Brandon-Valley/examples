@echo off

REM ##########################################################################################################
REM  Functions
REM ##########################################################################################################
goto :main

REM ================================================================================================
REM Variables:
REM     %1 - in  - %"python command"%       - Ex: main.py
REM ================================================================================================
:run_and_keep_window_open_with_press_key_to_close_window

    echo "hi there"
    sfgsdgfdfg

goto :eof

REM ##########################################################################################################
REM  Main
REM ##########################################################################################################
:main

call :run_and_keep_window_open_with_press_key_to_close_window

@REM if %errorlevel% EQU 0 (pause) Else ( Echo ERROR FAILED &color CF && pause)
@REM if %errorlevel% EQU 0 (pause) Else (echo &color CF && pause)
if %errorlevel% EQU 0 (pause) Else (color CF && pause)
@REM pause