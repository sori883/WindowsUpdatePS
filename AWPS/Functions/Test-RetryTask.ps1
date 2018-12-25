function Test-RetryTask(){
    <#
    .SYNOPSIS

    .DESCRIPTION

    #>

    $task = $null

    $task = Get-ScheduledTask | Where-Object { $_.TaskName -match $TaskName }
  

    if($task){
        return $true
    }else{
        return $false
    }
}