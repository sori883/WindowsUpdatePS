@echo off

rem リモート実行用に接続先（WindowsUpdateをする端末）にイベントを作成します.
rem 接続先にはタスクスケジューラでStart.batをイベントで起動するように設定をお願いいたします.

rem 接続先端末のコンピュータ名（or Ipアドレス）
SET Hostname=\\Hostname
rem ログインユーザ
SET LogonUser=LoginUser
rem ログインユーザのパスワード
SET LogonPass=LoginUser
rem 接続先からみた実行するファイルのパス
SET ScriptPath=C:\WindowsUpdatePS\

cd /d %~dp0\PSTools

PsExec.exe -u %LogonUser% -p %LogonPass% %Hostname% -s -d %ScriptPath%Start.bat
