
$logFile = "Servisi.log"


$services = @("Spooler", "wuauserv")

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

foreach ($serviceName in $services) {
try {

$status = (Get-Service -Name $serviceName).Status


$line = "[$timestamp] Serviss $serviceName ir $status."


Add-Content -Path $logFile -Value $line
}
catch {

Add-Content -Path $logFile -Value "[$timestamp] Serviss $serviceName netika atrasts."
}
}