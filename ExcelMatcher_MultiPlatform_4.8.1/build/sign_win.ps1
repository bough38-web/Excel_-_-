param(
  [Parameter(Mandatory=$true)][string]$PfxPath,
  [Parameter(Mandatory=$true)][string]$PfxPassword,
  [string]$ExePath = "dist\ExcelMatcherUniversal\ExcelMatcherUniversal.exe",
  [string]$TimestampUrl = "http://timestamp.digicert.com"
)
$ErrorActionPreference = "Stop"
if (!(Test-Path $ExePath)) { throw "EXE not found: $ExePath" }
signtool sign /f $PfxPath /p $PfxPassword /tr $TimestampUrl /td sha256 /fd sha256 $ExePath
signtool verify /pa /v $ExePath
Write-Host "Signed OK: $ExePath"
