


REM =============================================================================

In addition, substitution of FOR variable references has been enhanced.
You can now use the following optional syntax:

%~I         - expands %I removing any surrounding quotes (")
%~fI        - expands %I to a fully qualified path name
%~dI        - expands %I to a drive letter only
%~pI        - expands %I to a path only
%~nI        - expands %I to a file name only
%~xI        - expands %I to a file extension only
%~sI        - expanded path contains short names only
%~aI        - expands %I to file attributes of file
%~tI        - expands %I to date/time of file
%~zI        - expands %I to size of file
%~$PATH:I   - searches the directories listed in the PATH
              environment variable and expands %I to the
              fully qualified name of the first one found.
              If the environment variable name is not
              defined or the file is not found by the
              search, then this modifier expands to the
              empty string

The modifiers can be combined to get compound results:

%~dpI       - expands %I to a drive letter and path only
%~nxI       - expands %I to a file name and extension only
%~fsI       - expands %I to a full path name with short names only
%~dp$PATH:I - searches the directories listed in the PATH
              environment variable for %I and expands to the
              drive letter and path of the first one found.
%~ftzaI     - expands %I to a DIR like output line

In the above examples %I and PATH can be replaced by other valid
values.  The %~ syntax is terminated by a valid FOR variable name.
Picking upper case variable names like %I makes it more readable and
avoids confusion with the modifiers, which are not case sensitive.

for %%i in ("..")            do set ghp='%%~ni'
echo %ghp%

REM =============================================================================

REM Get parents 1 and 2 from path

set "_path=C:\SecondParent\FirstParent\testfile.ini"
for %%a in ("%_path%") do set "p_dir=%%~dpa"
echo %p_dir%
for %%a in (%p_dir:~0,-1%) do set "p2_dir=%%~dpa"
echo %p2_dir%

REM =============================================================================

set filepath="C:\some path\having spaces.txt"

for /F "delims=" %%i in (%filepath%) do set dirname="%%~dpi" 
for /F "delims=" %%i in (%filepath%) do set filename="%%~nxi"
for /F "delims=" %%i in (%filepath%) do set basename="%%~ni"

echo %dirname%
echo %filename%
echo %basename%

