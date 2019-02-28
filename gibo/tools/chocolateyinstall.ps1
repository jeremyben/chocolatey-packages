
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = Join-Path $toolsDir "gibo.bat"
    url           = 'https://raw.githubusercontent.com/simonwhitaker/gibo/master/gibo.bat'
    checksum      = 'b5b7776239add5d40c689b977464379012be16e2de2f0f66f824a2f4660e24c4'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

Install-BinFile -Name $env:ChocolateyPackageName -Path $packageArgs.fileFullPath
