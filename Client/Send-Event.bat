@echo off

rem �����[�g���s�p�ɐڑ���iWindowsUpdate������[���j�ɃC�x���g���쐬���܂�.
rem �ڑ���ɂ̓^�X�N�X�P�W���[����Start.bat���C�x���g�ŋN������悤�ɐݒ�����肢�������܂�.

rem �ڑ���[���̃R���s���[�^���ior Ip�A�h���X�j
SET Hostname=\\Logonpc
rem ���O�C�����[�U
SET LogonUser=logonuser
rem ���O�C�����[�U�̃p�X���[�h
SET LogonPass=logonuserpass

eventcreate /s %Hostname% /u %LogonUser% /p %LogonPass%  /ID 999 /L system /SO AutoWindowsUpdate /T INFORMATION /D "Auto Windows Update"


