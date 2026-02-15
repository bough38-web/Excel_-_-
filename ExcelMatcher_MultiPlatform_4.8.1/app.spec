# -*- mode: python ; coding: utf-8 -*-
import os
from PyInstaller.utils.hooks import collect_submodules

block_cipher = None
project_root = os.path.abspath(os.path.dirname(__file__))

hiddenimports = collect_submodules('xlwings')

datas = []
for fn in ['presets.json', 'replacements.json']:
    p = os.path.join(project_root, fn)
    if os.path.exists(p):
        datas.append((p, '.'))

icon_win = os.path.join(project_root, 'assets', 'app.ico')
icon_mac = os.path.join(project_root, 'assets', 'app.icns')

a = Analysis(
    ['main.py'],
    pathex=[project_root],
    binaries=[],
    datas=datas,
    hiddenimports=hiddenimports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='ExcelMatcherUniversal',
    debug=False,
    strip=False,
    upx=False,
    console=False,
    icon=icon_win if os.path.exists(icon_win) else None,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=False,
    name='ExcelMatcherUniversal',
)

app = BUNDLE(
    coll,
    name='ExcelMatcherUniversal.app',
    icon=icon_mac if os.path.exists(icon_mac) else None,
    bundle_identifier='com.seeunappa.excelmatcheruniversal',
)
