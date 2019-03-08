$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.7.2/lazygit_0.7.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.7.2/lazygit_0.7.2_Windows_x86_64.zip'
    checksum      = '07CB7233F8E6B67219C68E5585BD8AB765C6BD9CC63C0D0314CE3C136BB9BBC4'
    checksum64    = '7075A3F727FB7EEF0F303EE6D826FE1574385262DD0C31AAB12F3F489FD6479B'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
