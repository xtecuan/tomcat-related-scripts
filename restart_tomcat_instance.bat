@echo off
set git_bash_path="D:\Program_Files\Git\bin"
set PATH=%PATH%;%git_bash_path%

set instanceName=%1

sh -i catpid.sh %instanceName% > %instanceName%.txt

set /P cpid=< %instanceName%.txt

echo Killing %cpid%

rem runas /profile /env /user:idb\julianr "taskkill /F /PID %cpid%"

taskkill /F /PID %cpid%