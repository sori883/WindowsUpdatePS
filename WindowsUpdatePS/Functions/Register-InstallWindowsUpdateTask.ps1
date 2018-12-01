function Register-InstallWindowsUpdateTask(){
    <#
    .SYNOPSIS
    Windows Updateを適用するタスクをタスクスケジューラーに登録します.
    .DESCRIPTION
    タスクはログイン時に実行されるように設定され、Start.batを管理者権限で実行します
    #>

    if((Get-WmiObject Win32_OperatingSystem).version -eq "6.1.7601"){
        # Windows7ではRegister-ScheduledTaskが使えない
        schtasks.exe /Create /tn $TaskName /tr $PowerShellExePath /sc onlogon /ru $TaskExecuteUser /rp $TaskExecutePass /rl highest
    }else{
        $trigger = New-ScheduledTaskTrigger -AtLogon
        $action = New-ScheduledTaskAction -Execute $PowerShellExePath
        Register-ScheduledTask -TaskName $TaskName -Trigger $trigger -Action $action -User $TaskExecuteUser -Password $TaskExecutePass -RunLevel Highest
    }
}