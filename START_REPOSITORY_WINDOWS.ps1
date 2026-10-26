$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host 'Git was not found. Install Git for Windows, then reopen PowerShell.' -ForegroundColor Red
  Read-Host 'Press Enter to exit'; exit 1
}
if (-not (Test-Path '.git')) { git init; if ($LASTEXITCODE -ne 0) { throw 'git init failed' } }
git add .
if ($LASTEXITCODE -ne 0) { throw 'git add failed' }
git commit -m 'Add HTML CSS assignment starter pages'
if ($LASTEXITCODE -ne 0) {
  Write-Host 'Commit failed. If Git identity is missing, configure it first:' -ForegroundColor Yellow
  Write-Host 'git config --global user.name "Rashi Saraswat"'
  Write-Host 'git config --global user.email "YOUR_EMAIL_ADDRESS"'
  Read-Host 'Press Enter to exit'; exit 1
}
Write-Host 'Initial local commit created. Nothing has been pushed to GitHub yet.' -ForegroundColor Green
Read-Host 'Press Enter to exit'
