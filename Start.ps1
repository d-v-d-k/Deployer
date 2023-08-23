# Deployer | Version 2023/08/23 | By DVDK.

# Check if PowerShell Script is run as president, if not try to run elevated:
if(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
{ Start-Process -FilePath powershell.exe -ArgumentList $PSCommandPath -Verb RunAs; return; }

Start-Transcript -Path ($PSScriptRoot+"\Logs\" + $env:COMPUTERNAME + "_" + (Get-Date -Format "yyyy-MM-dd_hh-mm-ss") + ".log") | Out-Null

function Run-General([string]$name)
{
    & ($PSScriptRoot + "\General\" + $name + ".ps1")
}

function Run-Specific([string]$name)
{
    & ($deployments[$index].FullName + "\Specific\" + $name + ".ps1") # Custom script
}


$deployments = @()
Write-Host "Index`tDeployment" -BackgroundColor Black
foreach($deployment in Get-ChildItem -Path $PSScriptRoot"\Deployments" -Directory)
{
    Write-Host ("" + $deployments.Count + "`t") -ForegroundColor Cyan -NoNewline
    Write-Host $deployment.BaseName -ForegroundColor White
    $deployments += $deployment
}

Write-Host "`nSelect the index of the deployment: " -ForegroundColor Cyan -NoNewline; [int]$index = Read-Host
Write-Host ('Loading deployment "' + $deployments[$index].BaseName + '"...') -ForegroundColor Green
& ($deployments[$index].FullName + "\Run.ps1") # Run deployment's main script


Write-Host ('Finished deploying "' + $deployments[$index].BaseName + '"!') -ForegroundColor Green
Read-Host "Press [Enter] to close"
Stop-Transcript