function Disable-AutoLogon(){
    <#
    .SYNOPSIS
    自動ログインを無効にします.
    .DESCRIPTION

    #>

    Set-ItemProperty -path $regLogonKey -name "AutoAdminLogon" -value 0
}