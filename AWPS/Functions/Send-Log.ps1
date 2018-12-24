function Send-Log($target){
    <#
    .SYNOPSIS
    
    .DESCRIPTION

    #>

    $hostname = hostname

    Rename-Item ("{0}\{1}.txt" -f $HistoryPath, $target) -NewName ("{0}.txt" -f $hostname)

    Copy-Item ("{0}\{1}.txt" -f $HistoryPath, $hostname) $HostHistoryPath
}
