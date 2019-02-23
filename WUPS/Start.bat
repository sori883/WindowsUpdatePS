@echo off

SET Root=%~dp0

cd /d %Root%
powershell -Command "Get-ChildItem %Root% -Recurse | Unblock-File"
powershell -Command "Set-ExecutionPolicy RemoteSigned"
powershell -Command ".\Install-WindowsUpdate.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"