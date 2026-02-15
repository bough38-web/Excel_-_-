param([string]$PythonExe = "python")
$ErrorActionPreference = "Stop"
& $PythonExe -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install --upgrade pip
pip install -r requirements.txt
pyinstaller -y app.spec --clean
Write-Host "Artifact: dist\ExcelMatcherUniversal\"
