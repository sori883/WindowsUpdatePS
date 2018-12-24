function Reset-Stats(){
    <#
    .SYNOPSIS
    
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    $xml.root.comp.WU = "still"
    $xml.root.comp.PT = "still"
    $xml.Save($SettingsPath)

}