function Update-Stats($target, $stats){
    <#
    .SYNOPSIS
    
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    $XML.root.stats.$target = $stats
    $xml.Save($SettingsPath)

}