function Test-InstallWindowsUpdateTask(){
    <#
    .SYNOPSIS
    Windows Updateを適用するタスクが登録されているか確認します.
    .DESCRIPTION
    確認するタスクはInstall-WindowsUpdateによって登録されます.
    #>

    $task = $null

    $task = Get-ScheduledTask | Where-Object { $_.TaskName -match $TaskName }
  

    if($task){
        return $true
    }else{
        return $false
    }
}