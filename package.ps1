#Generates a zip package for distribution
$info = Get-Content ".\k2_so_fertilizer_on_gleba\info.json" -Raw | ConvertFrom-Json
$version =  $info.version
$packageName = "k2-so-fertilizer-on-gleba-$version.zip"
$sourceDir = ".\k2_so_fertilizer_on_gleba"
if (Test-Path ".\packages\$packageName") {
    Write-Host "Package $packageName already exists. Ok to overwrite? (Y/N)"
    $response = Read-Host
    if ($response -ne 'Y' -and $response -ne 'y') {
        Write-Host "Exiting without creating package."
        exit 1
    }
    else {
    Write-Host "Removing existing package: $packageName"

    Remove-Item ".\packages\$packageName"
    Read-Host -Prompt "Press Enter to continue"
    }
}
if (-Not (Test-Path ".\packages")) {
    New-Item -ItemType Directory -Path ".\packages"
}
Compress-Archive -Path "$sourceDir" -DestinationPath ".\packages\$packageName"
Write-Host "Package created: $packageName"
# Pause the script to see the output
Read-Host -Prompt "Press Enter to exit"