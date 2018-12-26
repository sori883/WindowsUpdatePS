function Register-RetryTask(){
    <#
    .SYNOPSIS
    再試行タスクをタスクスケジューラに登録します
    .DESCRIPTION

    #>


    $trigger = New-ScheduledTaskTrigger -AtLogon
    $action = New-ScheduledTaskAction -Execute $PowerShellExePath
    Register-ScheduledTask -TaskName $TaskName -Trigger $trigger -Action $action -User $TaskExecuteUser -Password $TaskExecutePass -RunLevel Highest
}