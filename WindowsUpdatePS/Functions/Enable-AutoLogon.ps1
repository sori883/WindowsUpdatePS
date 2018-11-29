function Enable-AutoLogon(){
    <#
    .SYNOPSIS
    マシン起動時に自動ログオンするように設定します.
    .DESCRIPTION

    #>

    Set-ItemProperty -path $regLogonKey -name "AutoAdminLogon" -value 1
    Set-ItemProperty -path $regLogonKey -name "DefaultUsername" -value $LogonUser
    Set-ItemProperty -path $regLogonKey -name "DefaultPassword" -value $LogonPass
    if ($LogonDomain -ne "") {
        Set-ItemProperty -path $regLogonKey -name "DefaultDomainName" -value $LogonDomain
    }
}