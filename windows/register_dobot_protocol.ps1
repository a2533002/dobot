$ErrorActionPreference = 'Stop'
$launcher = Join-Path $PSScriptRoot 'launch_web_control.ps1'
$control = Join-Path $PSScriptRoot 'web_control.py'

if (-not (Test-Path -LiteralPath $launcher) -or -not (Test-Path -LiteralPath $control)) {
    throw 'Required files are missing. Put launch_web_control.ps1 and web_control.py in this folder.'
}

$root = 'HKCU:\Software\Classes\dobot'
New-Item -Path $root -Force | Out-Null
Set-Item -Path $root -Value 'URL:Dobot Web Control'
New-ItemProperty -Path $root -Name 'URL Protocol' -Value '' -PropertyType String -Force | Out-Null

$commandKey = Join-Path $root 'shell\open\command'
New-Item -Path $commandKey -Force | Out-Null
$powerShell = Join-Path $PSHOME 'powershell.exe'
$command = '"{0}" -NoProfile -ExecutionPolicy Bypass -File "{1}"' -f $powerShell, $launcher
Set-Item -Path $commandKey -Value $command

Write-Host 'Dobot protocol registered for the current Windows user.' -ForegroundColor Green
Read-Host 'Press Enter to close'
