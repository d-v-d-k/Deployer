Write-Host "Change the computer name (leave empty to skip): " -ForegroundColor Cyan -NoNewline; $name = Read-Host

if($name)
{
    Write-Host "Press [Enter] to restart, [S] to skip: " -ForegroundColor Yellow -NoNewline; $restart = Read-Host

    if($restart -eq "S") { Rename-Computer -NewName $name -Force}
    else  { Rename-Computer -NewName $name -Force -Restart; exit }

    Write-Host ('This computer has been renamed to "' + $name + '".') -ForegroundColor Green
}
