@echo off

rem WindowsUpdate�����s���܂�.
rem �����[�g���Ȃ��ꍇ�́A�N���C�A���g�Œ��ڎ��s���Ă�������.

cd /d %~dp0
powershell -Command "Set-ExecutionPolicy RemoteSigned"
powershell -Command ".\Install-AW.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"
pause