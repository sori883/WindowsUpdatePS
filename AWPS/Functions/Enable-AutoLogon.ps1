function Enable-AutoLogon(){
    <#
    .SYNOPSIS
    自動ログインを有効化します
    .DESCRIPTION

    #>

    Set-ItemProperty -path $RegLogonKey -name "AutoAdminLogon" -value 1
    Set-ItemProperty -path $RegLogonKey -name "DefaultUsername" -value $LogonUser
    Set-ItemProperty -path $RegLogonKey -name "DefaultPassword" -value $LogonPass
    if ($LogonDomain -ne "") {
        Set-ItemProperty -path $RegLogonKey -name "DefaultDomainName" -value $LogonDomain
    }
}