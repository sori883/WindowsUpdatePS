function Update-Try($target){
    <#
    .SYNOPSIS
    試行回数を更新します
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)

    $TryCnt =  [int]$XML.root.try.$target

    $TryCnt += 1

    $XML.root.try.$target = [string]$TryCnt

    $xml.Save($SettingsPath)

}