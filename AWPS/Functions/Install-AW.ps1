function Install-AW(){
    <#
    Windows UpdateとAdobe Readerのアップデートを行います
    .DESCRIPTION

    #>
    

    Start-Transcript ("{0}\Command.log" -f $HistoryPath) -append

    if(-not (Test-RetryTask)){
        Register-RetryTask
    }
    Enable-AutoLogon


    $tryPt = Get-Try "PT"
    $compPt =  Get-Stats "PT"
    if(($tryPt -le $MaxRetryCount) -and ($compPt -eq "still")){

        Update-Try "PT"

        if(Test-Path ("{0}\Acrobat.msp" -f $HostPatchPath)){

            Copy-Item ("{0}\Acrobat.msp" -f $HostPatchPath) $ClientPatchPath

            $beforeVer = (Get-Command ("{0}\AcroRd32.exe" -f $InstallPatchPath)).FileVersionInfo.FileVersion

            msiexec.exe /i ("{0}\Acrobat.msp" -f $ClientPatchPath) /quiet /norestart

            $afterVer = (Get-Command ("{0}\AcroRd32.exe" -f $InstallPatchPath)).FileVersionInfo.FileVersion
            $afterVer | Out-File ("{0}\PT-History.log" -f $HistoryPath) -Append

            if(Test-Path ("{0}\Acrobat.msp" -f $ClientPatchPath)){

                Remove-Item ("{0}\Acrobat.msp" -f $ClientPatchPath)

                if($beforeVer -ne $afterVer){
                    Update-Stats "PT" "comp"
                }
                
            }else{
                "There is no file in the specified directory."
            }
        }else{
            "There is no file in the specified directory."
        }


    }

    $tryWu = Get-Try "WU"
    $compWu =  Get-Stats "WU"
    if(($tryWu -le $MaxRetryCount) -and ($compWu -eq "still")){

        Update-Try "WU"

        if(-not (Test-Path ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName))){
            New-Item ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) -ItemType Directory
            robocopy $PSWindowsUpdateModulePath ("{0}\{1}" -f $PSModulePath, $PSWindowsUpdateModuleName) /MIR
        }


        $WUpatch = Get-WUList

        if($WUpatch){
            Get-WUInstall -AcceptAll -IgnoreReboot
            shutdown -r -t 0 -f
        } else {
            Update-Stats "WU" "comp"
            Get-WUHistory | Out-File ("{0}\WU-History.log" -f $HistoryPath) -Append
        }
    
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
        Reset-Stats
        Reset-Try
        Remove-RetryTask
        Disable-AutoLogon
    }
    Stop-Transcript
}