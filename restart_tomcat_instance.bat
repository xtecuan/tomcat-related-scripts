@echo off
set tomcat_scripts=C:\Users\julianr\Desktop\tomcat-related-scripts
set git_bash_path="D:\Program_Files\Git\bin"
set PATH=%PATH%;%git_bash_path%

set instanceName=%1




sh -i %tomcat_scripts%\catpid.sh %instanceName% > %tomcat_scripts%\%instanceName%.txt

set /P cpid=< %tomcat_scripts%\%instanceName%.txt

tasklist /FI "PID eq %cpid%"

echo Killing %cpid%


rem runas /user:idb\jr-idb "taskkill /F /PID %cpid%"

rem taskkill /F /PID %cpid%

pause