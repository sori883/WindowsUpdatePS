function Reset-Try(){
    <#
    .SYNOPSIS
    設定ファイルの試行回数をリセットします
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)

    $xml.root.try.WU = "0"
    $xml.root.try.PT = "0"

    $xml.Save($SettingsPath)

}