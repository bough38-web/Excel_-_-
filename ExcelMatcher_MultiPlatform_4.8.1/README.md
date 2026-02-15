# Excel 매칭 도구 (Universal) v4.7.1-win — Windows 배포 올인원(+자동 릴리즈)

포함:
- PyInstaller onedir 빌드(app.spec)
- Windows 릴리즈 ZIP 생성 스크립트
- Windows 코드서명 템플릿(signtool)
- GitHub Actions: 태그 푸시 시 자동 빌드 + GitHub Release 업로드
- CI 스모크 테스트(파일 모드) + 샘플 데이터

## 개발 실행
```powershell
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
python main.py
```

## 배포 빌드(로컬)
```powershell
.\build\build_win.ps1
.\build\release_pack_win.ps1 -Version "4.7.1-win"
```

## 자동 릴리즈(GitHub)
태그를 만들고 푸시하면 Actions가 릴리즈 ZIP을 생성해 업로드합니다.
