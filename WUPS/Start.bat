@echo off


cd /d %~dp0
powershell -Command "Set-ExecutionPolicy RemoteSigned"
powershell -Command ".\Install-WindowsUpdate.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"