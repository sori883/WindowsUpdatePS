@echo off

rem �����[�g���s�p�ɐڑ���iWindowsUpdate������[���j�ɃC�x���g���쐬���܂�.
rem �ڑ���ɂ̓^�X�N�X�P�W���[����Start.bat���C�x���g�ŋN������悤�ɐݒ�����肢�������܂�.

rem �ڑ���[���̃R���s���[�^���ior Ip�A�h���X�j
SET Hostname=\\Hostname
rem ���O�C�����[�U
SET LogonUser=LoginUser
rem ���O�C�����[�U�̃p�X���[�h
SET LogonPass=LoginUser
rem �ڑ��悩��݂����s����t�@�C���̃p�X
SET ScriptPath=C:\WindowsUpdatePS\

cd /d %~dp0\PSTools

PsExec.exe -u %LogonUser% -p %LogonPass% %Hostname% -s -d %ScriptPath%Start.bat
