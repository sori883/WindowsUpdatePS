function Install-WindowsUpdate(){
    <#
    Windows Updateのアップデートを行います
    .DESCRIPTION

    #>
    

    Start-Transcript ("{0}\Command.log" -f $HistoryPath) -append

    if(-not (Test-Task)){
        Register-Task
    }

    Enable-AutoLogon

    if(-not (Test-Path ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName))){
        New-Item ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) -ItemType Directory
        robocopy $PSWindowsUpdateModulePath ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) /MIR
    }

    $WUpatch = Get-WUList

    if($WUpatch){
        Get-WUInstall -AcceptAll -IgnoreReboot
        # shutdown -r -t 0 -f
    } else {
        Remove-Task
        Disable-AutoLogon
        Get-WUHistory | Out-File ("{0}\WU-History.log" -f $HistoryPath) -Append
    }
}