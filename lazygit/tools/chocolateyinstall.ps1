$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.6/lazygit_0.6_Windows_32-bit.zip'
  url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.6/lazygit_0.6_Windows_x86_64.zip'
  checksum      = 'c8578513adc9d57d1b77cde98923c5bcc4f8d4615a0d91fba9b1c0c5dce85c4f'
  checksum64    = '648283aa1933dcdd589552ca04d06419d7d888eeb0226000f73f4eaf73119763'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
