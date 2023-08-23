Write-Host "Connecting to Wi-Fi..." -NoNewLine -ForegroundColor Yellow

netsh wlan add profile filename=$PSScriptRoot"\Files\ExampleWiFi.xml" | Out-Null

netsh wlan connect name=ExampleWiFi | Out-Null

Write-Host "`rConnected to Wi-Fi." -NoNewLine -ForegroundColor Green

Write-Host "`rPress [Enter] when you finished the confirmation page." -NoNewLine -ForegroundColor Yellow; Read-Host
Write-Host "`r" -ForegroundColor Green
