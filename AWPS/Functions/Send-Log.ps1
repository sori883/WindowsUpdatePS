function Send-Log($target){
    <#
    .SYNOPSIS
    ファイル名をコンピュータ名に変更し、ホスト端末にログを送ります
    .DESCRIPTION

    #>

    $hostname = hostname

    Rename-Item ("{0}\{1}.log" -f $HistoryPath, $target) -NewName ("{0}.log" -f $hostname)

    Copy-Item ("{0}\{1}.log" -f $HistoryPath, $hostname) $HostHistoryPath
}
