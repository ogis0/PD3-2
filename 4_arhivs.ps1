$source = "$HOME\Downloads"
$destination = "$HOME\Documents\PDF_Backup.zip"
$laiks = (Get-Date).AddHours(-48)


$faili = Get-ChildItem -Path $source -Filter *.pdf | Where-Object { $_.LastWriteTime -ge $laiks -or $_.CreationTime -ge $laiks }


if ($faili) {	
	Compress-Archive -Path $faili.FullName -DestinationPath $destination -Force 
	Write-Host "Dublejums gatavs: $destiantion" 
} else {
	Write-Host "Pedejo 48h laika nav jaunu vai mainitu PDF failu."
}