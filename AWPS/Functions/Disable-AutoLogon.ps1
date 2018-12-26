function Disable-AutoLogon(){
    <#
    .SYNOPSIS
    自動ログイン設定を無効化します
    .DESCRIPTION

    #>

    Set-ItemProperty -path $RegLogonKey -name "AutoAdminLogon" -value 0
}