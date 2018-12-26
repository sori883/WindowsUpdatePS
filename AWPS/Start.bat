@echo off


cd /d %~dp0
powershell -Command "Set-ExecutionPolicy RemoteSigned"
powershell -Command ".\Install-AW.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"