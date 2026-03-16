

$apps = winget list --source msstore | Select-Object -Skip 3 | Where-Object { $_.Trim() -ne "" }

$skaits = ($apps | Measure-Object).Count


if($null -eq $skaits) { $skaits = 0 }

Write-Host "Sistema ir instelets $skaits aplikacijas no Microsoft Store"