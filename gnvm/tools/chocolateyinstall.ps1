$ErrorActionPreference = 'Stop'

# http://ksria.com/gnvm/#installation
Write-Host 'Looking for Node.js install...' -ForegroundColor DarkGray

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$nodeDir = "$env:ProgramFiles\nodejs"

$installDir = if (Test-Path "$nodeDir\node.exe") {
  Write-Host 'Node.js install found' -ForegroundColor DarkGreen; $nodeDir
} else {
  Write-Host 'Node.js install not found' -ForegroundColor DarkYellow; $toolsDir
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = "$installDir\gnvm.exe" # Join-Path $installDir 'gnvm.exe'
  url           = 'https://github.com/Kenshin/gnvm-bin/blob/master/32-bit/gnvm.exe?raw=true'
  url64bit      = 'https://github.com/Kenshin/gnvm-bin/blob/master/64-bit/gnvm.exe?raw=true'
  checksum      = 'F18307A7FBA2D21F4705EF294A5CAC81B264638AEA7F438819CB801FC07E6FF1'
  checksum64    = '3B6D839DEDA72D985DB5030087D414AE039D4A940A34DE4AC5C905EF46AC9A26'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
