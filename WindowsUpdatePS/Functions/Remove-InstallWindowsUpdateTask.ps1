function Remove-InstallWindowsUpdateTask(){
    <#
    .SYNOPSIS
    Windows Updateを適用するタスクをタスクスケジューラーから削除します.
    .DESCRIPTION
    
    #>

    if((Get-WmiObject Win32_OperatingSystem).version -eq "6.1.7601"){
        # Windows7ではnregister-ScheduledTaskが使えない
        schtasks /delete /tn $TaskName

    }else{
        Get-ScheduledTask | Where-Object { $_.TaskName -match $TaskName } | Unregister-ScheduledTask -Confirm:$false
    }
}