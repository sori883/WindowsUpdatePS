@echo off



set ClientName=\\ClientName
set LogonUser=LoginUser
set LogonPass=LogonPass
set StartPath=C:\AWPS\

cd /d %~dp0\PSTools
PsExec.exe -u %LogonUser% -p %LogonPass% %ClientName% -s -d %StartPath%Start.bat
