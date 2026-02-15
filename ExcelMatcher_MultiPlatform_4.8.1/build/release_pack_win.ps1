param([string]$Version = "4.7.0")
$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path release | Out-Null
if (!(Test-Path "dist\ExcelMatcherUniversal")) { throw "Build first." }
$zip = "release\ExcelMatcherUniversal_win_4.7.0.zip"
if (Test-Path $zip) { Remove-Item $zip -Force }
Compress-Archive -Path "dist\ExcelMatcherUniversal\*" -DestinationPath $zip
Write-Host "Created: $zip"
