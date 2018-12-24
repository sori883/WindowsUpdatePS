function Disable-AutoLogon(){
    <#
    .SYNOPSIS
    WindowsUpdate終了後に自動ログインを無効にします.
    .DESCRIPTION

    #>

    Set-ItemProperty -path $RegLogonKey -name "AutoAdminLogon" -value 0
}