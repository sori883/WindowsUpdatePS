function Get-Try($target){
    <#
    .SYNOPSIS
    
    .DESCRIPTION

    #>
    
    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    $TryCnt =  [int]$xml.root.try.$target

    return $TryCnt
}

$result = (Get-Try)[-1] | Out-Null