Write-Host "Press [Enter] to restart, [S] to skip: " -ForegroundColor Yellow -NoNewline; $restart = Read-Host

if($restart -ne "S")
{
    Write-Host "This computer will restart now!" -ForegroundColor Green
    Restart-Computer -Force 
}