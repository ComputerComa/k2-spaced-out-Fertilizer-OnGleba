$CWD = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $CWD

# Copy all files from the mod folder to the Factorio mods folder, including subdirectories and overwriting existing files

$source = "$CWD\k2_so_fertilizer_on_gleba"
$destination = "$env:APPDATA\Factorio\mods\" 
Write-Host "Deleting existing files in $destination\k2_so_fertilizer_on_gleba"
Remove-Item -Path "$destination\k2_so_fertilizer_on_gleba" -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "Copying files from $source to $destination"
Copy-Item -Path "$source" -Destination $destination -Recurse -Force
Write-Host "Files copied successfully."
# Pause the script to see the output
Read-Host -Prompt "Press Enter to exit"