Import-Module au

$domain = 'https://github.com'
$releases = "$domain/jesseduffield/lazygit/releases"

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {
    $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url32, $url64 = $downloadPage.links | ? href -match 'Windows.*zip' | Select-Object -First 2 -ExpandProperty href

    $version = (Split-Path $url32 -Leaf) -split '_' | Select-Object -First 1 -Skip 1

    @{
        Version = $version
        URL32   = "$domain$url32"
        URL64   = "$domain$url64"
    }
}

update -ChecksumFor none
