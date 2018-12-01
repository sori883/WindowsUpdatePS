# スクリプトのルートパス
set-variable -name ConfRoot -value (Split-Path $MyInvocation.MyCommand.Path -Parent) -option constant

# ログのパス
Set-Variable -Name HistoryPath -Value ("{0}\History\History.txt" -f $ConfRoot) -Option Constant

#-- Windows Updateインストール設定 start --#

# PowerShellのモジュールが置かれているパス
Set-Variable -Name PSModulePath -Value "C:\Windows\System32\WindowsPowerShell\v1.0\Modules" -Option Constant
# ダウンロードしたWindowsUpdateのPSモジュール名
Set-Variable -Name PSWindowsUpdateModuleName -Value "PSWindowsUpdate" -Option Constant
# ダウンロードしたWindowsUpdateのPSモジュールがあるパス
Set-Variable -Name PSWindowsUpdateModulePath -Value ("{0}\Module\{1}" -f $ConfRoot, $psWindowsUpdateModuleName) -Option Constant

# タスク名
Set-Variable -Name TaskName -Value "InstallWindowsUpdate" -Option Constant
# PowerShellの実行パス
Set-Variable -Name PowerShellExePath -Value ("{0}\Start.bat" -f $ConfRoot) -Option Constant
# タスク実行ユーザー
Set-Variable -Name TaskExecuteUser -Value "Logonuser" -Option Constant
# タスク実行ユーザーパスワード
Set-Variable -Name TaskExecutePass -Value "UserPassword" -Option Constant

#-- Windows Updateインストール設定 end --#

#-- 自動ログオン設定 start --#

#  レジストリパス
Set-Variable -Name RegLogonKey -Value "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Option Constant
# ログオンユーザー
Set-Variable -Name LogonUser -Value "Logonuser" -Option Constant
# ログオンユーザーパスワード
Set-Variable -Name LogonPass -Value "UserPassword" -Option Constant
# ログオンユーザーのドメイン
Set-Variable -Name LogonDomain -Value "Somedomain" -Option Constant

#-- 自動ログオン設定 end --#