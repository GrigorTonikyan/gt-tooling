# Python Environment Setup Script
using namespace System.Management.Automation

# Script metadata
$script:ScriptVersion = "1.0.0"
$script:ScriptName = $MyInvocation.MyCommand.Name

# Import command-line parameters
. "$PSScriptRoot/lib/parameters.ps1"

# Import configuration
$script:Config = Get-Content (Join-Path $PSScriptRoot "../config.json") | ConvertFrom-Json
$script:LogFile = Join-Path $PSScriptRoot "../logs/python-setup-$(Get-Date -Format 'yyyyMMdd-HHmmss').log"

# Create log directory if it doesn't exist
New-Item -ItemType Directory -Force -Path (Split-Path $LogFile) | Out-Null

# Import required modules
. "$PSScriptRoot/lib/logging.ps1"
. "$PSScriptRoot/lib/utils.ps1"
. "$PSScriptRoot/lib/menu.ps1"
. "$PSScriptRoot/lib/python.ps1"
. "$PSScriptRoot/lib/winget.ps1"

function Initialize-Environment {
    Write-Log "Initializing environment..." -Level Info
    
    # Verify running in PowerShell Core
    if ($PSVersionTable.PSEdition -ne 'Core') {
        throw "This script requires PowerShell Core. Please install from: https://github.com/PowerShell/PowerShell"
    }
    
    # Check admin privileges
    if (-not (Test-AdminPrivileges)) {
        Write-Log "This script requires administrative privileges." -Level Warning
        if (Confirm-Action -Message "Do you want to restart with elevated permissions?" -Title "Admin Rights Required") {
            $arguments = $MyInvocation.BoundParameters.GetEnumerator() | ForEach-Object {
                if ($_.Value -is [switch]) { "-$($_.Key)" } 
                else { "-$($_.Key) `"$($_.Value)`"" }
            }
            Start-Process pwsh.exe "-ExecutionPolicy Bypass -File `"$PSCommandPath`" $arguments" -Verb RunAs
            exit
        }
        throw "Administrative privileges required."
    }
    
    # Initialize environment variables
    $env:PYTHONIOENCODING = 'utf-8'
    $env:PYTHONUTF8 = '1'
    
    # Set security protocol to TLS 1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
}

function Start-MainExecution {
    try {
        Initialize-Environment
        
        if ($Help) {
            Show-Help
            return
        }
        
        if (-not (Test-Dependencies)) {
            throw "Dependencies check failed."
        }
        
        if ($ListVersions) {
            Get-AvailableVersions
            return
        }
        
        if ($Diagnostic) {
            Show-DiagnosticInfo
            return
        }
        
        if ($Interactive) {
            Show-InteractiveMenu
            return
        }
        
        # Handle command-line mode
        if ($Clean) {
            Remove-AllPythonVersions
        }
        elseif ($Uninstall) {
            Uninstall-Python
        }
        elseif ($Version) {
            Install-Python -Version $Version
        }
        else {
            Write-Log "No action specified. Use -Help to see available options." -Level Warning
            return
        }
        
        # Verify final state
        if (-not $Clean) {
            Verify-PythonInstallation
        }
    }
    catch {
        Write-Log "An error occurred: $_" -Level Error
        
        if ($_.Exception.Message -match "requires PowerShell Core") {
            Write-Log "Please install PowerShell Core from: https://github.com/PowerShell/PowerShell" -Level Info
        }
        
        throw
    }
    finally {
        Show-Summary
    }
}

# Start script execution
Start-MainExecution
