@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0register_dobot_protocol.ps1"
if errorlevel 1 (
  echo 登録に失敗しました。3つの起動ファイルを web_control.py と同じフォルダへ置いたか確認してください。
  pause
)
