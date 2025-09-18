#get parameters (--major, --minor, --patch)
param(
    [switch]$major,
    [switch]$minor,
    [switch]$patch
)


#read info .json
$info = Get-Content ".\k2_so_fertilizer_on_gleba\info.json" -Raw | ConvertFrom-Json
write-Host "Read info.json"
$version =  $info.version
Write-Host "Current version: $version"
#split version into array
$versionParts = $version -split '\.'
$majorVersion = [int]$versionParts[0]
$minorVersion = [int]$versionParts[1]
$patchVersion = [int]$versionParts[2]
#increment version based on parameters
if ($major) {
    write-Host "Bumping major version"
    write-Host "Resetting minor and patch versions to 0"
    $majorVersion++
    $minorVersion = 0
    $patchVersion = 0
} elseif ($minor) {
    write-Host "Bumping minor version"
    write-Host "Resetting patch version to 0"
    $minorVersion++
    $patchVersion = 0
} elseif ($patch) {
    write-Host "Bumping patch version"
    $patchVersion++
} else {
    write-Host "Defaulting to patch version bump."
    $patchVersion++
}
#combine version parts back into string
$newVersion = "$majorVersion.$minorVersion.$patchVersion"
#update info .json
$info.version = $newVersion
write-Host "New version: $newVersion"
#save info .json
$info | ConvertTo-Json -Depth 10 | Set-Content ".\k2_so_fertilizer_on_gleba\info.json"
Write-Host "Version updated to $newVersion in info.json"

