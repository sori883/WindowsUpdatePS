@echo off

rem WindowsUpdate�����s���܂�.
rem ����bat���^�X�N�X�P�W���[���֓o�^�����肢�������܂�.
rem �����[�g���Ȃ��ꍇ�͊Ǘ��Ҍ����Ŏ��s�����WindowsUpdate���J�n���܂�.


rem �X�N���v�g�̃��[�g�p�X
SET Root=C:\WindowsUpdatePS

powershell -Command "Set-ExecutionPolicy RemoteSigned"
cd /d %Root%
powershell -Command ".\Install-WindowsUpdate.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"

pause