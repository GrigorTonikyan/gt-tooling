# Import all PowerShell script files from the ./completions subdirectory
$completionScripts = Get-ChildItem -Path "$PSScriptRoot/completions" -Filter *.ps1
foreach ($script in $completionScripts) {
  . $script.FullName

  Write-Output "Imported completion script: $script"
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

$pathsToAdd = @{
  'poetry' = 'C:\Users\grigor.tonikyan\AppData\Roaming\Python\Scripts'
  # Add more paths with their associated command names here
}

foreach ($command in $pathsToAdd.Keys) {
  if (-not (Get-Command $command -ErrorAction Ignore)) {
    $env:Path += ";$($pathsToAdd[$command])"
    Write-Output "Added $($pathsToAdd[$command]) to Path for $command"
  }
}

# alias / command "Get-EnvPath", which will list actual paths in the PATH variable and their associated command names if possible and from where they were comming from, this should be visually pleasing and helpful as well
function Get-EnvPath {
  Write-Host "`n📂 Environment PATH Analysis`n" -ForegroundColor Cyan

  $paths = $env:Path -split ';' | Where-Object { $_ -ne '' }
  foreach ($path in $paths) {
    # Check if path exists
    $exists = Test-Path $path
    $color = if ($exists) { 'Green' } else { 'Red' }

    # Get commands from this path
    $commands = if ($exists) {
      Get-ChildItem -Path $path -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -in '.exe', '.bat', '.cmd', '.ps1' } |
        Select-Object -First 3
    }

    # Display path with status indicator
    $indicator = if ($exists) { '✓' } else { '✗' }
    Write-Host "$indicator $path" -ForegroundColor $color

    # Display found commands if any
    if ($commands) {
      Write-Host "   └─ Contains:" -ForegroundColor DarkGray
      foreach ($cmd in $commands) {
        Write-Host "      • $($cmd.Name)" -ForegroundColor DarkGray
      }
    }
  }

  Write-Host "`nTotal Paths: $($paths.Count)" -ForegroundColor Cyan
}
