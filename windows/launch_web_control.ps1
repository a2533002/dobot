$ErrorActionPreference = 'Stop'
$control = Join-Path $PSScriptRoot 'web_control.py'

if (-not (Test-Path -LiteralPath $control)) {
    Write-Host 'web_control.py is missing in this folder.' -ForegroundColor Red
    Write-Host 'Put this launcher in the same folder as web_control.py.'
    Read-Host 'Press Enter to close'
    exit 1
}

Set-Location -LiteralPath $PSScriptRoot
Write-Host 'Starting Dobot Web Control. Copy the key displayed below.' -ForegroundColor Cyan

if (Get-Command py.exe -ErrorAction SilentlyContinue) {
    & py.exe -3 $control
} else {
    & python.exe $control
}

if ($LASTEXITCODE -ne 0) {
    Write-Host 'web_control.py exited with an error.' -ForegroundColor Red
}
Read-Host 'Press Enter to close'
