@echo off

rem WindowsUpdateを実行します.
rem このbatをタスクスケジューラへ登録をお願いいたします.
rem リモートしない場合は管理者権限で実行するとWindowsUpdateが開始します.


rem スクリプトのルートパス
SET Root=C:\WindowsUpdatePS

powershell -Command "Set-ExecutionPolicy RemoteSigned"
cd /d %Root%
powershell -Command ".\Install-WindowsUpdate.ps1"
powershell -Command "Set-ExecutionPolicy Restricted"

pause