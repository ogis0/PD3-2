$terminsh = (Get-Date).AddDays(-3)
$path = "$HOME\Documents\Warnings.txt"

$bridinajumi = Get-WinEvent -LogName Application | Where-Object {$_.LevelDisplayName -eq  "Warning" -and $_.TimeCreated -ge $terminsh }

$topAvoti = $bridinajumi | Group-Obejct -Property ProviderName | Sort-Object Count -Descending | Select-Object -First 3 

$topAvoti | ForEach-Object { "$($_.Name): $($_.Count)" } | Out-File -FilePath $path 

Write-Host "Analīze pabeigta. Rezultati: $path"

 