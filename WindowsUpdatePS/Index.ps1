# スクリプトのルートパス
Set-Variable -Name IndexRoot -Value (Split-Path $MyInvocation.MyCommand.Path -Parent) -Option Constant

# 設定ファイル
. ("{0}\Config.ps1" -f $IndexRoot)

# 関数のパス
Set-Variable -Name functionsRoot -Value ("{0}\Functions" -f $IndexRoot) -Option Constant
Get-ChildItem -Path $functionsRoot | ForEach-Object { . ("{0}\{1}" -f $functionsRoot, $_)}