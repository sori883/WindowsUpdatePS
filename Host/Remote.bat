@echo off

rem �N���C�A���g�[���ɂ���Strat.bat���Ǘ��Ҍ����Ŏ��s���܂�.
rem �z�X�g�[���Ŏ��s���Ă�������.

rem �N���C�A���g�[���̃R���s���[�^���ior Ip�A�h���X�j
set ClientName=\\ClientName
rem ���O�C�����[�U��ID
set LogonUser=LoginUser
rem ���O�C�����[�U�̃p�X���[�h
set LogonPass=LogonPass
rem �N���C�A���g����݂����s����t�@�C���̃p�X
set StartPath=C:\AWPS\

cd /d %~dp0\PSTools

PsExec.exe -u %LogonUser% -p %LogonPass% %ClientName% -s -d %StartPath%Start.bat
