@echo off

rem クライアント端末にあるStrat.batを管理者権限で実行します.
rem ホスト端末で実行してください.

rem クライアント端末のコンピュータ名（or Ipアドレス）
set ClientName=\\ClientName
rem ログインユーザのID
set LogonUser=LoginUser
rem ログインユーザのパスワード
set LogonPass=LogonPass
rem クライアントからみた実行するファイルのパス
set StartPath=C:\AWPS\

cd /d %~dp0\PSTools

PsExec.exe -u %LogonUser% -p %LogonPass% %ClientName% -s -d %StartPath%Start.bat
