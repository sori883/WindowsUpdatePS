function Install-WindowsUpdate(){
    <#
    .SYNOPSIS
    適用できる更新プログラムが無くなるまでWindows Updateを適用します.
    .DESCRIPTION

    #>
    Start-Transcript $LogPath -append

    if(-not (Test-Path ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName))){
        New-Item ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) -ItemType Directory
        robocopy $PSWindowsUpdateModulePath ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) /MIR
    }

    if(-not (Test-InstallWindowsUpdateTask)){
        Register-InstallWindowsUpdateTask
    }

    # Windows Updateをダウンロード
    $microsoftPatch = Get-WUList -MicrosoftUpdate
    $windowsPatch = Get-WUList -WindowsUpdate
    $windowsServerPatch = Get-WUList

    if ($windowsServerPatch -or $microsoftPatch -or $windowsPatch) {
        #自動ログイン設定
        Enable-AutoLogon
        # Windows Updateをインストール
        if($microsoftPatch){
            Get-WUInstall -AcceptAll -IgnoreReboot -MicrosoftUpdate
        }
        if($windowsPatch){
            Get-WUInstall -AcceptAll -IgnoreReboot -WindowsUpdate
        }        
        if($windowsServerPatch){
            Get-WUInstall -AcceptAll -IgnoreReboot
        }
        shutdown -r -t 0 -f
    } else {
        Remove-InstallWindowsUpdateTask
        Stop-Transcript
        Disable-AutoLogon
    }
}