Set-Variable -Name IndexRoot -Value (Split-Path $MyInvocation.MyCommand.Path -Parent) -Option Constant

. ("{0}\Config.ps1" -f $IndexRoot)

Set-Variable -Name FunctionsRoot -Value ("{0}\Functions" -f $IndexRoot) -Option Constant
Get-ChildItem -Path $FunctionsRoot | ForEach-Object { . ("{0}\{1}" -f $FunctionsRoot, $_)}