Write-Host "Connecting to Wi-Fi..." -NoNewLine -ForegroundColor Yellow

netsh wlan add profile filename=$PSScriptRoot"\Files\ExampleWiFi.xml" | Out-Null

netsh wlan connect name=ExampleWiFi | Out-Null

Write-Host "`rConnected to Wi-Fi." -NoNewLine -ForegroundColor Green

# in plaats van wachten, test elke 3s de connectie (Test-NetConnection/get-netadapter (wanneer laatste - is up ook up als hij wacht op confirm?)
Write-Host "`rPress [Enter] when you finished the confirmation page." -NoNewLine -ForegroundColor Yellow; Read-Host
Write-Host "`r" -ForegroundColor Green