function History-WindowsUpdate(){
    <#
    .SYNOPSIS
    Windows Updateの適用状況を記録します.
    .DESCRIPTION

    #>

    $Log = Get-WUHistory
    $Log | Out-File $LogPath -Append
    
}