# スクリプトのルートパス
set-variable -name ConfRoot -value (Split-Path $MyInvocation.MyCommand.Path -Parent) -option constant

#-- WUモジュール設定 start --#

# PowerShellのモジュールが置かれているパス
Set-Variable -Name PSModulePath -Value "C:\Windows\System32\WindowsPowerShell\v1.0\Modules" -Option Constant
# ダウンロードしたWindowsUpdateのPSモジュール名
Set-Variable -Name PSWindowsUpdateModuleName -Value "PSWindowsUpdate" -Option Constant
# ダウンロードしたWindowsUpdateのPSモジュールがあるパス
Set-Variable -Name PSWindowsUpdateModulePath -Value ("{0}\Module\{1}" -f $ConfRoot, $psWindowsUpdateModuleName) -Option Constant

#-- WUモジュール設定 end --#

#-- タスク設定 start --#

# タスク名
Set-Variable -Name TaskName -Value "WindowsUpdatePS" -Option Constant
# PowerShellの実行パス
Set-Variable -Name PowerShellExePath -Value ("{0}\Start.bat" -f $ConfRoot) -Option Constant
# タスク実行ユーザー
Set-Variable -Name TaskExecuteUser -Value "const" -Option Constant
# タスク実行ユーザーパスワード
Set-Variable -Name TaskExecutePass -Value "antenakouzi12" -Option Constant

#-- リトライタスク設定 end --#

#-- 自動ログオン設定 start --#

#  レジストリパス
Set-Variable -Name RegLogonKey -Value "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Option Constant
# ログオンユーザー
Set-Variable -Name LogonUser -Value "const" -Option Constant
# ログオンユーザーパスワード
Set-Variable -Name LogonPass -Value "antenakouzi12" -Option Constant
# ログオンユーザーのドメイン
Set-Variable -Name LogonDomain -Value "" -Option Constant

#-- 自動ログオン設定 end --#

#-- ログ設定 strat --#

# ログのパス
Set-Variable -Name HistoryPath -Value ("{0}\History" -f $ConfRoot) -Option Constant

#-- ログ設定 end --#
