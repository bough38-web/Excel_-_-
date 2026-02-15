#!/usr/bin/env bash
set -euo pipefail
APPLE_ID="${APPLE_ID:-}"
TEAM_ID="${TEAM_ID:-}"
APP_PASSWORD="${APP_PASSWORD:-}"
APP="dist/ExcelMatcherUniversal.app"
[[ -n "$APPLE_ID" && -n "$TEAM_ID" && -n "$APP_PASSWORD" ]] || { echo "Set APPLE_ID/TEAM_ID/APP_PASSWORD"; exit 1; }
[[ -d "$APP" ]] || { echo "Build first"; exit 1; }
ZIP="ExcelMatcherUniversal_notary.zip"
rm -f "$ZIP"
ditto -c -k --sequesterRsrc --keepParent "$APP" "$ZIP"
xcrun notarytool submit "$ZIP" --apple-id "$APPLE_ID" --team-id "$TEAM_ID" --password "$APP_PASSWORD" --wait
xcrun stapler staple "$APP"
echo "Notarized OK"
