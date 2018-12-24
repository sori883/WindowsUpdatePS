@echo off

rem WindowsUpdateを実行します.
rem リモートしない場合は、クライアントで直接実行してください.

cd /d %~dp0
powershell -Command "Set-ExecutionPolicy RemoteSigned"
powershell -Command ".\Install-AW.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"
pause