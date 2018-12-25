function Remove-RetryTask(){
    <#
    .SYNOPSIS
    .DESCRIPTION
    
    #>


    Get-ScheduledTask | Where-Object { $_.TaskName -match $TaskName } | Unregister-ScheduledTask -Confirm:$false
}