function Reset-Stats(){
    <#
    .SYNOPSIS
    設定ファイルの進捗状況を初期化します
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)

    $xml.root.comp.WU = "still"
    $xml.root.comp.PT = "still"
    
    $xml.Save($SettingsPath)

}