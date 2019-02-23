@echo off


set LogonUser=LoginUser
set LogonPass=LogonPass
set StartPath=C:\WUPS\

cd /d %~dp0\PSTools
PsExec.exe -u %LogonUser% -p %LogonPass% @target.txt -s -d %StartPath%Start.bat

