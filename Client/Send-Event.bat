@echo off

rem リモート実行用に接続先（WindowsUpdateをする端末）にイベントを作成します.
rem 接続先にはタスクスケジューラでStart.batをイベントで起動するように設定をお願いいたします.

rem 接続先端末のコンピュータ名（or Ipアドレス）
SET Hostname=\\Logonpc
rem ログインユーザ
SET LogonUser=logonuser
rem ログインユーザのパスワード
SET LogonPass=logonuserpass

eventcreate /s %Hostname% /u %LogonUser% /p %LogonPass%  /ID 999 /L system /SO AutoWindowsUpdate /T INFORMATION /D "Auto Windows Update"


