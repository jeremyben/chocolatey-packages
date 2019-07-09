$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.8.1/lazygit_0.8.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.8.1/lazygit_0.8.1_Windows_x86_64.zip'
    checksum      = 'A378162587F925FF8CBEA3166C67E17A3334EB233C9E5F0D166EF87D84C72691'
    checksum64    = '16BCD395D3FF5ACB4ADA9185FE309E04265FDC57B64B3B1BA795076CE8A472AE'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
