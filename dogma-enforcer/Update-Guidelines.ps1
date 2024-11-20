#Requires -Version 7.3
using namespace System.Text.Json

<#
.SYNOPSIS
    Generates guidelines documentation from source JSON
.DESCRIPTION
    Reads the guidelines-source.json file and generates both ai-guidelines.md and dev-guidelines.md
    while validating the source against its schema.
#>
function Update-Guidelines {
    [CmdletBinding()]
    param()
    
    begin {
        Write-Verbose "Starting guidelines update process"
        
        # Define paths
        [string]$sourceFile = Join-Path $PSScriptRoot 'guidelines-source.json'
        [string]$schemaFile = Join-Path $PSScriptRoot 'schemas/guidelines-schema.json'
        [string]$aiGuidelinesFile = Join-Path $PSScriptRoot 'ai-guidelines.md'
        [string]$devGuidelinesFile = Join-Path $PSScriptRoot 'dev-guidelines.md'
        
        # Validate paths
        if (-not (Test-Path $sourceFile)) {
            throw "Source file not found: $sourceFile"
        }
        if (-not (Test-Path $schemaFile)) {
            throw "Schema file not found: $schemaFile"
        }
    }
    
    process {
        try {
            # Read and parse files
            [string]$sourceContent = Get-Content $sourceFile -Raw
            [string]$schemaContent = Get-Content $schemaFile -Raw
            
            # Parse JSON
            $guidelines = [JsonSerializer]::Deserialize($sourceContent, [JsonElement])
            $schema = [JsonSerializer]::Deserialize($schemaContent, [JsonElement])
            
            # Validate against schema (placeholder - needs JsonSchema.Net package)
            Write-Verbose "Validating source against schema"
            # TODO: Implement schema validation
            
            # Get current OS
            $currentOS = if ($IsWindows) { "windows" } elseif ($IsLinux) { "linux" } else { "macos" }
            
            # Generate AI Guidelines
            Write-Verbose "Generating AI guidelines"
            [string]$aiContent = @"
# AI Agent Guidelines for Dev Environment Manager

## IMPORTANT INSTRUCTIONS FOR AI AGENTS
This document is specifically formatted for AI language models and code generation agents. Follow these rules strictly when generating or modifying code for this project.

## COMMAND GENERATION RULES
PLATFORM-SPECIFIC SHELL PREFERENCES:

Windows:
Preferred: $($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('windows').GetProperty('preferred').GetProperty('shell').GetString()) $($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('windows').GetProperty('preferred').GetProperty('flags')[0].GetString())
Allowed: $(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('windows').GetProperty('allowed').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')
Prohibited: $(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('windows').GetProperty('prohibited').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')

Linux:
Preferred: $($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('linux').GetProperty('preferred').GetProperty('shell').GetString())
Allowed: $(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('linux').GetProperty('allowed').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')
Prohibited: $(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('linux').GetProperty('prohibited').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')

macOS:
Preferred: $($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('macos').GetProperty('preferred').GetProperty('shell').GetString())
Allowed: $(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('macos').GetProperty('allowed').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')
Prohibited: $(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('platforms').GetProperty('macos').GetProperty('prohibited').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')

## EXAMPLES FOR CURRENT OS ($currentOS):
```powershell
# Correct Usage:
$(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('examples').GetProperty('correct').GetProperty($currentOS).EnumerateArray() | ForEach-Object { $_.GetString() }) -join "`n")

# Incorrect Usage (Avoid these):
$(($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('examples').GetProperty('incorrect').EnumerateArray() | ForEach-Object { $_.GetString() }) -join "`n")
```

## CODE GENERATION REQUIREMENTS
MANDATORY:
1. PowerShell $($guidelines.GetProperty('guidelines').GetProperty('codeGeneration').GetProperty('syntaxRequirements').GetProperty('powershellVersion').GetString()) syntax only
2. Type declarations for ALL parameters
3. PowerShell approved verbs only
4. Comment-based help blocks
5. Platform-agnostic paths

## FUNCTION TEMPLATE - ALWAYS USE THIS STRUCTURE
```powershell
<#
.SYNOPSIS
    [REQUIRED] One-line description
.DESCRIPTION
    [REQUIRED] Detailed description
.PARAMETER ParameterName
    [REQUIRED] Parameter description
.EXAMPLE
    [REQUIRED] Usage example
#>
function Verb-Noun {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [type]$ParameterName
    )
    
    begin {
        Write-Verbose "Starting Verb-Noun"
    }
    
    process {
        try {
            # Main logic here
        }
        catch {
            Write-Error -ErrorRecord $_
            throw
        }
    }
    
    end {
        Write-Verbose "Completed Verb-Noun"
    }
}
```

## VALIDATION CHECKLIST
Before generating/modifying code, verify:
$(($guidelines.GetProperty('guidelines').GetProperty('validation').GetProperty('checklist').EnumerateArray() | ForEach-Object { "- [ ] $($_.GetString())" }) -join "`n")

## VERSION COMPATIBILITY
SUPPORTED:
- PowerShell: $($guidelines.GetProperty('guidelines').GetProperty('compatibility').GetProperty('powershell').GetString())
- Platforms: $(($guidelines.GetProperty('guidelines').GetProperty('compatibility').GetProperty('platforms').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')
- Features: $(($guidelines.GetProperty('guidelines').GetProperty('compatibility').GetProperty('features').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')

## SOURCE OF TRUTH
This document is generated from: ./guidelines-source.json
DO NOT modify this file directly. Update the source file instead.
"@
            
            # Generate Developer Guidelines
            Write-Verbose "Generating developer guidelines"
            [string]$devContent = @"
# Developer Guidelines for Dev Environment Manager

## Overview
This document provides human-readable guidelines for developing and maintaining the Dev Environment Manager.
For automated tools and AI agents, refer to [ai-guidelines.md](./ai-guidelines.md).

## Development Principles
- **Cross-Platform**: Support $(($guidelines.GetProperty('guidelines').GetProperty('compatibility').GetProperty('platforms').EnumerateArray() | ForEach-Object { $_.GetString() }) -join ', ')
- **Modern**: Use PowerShell $($guidelines.GetProperty('guidelines').GetProperty('compatibility').GetProperty('powershell').GetString())
- **Consistent**: Follow established patterns
- **Maintainable**: Clear documentation and tests

## Best Practices

### Command Line Usage
```powershell
# Use PowerShell Core (pwsh)
$($guidelines.GetProperty('guidelines').GetProperty('commandExecution').GetProperty('examples').GetProperty('correct')[0].GetString())

# Include proper error handling
try {
    # Your code
}
catch {
    Write-Error "Failed: `$_"
}
```

### Path Handling
```powershell
# Use Join-Path for cross-platform compatibility
\$configPath = Join-Path \$PSScriptRoot 'config'
```

## Configuration
- Format: $($guidelines.GetProperty('guidelines').GetProperty('configuration').GetProperty('format').GetString())
- Schema Validation Required: $($guidelines.GetProperty('guidelines').GetProperty('configuration').GetProperty('required').GetProperty('schema').GetBoolean())
- Documentation Required: $($guidelines.GetProperty('guidelines').GetProperty('configuration').GetProperty('required').GetProperty('documentation').GetBoolean())

## Source of Truth
This document is generated from: ./guidelines-source.json
Updates should be made to the source file.
"@
            
            # Write files
            Set-Content -Path $aiGuidelinesFile -Value $aiContent
            Set-Content -Path $devGuidelinesFile -Value $devContent
            
            Write-Verbose "Guidelines updated successfully"
        }
        catch {
            Write-Error "Failed to update guidelines: $_"
            throw
        }
    }
    
    end {
        Write-Verbose "Guidelines update process completed"
    }
}

# Run the update
Update-Guidelines -Verbose
