%~i         - expands %i removing any surrounding quotes (")
%~fi        - expands %i to a fully qualified path name
%~di        - expands %i to a drive letter only
%~pi        - expands %i to a path only
%~ni        - expands %i to a file name only
%~xi        - expands %i to a file extension only
%~si        - expanded path contains short names only
%~ai        - expands %i to file attributes of file
%~ti        - expands %i to date/time of file
%~zi        - expands %i to size of file


for %%i in ("..")            do set ghp='%%~ni'
echo %ghp%

