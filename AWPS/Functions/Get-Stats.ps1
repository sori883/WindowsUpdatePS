function Get-Stats($target){
    <#
    .SYNOPSIS
    
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    $stats =  [string]$xml.root.stats.$target

    return $stats

}

$result = (Get-Stats)[-1] | Out-Null