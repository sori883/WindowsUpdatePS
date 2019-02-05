function Register-Task(){
    <#
    .SYNOPSIS
    タスクをタスクスケジューラに登録します
    .DESCRIPTION

    #>

    if((Get-WmiObject Win32_OperatingSystem).version -eq "6.1.7601"){
        schtasks.exe /Create /tn $TaskName /tr ("{0} {1}" -f $PowerShellExePath) /sc onstart /ru $TaskExecuteUser /rp $TaskExecutePass /rl highest
    }else{
        $trigger = New-ScheduledTaskTrigger -AtStartUp
        $action = New-ScheduledTaskAction -Execute $PowerShellExePath
        Register-ScheduledTask -TaskName $TaskName -Trigger $trigger -Action $action -User $TaskExecuteUser -Password $TaskExecutePass -RunLevel Highest
    }

}