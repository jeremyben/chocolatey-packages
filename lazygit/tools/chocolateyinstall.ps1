$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.8/lazygit_0.8_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.8/lazygit_0.8_Windows_x86_64.zip'
    checksum      = 'AB38AE7465C77B93E3DEACE9E07D1BC6C31AA62875C641F28734461C0202D41F'
    checksum64    = '5346A55378175191BE1AA4B6A1D7A91C15E01F3DB6704FE10CA267FB16B25F52'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
