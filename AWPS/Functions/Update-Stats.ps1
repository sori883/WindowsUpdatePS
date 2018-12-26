function Update-Stats($target, $stats){
    <#
    .SYNOPSIS
    設定ファイルの進捗状況を更新します
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    $XML.root.stats.$target = $stats
    $xml.Save($SettingsPath)

}