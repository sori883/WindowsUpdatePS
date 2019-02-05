function Test-Task(){
    <#
    .SYNOPSIS
    タスクがタスクスケジューラに存在するか確認します
    .DESCRIPTION

    #>

    $task = $null
    if((Get-WmiObject Win32_OperatingSystem).version -eq "6.1.7601"){
        $task = schtasks /query /fo csv | ConvertFrom-Csv | Where-Object {$_."Taskname" -eq $TaskName}
    }else{
        $task = Get-ScheduledTask | Where-Object { $_.TaskName -match $TaskName }
    }

    if($task){
        return $true
    }else{
        return $false
    }
    
}