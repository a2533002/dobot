$ErrorActionPreference = 'Stop'
$launcher = Join-Path $PSScriptRoot 'launch_web_control.ps1'
$control = Join-Path $PSScriptRoot 'web_control.py'
if (-not (Test-Path -LiteralPath $launcher) -or -not (Test-Path -LiteralPath $control)) {
    throw "launch_web_control.ps1 と web_control.py をこのフォルダに置いてから実行してください。"
}
$root = 'HKCU:\Software\Classes\dobot'
New-Item -Path $root -Force | Out-Null
Set-Item -Path $root -Value 'URL:Dobot Web Control'
New-ItemProperty -Path $root -Name 'URL Protocol' -Value '' -PropertyType String -Force | Out-Null
$commandKey = Join-Path $root 'shell\open\command'
New-Item -Path $commandKey -Force | Out-Null
$powerShell = Join-Path $PSHOME 'powershell.exe'
$command = '"' + $powerShell + '" -NoProfile -ExecutionPolicy Bypass -File "' + $launcher + '"'
Set-Item -Path $commandKey -Value $command
Write-Host "接続キー発行リンクを登録しました。このPCのユーザー内だけに適用されます。" -ForegroundColor Green
Read-Host "Enterで閉じる"
