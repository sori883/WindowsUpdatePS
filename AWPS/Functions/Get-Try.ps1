function Get-Try($target){
    <#
    .SYNOPSIS
    設定ファイルから試行回数を取得します
    .DESCRIPTION

    #>
    
    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    
    $TryCnt =  [int]$xml.root.try.$target

    return $TryCnt
}

$result = (Get-Try)[-1] | Out-Null