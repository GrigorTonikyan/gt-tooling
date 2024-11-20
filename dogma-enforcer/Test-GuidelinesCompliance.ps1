#Requires -Version 7.3
using namespace System.Text.RegularExpressions

<#
.SYNOPSIS
    Tests PowerShell code for compliance with project guidelines
.DESCRIPTION
    Analyzes PowerShell files for compliance with the project's coding guidelines,
    checking for proper command usage, type declarations, error handling, etc.
#>
function Test-GuidelinesCompliance {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Path,
        
        [Parameter()]
        [switch]$Recurse
    )
    
    begin {
        Write-Verbose "Starting compliance check for path: $Path"
        
        # Load guidelines
        [string]$guidelinesPath = Join-Path $PSScriptRoot 'guidelines-source.json'
        $guidelines = Get-Content $guidelinesPath -Raw | ConvertFrom-Json
        
        # Initialize results
        $results = @{
            TotalFiles = 0
            Violations = @()
        }
        `
        # Define regex patterns based on guidelines
        $patterns = @{
            PowerShellExe          = [regex]::new($guidelines.guidelines.patterns.powerShellExe)
            NoTypeDeclaration      = [regex]::new($guidelines.guidelines.patterns.noTypeDeclaration)
            BackslashPath          = [regex]::new($guidelines.guidelines.patterns.backslashPath)
            NoErrorHandling        = [regex]::new($guidelines.guidelines.patterns.noErrorHandling)
            NoLogging              = [regex]::new($guidelines.guidelines.patterns.noLogging)
            NoCommentHelp          = [regex]::new($guidelines.guidelines.patterns.noCommentHelp)
            ImproperVerb           = [regex]::new($guidelines.guidelines.patterns.improperVerb)
            StringConcatenation    = [regex]::new($guidelines.guidelines.patterns.stringConcatenation)
            ImproperParameterBlock = [regex]::new($guidelines.guidelines.patterns.improperParameterBlock)
            NoParameterValidation  = [regex]::new($guidelines.guidelines.patterns.noParameterValidation)
            GlobalVariables        = [regex]::new($guidelines.guidelines.patterns.globalVariables)
            PositionalParameters   = [regex]::new($guidelines.guidelines.patterns.positionalParameters)
            NoProcessBlock         = [regex]::new($guidelines.guidelines.patterns.noProcessBlock)
            ImproperErrorHandling  = [regex]::new($guidelines.guidelines.patterns.improperErrorHandling)
            NoVerboseOutput        = [regex]::new($guidelines.guidelines.patterns.noVerboseOutput)
            HardcodedPaths         = [regex]::new($guidelines.guidelines.patterns.hardcodedPaths)
        }
    }
    
    process {
        try {
            # Get all PS1 files
            $files = if ($Recurse) {
                Get-ChildItem -Path $Path -Filter *.ps1 -Recurse
            }
            else {
                Get-ChildItem -Path $Path -Filter *.ps1
            }
            
            $results.TotalFiles = $files.Count
            
            foreach ($file in $files) {
                Write-Verbose "Checking file: $($file.Name)"
                $content = Get-Content $file.FullName -Raw
                
                # Check for PowerShell.exe usage
                if ($patterns.PowerShellExe.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Use pwsh instead of powershell/PowerShell.exe'
                        Line     = $patterns.PowerShellExe.Matches($content)[0].Line
                        Severity = 'Error'
                    }
                }
                
                # Check for missing type declarations
                if ($patterns.NoTypeDeclaration.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Missing type declaration'
                        Line     = $patterns.NoTypeDeclaration.Matches($content)[0].Line
                        Severity = 'Warning'
                    }
                }
                
                # Check for backslash in paths
                if ($patterns.BackslashPath.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Use Join-Path instead of backslashes'
                        Line     = $patterns.BackslashPath.Matches($content)[0].Line
                        Severity = 'Error'
                    }
                }
                
                # Check for improper verbs
                if ($patterns.ImproperVerb.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Function name uses non-standard PowerShell verb'
                        Line     = $patterns.ImproperVerb.Matches($content)[0].Line
                        Severity = 'Error'
                    }
                }
                
                # Check for string concatenation
                if ($patterns.StringConcatenation.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Use string interpolation instead of concatenation'
                        Line     = $patterns.StringConcatenation.Matches($content)[0].Line
                        Severity = 'Warning'
                    }
                }
                
                # Check for improper parameter blocks
                if ($patterns.ImproperParameterBlock.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Parameter block should be inside function block'
                        Line     = $patterns.ImproperParameterBlock.Matches($content)[0].Line
                        Severity = 'Error'
                    }
                }
                
                # Check for missing parameter validation
                if ($patterns.NoParameterValidation.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Mandatory parameters should include type declaration'
                        Line     = $patterns.NoParameterValidation.Matches($content)[0].Line
                        Severity = 'Warning'
                    }
                }
                
                # Check for global variables
                if ($patterns.GlobalVariables.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Avoid using global variables'
                        Line     = $patterns.GlobalVariables.Matches($content)[0].Line
                        Severity = 'Error'
                    }
                }
                
                # Check for positional parameters
                if ($patterns.PositionalParameters.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Avoid using positional parameters'
                        Line     = $patterns.PositionalParameters.Matches($content)[0].Line
                        Severity = 'Warning'
                    }
                }
                
                # Check for missing process block
                if ($patterns.NoProcessBlock.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Functions should include process block when using begin/end'
                        Line     = 'N/A'
                        Severity = 'Warning'
                    }
                }
                
                # Check for improper error handling
                if ($patterns.ImproperErrorHandling.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Catch blocks should rethrow or handle errors explicitly'
                        Line     = $patterns.ImproperErrorHandling.Matches($content)[0].Line
                        Severity = 'Error'
                    }
                }
                
                # Check for missing verbose output
                if ($patterns.NoVerboseOutput.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Functions should include Write-Verbose statements'
                        Line     = 'N/A'
                        Severity = 'Warning'
                    }
                }
                
                # Check for hardcoded paths
                if ($patterns.HardcodedPaths.Matches($content)) {
                    $results.Violations += @{
                        File     = $file.Name
                        Rule     = 'Avoid hardcoded paths, use Join-Path or configuration'
                        Line     = $patterns.HardcodedPaths.Matches($content)[0].Line
                        Severity = 'Warning'
                    }
                }
            }
        }
        catch {
            Write-Error "Failed to check compliance: $_"
            throw
        }
    }
    
    end {
        # Generate report
        if ($results.Violations.Count -eq 0) {
            Write-Host "✅ All $($results.TotalFiles) files comply with guidelines" -ForegroundColor Green
        }
        else {
            Write-Host "Found $($results.Violations.Count) violations in $($results.TotalFiles) files:" -ForegroundColor Yellow
            
            # Group violations by severity
            $errorCount = ($results.Violations | Where-Object { $_.Severity -eq 'Error' }).Count
            $warningCount = ($results.Violations | Where-Object { $_.Severity -eq 'Warning' }).Count
            
            if ($errorCount -gt 0) {
                Write-Host "❌ $errorCount Error(s)" -ForegroundColor Red
            }
            if ($warningCount -gt 0) {
                Write-Host "⚠️ $warningCount Warning(s)" -ForegroundColor Yellow
            }
            
            $results.Violations | ForEach-Object {
                $color = if ($_.Severity -eq 'Error') { 'Red' } else { 'Yellow' }
                Write-Host "`nFile: $($_.File)" -ForegroundColor $color
                Write-Host "Rule: $($_.Rule)" -ForegroundColor $color
                Write-Host "Severity: $($_.Severity)" -ForegroundColor $color
                Write-Host "Line: $($_.Line)" -ForegroundColor $color
            }
            
            if ($errorCount -gt 0) {
                throw "Guidelines compliance check failed with $errorCount error(s)"
            }
        }
    }
}

# Example usage:
# Test-GuidelinesCompliance -Path ./lib -Recurse -Verbose
