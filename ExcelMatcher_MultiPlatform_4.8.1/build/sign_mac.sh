#!/usr/bin/env bash
set -euo pipefail
IDENTITY="${IDENTITY:-}"
APP="dist/ExcelMatcherUniversal.app"
[[ -n "$IDENTITY" ]] || { echo "Set IDENTITY env var"; exit 1; }
[[ -d "$APP" ]] || { echo "Build first"; exit 1; }
codesign --force --deep --options runtime --entitlements build/mac_entitlements.plist -s "$IDENTITY" "$APP"
codesign -dv --verbose=4 "$APP" || true
echo "Signed OK"
