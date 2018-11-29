function Test-InstallWindowsUpdateTask(){
    <#
    .SYNOPSIS
    Windows Updateを適用するタスクが登録されているか確認します.
    .DESCRIPTION
    確認するタスクはInstall-WindowsUpdateによって登録されます.
    #>

    $task = $null
    if((Get-WmiObject Win32_OperatingSystem).version -eq "6.1.7601"){
        # Windows7ではGet-ScheduledTaskが使えない
        $task = schtasks /query /fo csv | ConvertFrom-Csv | Where-Object {$_."taskname" -eq $TaskName}
    }else{
        $task = Get-ScheduledTask | Where-Object { $_.TaskName -match $TaskName }
    }  

    if($task){
        return $true
    }else{
        return $false
    }
}