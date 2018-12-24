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

#-- リトライタスク設定 start --#

# タスク名
Set-Variable -Name TaskName -Value "AWRetry" -Option Constant
# PowerShellの実行パス
Set-Variable -Name PowerShellExePath -Value ("{0}\Start.bat" -f $ConfRoot) -Option Constant
# タスク実行ユーザー
Set-Variable -Name TaskExecuteUser -Value "username" -Option Constant
# タスク実行ユーザーパスワード
Set-Variable -Name TaskExecutePass -Value "userpass" -Option Constant

#-- リトライタスク設定 end --#

#-- 自動ログオン設定 start --#

#  レジストリパス
Set-Variable -Name RegLogonKey -Value "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Option Constant
# ログオンユーザー
Set-Variable -Name LogonUser -Value "username" -Option Constant
# ログオンユーザーパスワード
Set-Variable -Name LogonPass -Value "userpass" -Option Constant
# ログオンユーザーのドメイン
Set-Variable -Name LogonDomain -Value "somedomain" -Option Constant

#-- 自動ログオン設定 end --#

#-- リトライ設定 strat --#

# 設定のパス
Set-Variable -Name SettingsPath -Value ("{0}\Settings\Settings.xml" -f $ConfRoot) -Option Constant

# リトライの上限
Set-Variable -Name MaxRetryCount -Value 5 -Option Constant

#-- リトライ設定 end --#

#-- ログ設定 strat --#

# ログのパス
Set-Variable -Name HistoryPath -Value ("{0}\History" -f $ConfRoot) -Option Constant

# ホストのログパス
Set-Variable -Name HostHistoryPath -Value "\\host" -Option Constant

#-- ログ設定 end --#

#-- パッチインストール設定 start --#

# パッチのホストパス
Set-Variable -Name HostPatchPath -Value "\\host" -Option Constant

# パッチのクライアントパス
Set-Variable -Name ClientPatchPath -Value ("{0}\Patch" -f $ConfRoot) -Option Constant

# パッチのインストール先
Set-Variable -Name InstallPatchPath -Value "C:\Program Files (x86)\Adobe\Reader 10.0\Reader" -Option Constant

#-- パッチインストール設定 end --#