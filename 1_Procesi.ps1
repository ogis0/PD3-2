$procesi = Get-process | Where-object { $_.WorkingSet -gt 150MB -and $_.ProcessName -ne "msedge" }


$path = "$HOME\Documents\LielieProcesi.csv"
$procesi | Select-Object Name, Id, WorkingSet | Export-Csv -Path $path -NoTypeInformation -Encoding UTF8

Write-Host "Dati Saglabati: $path"