#!/usr/bin/env bash
set -euo pipefail
PYTHON_BIN="${PYTHON_BIN:-python3}"
$PYTHON_BIN -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
pyinstaller -y app.spec --clean
echo "Artifact: dist/ExcelMatcherUniversal.app"
