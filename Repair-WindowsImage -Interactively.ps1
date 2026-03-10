Write-Host 'Checking Windows Image health...' -ForegroundColor Cyan
$command = { $Script:health = Repair-WindowsImage -CheckHealth -Online }
& $command
while (-not $health.Online) {
    Write-Host 'Windows Image is offline. Please restore your Internet connection.' -ForegroundColor Yellow
    Start-Process 'ms-gethelp:'
    $choices = 'Retry', 'Skip'
    $choice = Read-Host (($choices | ForEach-Object { -join ('[', $_[0] + '] ', "$_") }) -join "`r`n")
    if ($choice -ilike "$('Skip'[0])*") { break }
    & $command
}
if ($health.ImageHealthState -eq 'Healthy') { Write-Host "Windows Image is healthy. No further action required." -ForegroundColor Green }
elseif ($health.Status -eq 'Repairable') {
    Write-Host "Scanning Windows Image for corruption..." -ForegroundColor Cyan
    Repair-WindowsImage -Online -ScanHealth
    Write-Host "Attempting to restore Windows Image health..." -ForegroundColor Cyan
    Repair-WindowsImage -Online -RestoreHealth
    Write-Host "Windows Image health check and repair completed." -ForegroundColor Green
}
else { Write-Host "Windows Image is not repairable. Manual intervention may be required." -ForegroundColor Red }