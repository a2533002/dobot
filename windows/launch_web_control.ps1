$ErrorActionPreference = 'Stop'
$control = Join-Path $PSScriptRoot 'web_control.py'
if (-not (Test-Path -LiteralPath $control)) {
    Write-Host "web_control.py がこのフォルダにありません。" -ForegroundColor Red
    Write-Host "このスクリプトを web_control.py と同じフォルダに置いてください。"
    Read-Host "Enterで閉じる"
    exit 1
}
Set-Location -LiteralPath $PSScriptRoot
Write-Host "Dobot Web Control を起動します。表示された接続キーをページに入力してください。" -ForegroundColor Cyan
if (Get-Command py.exe -ErrorAction SilentlyContinue) {
    & py.exe -3 $control
} else {
    & python.exe $control
}
if ($LASTEXITCODE -ne 0) {
    Write-Host "web_control.py が異常終了しました。" -ForegroundColor Red
}
Read-Host "Enterで閉じる"
