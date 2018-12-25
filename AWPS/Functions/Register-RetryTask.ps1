function Register-RetryTask(){
    <#
    .SYNOPSIS

    .DESCRIPTION

    #>


    $trigger = New-ScheduledTaskTrigger -AtLogon
    $action = New-ScheduledTaskAction -Execute $PowerShellExePath
    Register-ScheduledTask -TaskName $TaskName -Trigger $trigger -Action $action -User $TaskExecuteUser -Password $TaskExecutePass -RunLevel Highest
}