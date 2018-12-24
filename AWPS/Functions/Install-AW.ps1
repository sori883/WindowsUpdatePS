function Install-AW(){
    <#
    .SYNOPSIS
    適用できる更新プログラムが無くなるまでWindows Updateを適用します.
    .DESCRIPTION

    #>
    

    # ログ開始
    Start-Transcript ("{0}\Command.log" -f $HistoryPath) -append

    # タスク登録
    if(-not (Test-InstallWindowsUpdateTask)){
        "s@pld:a;skl"
        Register-InstallWindowsUpdateTask
    }
    Enable-AutoLogon


    $tryPt = Get-Try "PT"
    $compPt =  Get-Stats "PT"
    if(($tryPt -le $MaxRetryCount) -and ($compPt -eq "still")){

        Update-Try "PT"

        if(Test-Path ("{0}\Acrobat.msp" -f $HostPatchPath)){
            Copy-Item ("{0}\Acrobat.msp" -f $HostPatchPath) $ClientPatchPath
        }else{
            "There is no file in the specified directory."
        }

        $beforeVer = (Get-Command ("{0}\AcroRd32.exe" -f $InstallPatchPath)).FileVersionInfo.FileVersion

        msiexec.exe /i ("{0}\Acrobat.msp" -f $ClientPatchPath) /quiet /norestart
        
        $afterVer = (Get-Command ("{0}\AcroRd32.exe" -f $InstallPatchPath)).FileVersionInfo.FileVersion

        $afterVer | Out-File ("{0}\PT-History.txt" -f $HistoryPath) -Append

        if(Test-Path ("{0}\Acrobat.msp" -f $ClientPatchPath)){
            Remove-Item ("{0}\Acrobat.msp" -f $ClientPatchPath)
        }else{
            "There is no file in the specified directory."
        }
        
        if($beforeVer -ne $afterVer){
            Update-Stats "PT" "comp"
        }

    }

    $tryWu = Get-Try "WU"
    $compWu =  Get-Stats "WU"
    if(($tryWu -le $MaxRetryCount) -and ($compWu -eq "still")){
        # トライ回数
        Update-Try "WU"

        # PSWindowsUpdateをPowerShellモジュールの格納先へコピー
        if(-not (Test-Path ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName))){
            New-Item ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) -ItemType Directory
            robocopy $PSWindowsUpdateModulePath ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) /MIR
        }

        # Windows Updateをダウンロード
        $WUpatch = Get-WUList

        if($WUpatch){
            Get-WUInstall -AcceptAll -IgnoreReboot
            "shotdown"
            # shutdown -r -t 0 -f
        } else {
            Update-Stats "WU" "comp"
            Get-WUHistory | Out-File ("{0}\WU-History.txt" -f $HistoryPath) -Append
        }
    
    }

    if(($compPt -eq "comp") -and ($compWu -eq "comp")){
        Reset-Stats
        Reset-Try
    }
    
    if(($tryWu -ge $MaxRetryCount) -and (($tryPt -ge $MaxRetryCount))){
        if($compPt -eq "still"){
            Send-Log "PT-History"
        }
        if($compPt -eq "still"){
            Send-Log "WU-History"
        }
    }
    
    if((($compPt -eq "comp") -and ($compWu -eq "comp")) -or (($tryPt -ge $MaxRetryCount) -and ($tryWu -ge $MaxRetryCount))){
        Remove-InstallWindowsUpdateTask
    }
    Stop-Transcript
}