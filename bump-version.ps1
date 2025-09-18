#get parameters (--major, --minor, --patch)
param(
    [switch]$major,
    [switch]$minor,
    [switch]$patch
)


#read info .json
$info = Get-Content ".\k2_so_fertilizer_on_gleba\info.json" -Raw | ConvertFrom-Json
$version =  $info.version
#split version into array
$versionParts = $version -split '\.'
$majorVersion = [int]$versionParts[0]
$minorVersion = [int]$versionParts[1]
$patchVersion = [int]$versionParts[2]
#increment version based on parameters
if ($major) {
    $majorVersion++
    $minorVersion = 0
    $patchVersion = 0
} elseif ($minor) {
    $minorVersion++
    $patchVersion = 0
} elseif ($patch) {
    $patchVersion++
} else {
    $patchVersion++
    exit 1
}
#combine version parts back into string
$newVersion = "$majorVersion.$minorVersion.$patchVersion"
#update info .json
$info.version = $newVersion
$info | ConvertTo-Json -Depth 10 | Set-Content ".\k2_so_fertilizer_on_gleba\info.json"
Write-Host "Version updated to $newVersion in info.json"

