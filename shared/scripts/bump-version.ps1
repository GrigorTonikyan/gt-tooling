param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('major', 'minor', 'patch')]
    [string]$VersionType,
    
    [Parameter(Mandatory=$false)]
    [string]$Submodule
)

function Update-Version {
    param(
        [string]$Version,
        [string]$Type
    )
    
    $parts = $Version.Split('.')
    switch ($Type) {
        'major' { 
            $parts[0] = [int]$parts[0] + 1
            $parts[1] = 0
            $parts[2] = 0
        }
        'minor' { 
            $parts[1] = [int]$parts[1] + 1
            $parts[2] = 0
        }
        'patch' { 
            $parts[2] = [int]$parts[2] + 1
        }
    }
    return $parts -join '.'
}

function Update-PowerShellModule {
    param([string]$ModulePath)
    
    $manifestPath = Get-ChildItem -Path $ModulePath -Filter "*.psd1" | Select-Object -First 1
    if ($manifestPath) {
        $manifest = Import-PowerShellDataFile $manifestPath.FullName
        $newVersion = Update-Version -Version $manifest.ModuleVersion -Type $VersionType
        
        $content = Get-Content $manifestPath.FullName -Raw
        $content = $content -replace "ModuleVersion = '.*'", "ModuleVersion = '$newVersion'"
        Set-Content -Path $manifestPath.FullName -Value $content
        
        Write-Host "Updated PowerShell module version to $newVersion"
    }
}

function Update-NodePackage {
    param([string]$PackagePath)
    
    $packageJsonPath = Join-Path $PackagePath "package.json"
    if (Test-Path $packageJsonPath) {
        $packageJson = Get-Content $packageJsonPath | ConvertFrom-Json
        $newVersion = Update-Version -Version $packageJson.version -Type $VersionType
        
        $packageJson.version = $newVersion
        $packageJson | ConvertTo-Json -Depth 100 | Set-Content $packageJsonPath
        
        Write-Host "Updated Node.js package version to $newVersion"
    }
}

# Main execution
if ($Submodule) {
    $submodulePath = Join-Path $PSScriptRoot "../../$Submodule"
    if (Test-Path $submodulePath) {
        if (Test-Path (Join-Path $submodulePath "*.psd1")) {
            Update-PowerShellModule -ModulePath $submodulePath
        }
        elseif (Test-Path (Join-Path $submodulePath "package.json")) {
            Update-NodePackage -PackagePath $submodulePath
        }
    }
    else {
        Write-Error "Submodule path not found: $submodulePath"
    }
}
else {
    # Update all submodules
    Get-ChildItem -Path (Join-Path $PSScriptRoot "../..") -Directory |
        Where-Object { $_.Name -ne "shared" } |
        ForEach-Object {
            Write-Host "Processing $($_.Name)..."
            if (Test-Path (Join-Path $_.FullName "*.psd1")) {
                Update-PowerShellModule -ModulePath $_.FullName
            }
            elseif (Test-Path (Join-Path $_.FullName "package.json")) {
                Update-NodePackage -PackagePath $_.FullName
            }
        }
}
