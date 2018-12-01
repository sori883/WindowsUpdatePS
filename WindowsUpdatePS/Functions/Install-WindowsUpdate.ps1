function Install-WindowsUpdate(){
    <#
    .SYNOPSIS
    適用できる更新プログラムが無くなるまでWindows Updateを適用します.
    .DESCRIPTION

    #>

    # PSWindowsUpdateをPowerShellモジュールの格納先へコピー
    if(-not (Test-Path ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName))){
        New-Item ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) -ItemType Directory
        robocopy $PSWindowsUpdateModulePath ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) /MIR
    }

    # タスク登録
    if(-not (Test-InstallWindowsUpdateTask)){
        Register-InstallWindowsUpdateTask
    }

    #ログ開始
    Start-Transcript $HistoryPath -append

    # Windows Updateをダウンロード
    $microsoftPatch = Get-WUList -MicrosoftUpdate
    $windowsPatch = Get-WUList -WindowsUpdate
    $windowsServerPatch = Get-WUList

    if ($windowsServerPatch -or $microsoftPatch -or $windowsPatch) {
        # 自動ログイン有効化
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
        # ログ終了
        Stop-Transcript
        # タスク削除
        Remove-InstallWindowsUpdateTask
        #自動ログイン無効化
        Disable-AutoLogon
    }
}