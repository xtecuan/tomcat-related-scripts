@echo on
taskmgr
taskmgr
tomcat7w //ES/instance1
set commandSh="C:\Program Files (x86)\Git\bin\sh.exe"
%commandSh% --login -i %HOMEDRIVE%%HOMEPATH%\Desktop\tail-instance1.sh
pause