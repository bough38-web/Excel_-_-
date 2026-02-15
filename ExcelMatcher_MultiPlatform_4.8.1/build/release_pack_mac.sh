#!/usr/bin/env bash
set -euo pipefail
VERSION="4.7.0"
mkdir -p release
APP="dist/ExcelMatcherUniversal.app"
[[ -d "$APP" ]] || { echo "Build first."; exit 1; }
ZIP="release/ExcelMatcherUniversal_mac_${VERSION}.zip"
rm -f "$ZIP"
ditto -c -k --sequesterRsrc --keepParent "$APP" "$ZIP"
echo "Created: $ZIP"
