# Python Environment Setup Script
using namespace System.Management.Automation

param (
    [Parameter(HelpMessage = "Python version to install (e.g., '3.12')")]
    [string]$Version,
    
    [Parameter(HelpMessage = "Skip confirmation prompts")]
    [switch]$Force,
    
    [Parameter(HelpMessage = "Uninstall all Python versions")]
    [switch]$Uninstall,
    
    [Parameter(HelpMessage = "Show available Python versions")]
    [switch]$ListVersions,
    
    [Parameter(HelpMessage = "Run in interactive mode")]
    [switch]$Interactive,
    
    [Parameter(HelpMessage = "Show help information")]
    [switch]$Help
)

# Import configuration
$scriptPath = $PSScriptRoot
$configPath = Join-Path $scriptPath "config/python-setup.json"
$config = Get-Content $configPath | ConvertFrom-Json

# Initialize logging
$logFile = Join-Path $scriptPath "logs/python-setup-$(Get-Date -Format 'yyyyMMdd-HHmmss').log"
New-Item -ItemType Directory -Force -Path (Split-Path $logFile) | Out-Null

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet('Info', 'Warning', 'Error', 'Success')]
        [string]$Level = 'Info'
    )
    
    $colors = @{
        'Info'    = 'White'
        'Warning' = 'Yellow'
        'Error'   = 'Red'
        'Success' = 'Green'
    }
    
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $logMessage = "[$timestamp] [$Level] $Message"
    
    # Write to console with color
    Write-Host $logMessage -ForegroundColor $colors[$Level]
    
    # Write to log file
    Add-Content -Path $logFile -Value $logMessage
}

function Show-Help {
    Write-Host @"
Python Environment Setup Script

Usage:
    ensure-python.ps1 [-Version <version>] [-Force] [-Uninstall] [-ListVersions] [-Interactive] [-Help]

Options:
    -Version      Python version to install (e.g., '3.12')
    -Force        Skip confirmation prompts
    -Uninstall    Uninstall all Python versions
    -ListVersions Show available Python versions
    -Interactive  Run in interactive mode
    -Help         Show this help message

Examples:
    # Install Python 3.12
    ensure-python.ps1 -Version 3.12

    # Uninstall all Python versions
    ensure-python.ps1 -Uninstall

    # Run in interactive mode
    ensure-python.ps1 -Interactive
"@
    exit 0
}

function Show-Menu {
    Write-Host "`nPython Environment Management`n" -ForegroundColor Cyan
    Write-Host "1. Install Python"
    Write-Host "2. Uninstall Python"
    Write-Host "3. List Available Versions"
    Write-Host "4. Show System Information"
    Write-Host "5. Exit`n"
    
    $choice = Read-Host "Enter your choice (1-5)"
    return $choice
}

function Get-AvailableVersions {
    $versions = $config.pythonPackages.PSObject.Properties | 
        Select-Object -Property @{
            Name = 'Version'
            Expression = { $_.Name }
        }, @{
            Name = 'PackageId'
            Expression = { $_.Value }
        }
    
    Write-Log "Available Python versions:" -Level Info
    $versions | ForEach-Object {
        Write-Log "- $($_.Version) (Package ID: $($_.PackageId))" -Level Info
    }
    
    return $versions
}

function Confirm-Action {
    param(
        [string]$Message,
        [string]$Title,
        [bool]$Dangerous = $false
    )
    
    if ($Force) {
        return $true
    }
    
    $style = if ($Dangerous) { 'Critical' } else { 'Warning' }
    $choices = '&Yes', '&No'
    
    $decision = $Host.UI.PromptForChoice($Title, $Message, $choices, 1)
    return $decision -eq 0
}

function Test-AdminPrivileges {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]$identity
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Test-PowerShellVersion {
    $currentVersion = $PSVersionTable.PSVersion
    $minVersion = [Version]$config.minPowerShellVersion
    
    if ($currentVersion -lt $minVersion) {
        Write-Log "PowerShell version $currentVersion is below minimum required version $minVersion" -Level Warning
        if (Confirm-Action -Message "Would you like to update PowerShell?" -Title "PowerShell Update Required") {
            Start-Process "https://github.com/PowerShell/PowerShell/releases/latest" -Wait
            throw "Please install the latest PowerShell version and run this script again."
        }
        throw "PowerShell version $minVersion or higher is required."
    }
}

function Get-SystemInfo {
    Write-Log "System Information:" -Level Info
    Write-Log "User: $env:USERNAME" -Level Info
    Write-Log "Machine Name: $env:COMPUTERNAME" -Level Info
    Write-Log "Operating System: $(Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty Caption)" -Level Info
    Write-Log "OS Version: $(Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty Version)" -Level Info
    Write-Log "PowerShell Version: $($PSVersionTable.PSVersion)" -Level Info
    
    # Check Python installations
    $pythonVersions = Get-Command python.exe -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            $version = & $_.Source --version 2>&1
            Write-Log "Found Python: $version at $($_.Source)" -Level Info
        } catch {
            Write-Log "Failed to get version for Python at $($_.Source)" -Level Warning
        }
    }
    
    # Check pip installations
    $pipVersions = Get-Command pip.exe -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            $version = & $_.Source --version 2>&1
            Write-Log "Found pip: $version at $($_.Source)" -Level Info
        } catch {
            Write-Log "Failed to get version for pip at $($_.Source)" -Level Warning
        }
    }
}

function Test-Dependencies {
    # Check PowerShell version
    $currentVersion = $PSVersionTable.PSVersion
    $minVersion = [Version]$config.minPowerShellVersion
    
    if ($currentVersion -lt $minVersion) {
        Write-Log "PowerShell version $currentVersion is below minimum required version $minVersion" -Level Error
        Write-Log "Please update PowerShell from: https://github.com/PowerShell/PowerShell/releases/latest" -Level Info
        return $false
    }
    
    # Check required modules
    foreach ($module in $config.requiredModules) {
        $installedModule = Get-Module -ListAvailable | Where-Object { $_.Name -eq $module.name }
        if (-not $installedModule) {
            Write-Log "Required module $($module.name) is not installed" -Level Error
            return $false
        }
        
        $minVersion = [Version]$module.minVersion
        $moduleVersion = [Version]$installedModule.Version
        if ($moduleVersion -lt $minVersion) {
            Write-Log "Module $($module.name) version $moduleVersion is below minimum required version $minVersion" -Level Error
            return $false
        }
    }
    
    return $true
}

function Ensure-Winget {
    Write-Log "Checking for Winget installation..." -Level Info
    
    if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
        Write-Log "Winget is not installed." -Level Warning
        
        if (Confirm-Action -Message "Would you like to install Winget?" -Title "Winget Installation") {
            Write-Log "Installing Winget..." -Level Info
            
            $wingetUrl = $config.paths.wingetDownloadUrl
            $wingetPath = [System.Environment]::ExpandEnvironmentVariables($config.paths.wingetTemp)
            
            try {
                Invoke-WebRequest -Uri $wingetUrl -OutFile $wingetPath -UseBasicParsing
                Add-AppxPackage -Path $wingetPath
                Write-Log "Winget successfully installed." -Level Success
            }
            catch {
                Write-Log "Failed to install Winget: $_" -Level Error
                throw "Winget installation failed."
            }
            finally {
                Remove-Item -Path $wingetPath -ErrorAction SilentlyContinue
            }
        }
        else {
            throw "Winget is required to proceed."
        }
    }
    else {
        Write-Log "Winget is already installed." -Level Success
    }
}

function Uninstall-Python {
    Write-Log "Checking existing Python installations..." -Level Info
    
    $pythonPackages = winget list --name "Python" | 
    Select-String -Pattern "Python" | 
    ForEach-Object { $_.Line -replace '\s{2,}', ',' | ConvertFrom-Csv -Header "Name", "Id", "Version", "Source" }
    
    if ($pythonPackages.Count -eq 0) {
        Write-Log "No Python installations found." -Level Info
        return
    }
    
    Write-Log "Found the following Python installations:" -Level Info
    $pythonPackages | ForEach-Object {
        Write-Log "- $($_.Name) version $($_.Version)" -Level Info
    }
    
    if (Confirm-Action -Message "Do you want to uninstall all existing Python installations?" -Title "Python Uninstallation" -Dangerous $true) {
        foreach ($package in $pythonPackages) {
            Write-Log "Uninstalling $($package.Name) version $($package.Version)..." -Level Info
            $uninstallResult = winget uninstall --id $package.Id --silent --accept-package-agreements --accept-source-agreements
            
            if ($LASTEXITCODE -ne 0) {
                Write-Log "Failed to uninstall $($package.Name)." -Level Error
            }
            else {
                Write-Log "$($package.Name) successfully uninstalled." -Level Success
            }
        }
    }
}

function Install-Python {
    param (
        [string]$Version = $config.defaultPythonVersion
    )
    
    if (-not $config.pythonPackages.$Version) {
        throw "Unsupported Python version: $Version"
    }
    
    $packageId = $config.pythonPackages.$Version
    Write-Log "Installing Python $Version (Package ID: $packageId)..." -Level Info
    
    if (Confirm-Action -Message "Do you want to install Python $Version?" -Title "Python Installation") {
        $installResult = winget install --id $packageId --scope machine --silent --accept-package-agreements --accept-source-agreements
        
        if ($LASTEXITCODE -ne 0) {
            Write-Log "Python $Version installation failed." -Level Error
            throw "Python installation failed."
        }
        
        Write-Log "Python $Version successfully installed." -Level Success
    }
}

function Verify-PythonInstallation {
    Write-Log "Verifying Python installation..." -Level Info
    
    $pythonPath = Get-Command python.exe -ErrorAction SilentlyContinue
    
    if ($pythonPath) {
        Write-Log "Python is installed and accessible in the PATH." -Level Success
        Write-Log "Python executable location: $($pythonPath.Source)" -Level Info
        
        try {
            $pythonVersion = python --version
            $pipVersion = pip --version
            Write-Log "Python version: $pythonVersion" -Level Info
            Write-Log "Pip version: $pipVersion" -Level Info
        }
        catch {
            Write-Log "Failed to retrieve Python or Pip version." -Level Error
            throw "Python verification failed."
        }
    }
    else {
        throw "Python is not found in the PATH."
    }
}

function Show-Summary {
    Write-Log "`nInstallation Summary:" -Level Info
    Write-Log "Log file location: $logFile" -Level Info
    Write-Log "Python installation status: $(if (Get-Command python.exe -ErrorAction SilentlyContinue) { 'Successful' } else { 'Failed' })" -Level Info
    
    if (Test-Path $logFile) {
        Write-Log "Detailed log has been saved to: $logFile" -Level Info
    }
    
    if ($Interactive) {
        Write-Log "`nPress Enter to continue..." -Level Info
        Read-Host
    }
}

# Main script execution
try {
    if ($Help) {
        Show-Help
    }
    
    if (-not (Test-AdminPrivileges)) {
        Write-Log "This script requires administrative privileges." -Level Warning
        if (Confirm-Action -Message "Do you want to restart with elevated permissions?" -Title "Admin Rights Required") {
            $arguments = $MyInvocation.BoundParameters.GetEnumerator() | ForEach-Object {
                if ($_.Value -is [switch]) {
                    "-$($_.Key)"
                } else {
                    "-$($_.Key) `"$($_.Value)`""
                }
            }
            Start-Process powershell.exe "-ExecutionPolicy Bypass -File `"$PSCommandPath`" $arguments" -Verb RunAs
            exit
        }
        throw "Administrative privileges required."
    }
    
    if (-not (Test-Dependencies)) {
        throw "Dependencies check failed."
    }
    
    if ($ListVersions) {
        Get-AvailableVersions
        exit 0
    }
    
    if ($Interactive) {
        while ($true) {
            $choice = Show-Menu
            switch ($choice) {
                "1" { 
                    $versions = Get-AvailableVersions
                    $Version = Read-Host "Enter the Python version to install"
                    Install-Python -Version $Version
                }
                "2" { Uninstall-Python }
                "3" { Get-AvailableVersions }
                "4" { Get-SystemInfo }
                "5" { exit 0 }
                default { Write-Log "Invalid choice. Please try again." -Level Warning }
            }
        }
    } else {
        if ($Uninstall) {
            Uninstall-Python
        } elseif ($Version) {
            Install-Python -Version $Version
        } else {
            Write-Log "No action specified. Use -Help to see available options." -Level Warning
            exit 1
        }
    }
    
    Verify-PythonInstallation
}
catch {
    Write-Log "An error occurred: $_" -Level Error
    exit 1
}
finally {
    Show-Summary
}
