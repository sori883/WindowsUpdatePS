function Get-Stats($target){
    <#
    .SYNOPSIS
    設定ファイルから進捗を取得します
    .DESCRIPTION

    #>

    $xml = [xml](Get-Content $SettingsPath -Encoding UTF8)
    
    $stats =  [string]$xml.root.stats.$target

    return $stats

}

$result = (Get-Stats)[-1] | Out-Null